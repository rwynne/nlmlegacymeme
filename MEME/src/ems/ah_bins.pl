# suresh@nlm.nih.gov 10/98
# suresh@nlm.nih.gov 1/00 - Modified for Oracle
# suresh@nlm.nih.gov 7/05 - Mods for EMS3

# CGI params
# order_by=
# reload= (forces the config file to be reloaded)

# Show the data for currently defined AH bins
sub do_ah_bins {
  my($html);
  my($bin, @bins);
  my($binconfig, $bininfo);
  my($AHCONFIGTABLE) = $EMSNames::AHCONFIGTABLE;
  my($BININFOTABLE) = $EMSNames::BININFOTABLE;
  my($binnum);
  my($x);
  my(@d);
  my($order_by) = $query->param('order_by') || "rank";
  my(@order_by) = qw(bin_name rank);

  $order_by = "lower($order_by)" if ($order_by eq "bin_name");

  eval { EMSUtils->ahconfig2table($dbh, EMSUtils->configfile($dbh, "AH"), $AHCONFIGTABLE, $query->param('reload')) };
  if ($@) {
    $html = $@;
    &printhtml({title=>'EMS: AH Bins', body=>$query->pre($html), printandexit=>1});
  }
  $sql = "select bin_name from $AHCONFIGTABLE order by $order_by";

  @bins = $dbh->selectAllAsArray($sql);

  $html .= $query->start_form;
  $html .= "Order bins by: " .
    $query->popup_menu({-name=>'order_by', -values=>\@order_by, -default=>$order_by, -onChange=>'submit();'});
  $html .= $DBpost;
  $html .= $query->hidden(-name=>'action', -value=>$action, -override=>1);
  $html .= " " . $query->submit;
  $html .= $query->end_form;

  $html .= $query->p;

# add the table header
  $row = "";
  $row .= $query->th({colspan=>3}, '');
  $row .= $query->th({colspan=>3}, '# Clusters');
  $row .= $query->th({colspan=>2}, '');
  push @rows, $row . "\n";

  $row = "";
  $row .= $query->th(['', "Bin", "Clusters", "All", "Uneditable", "Editable", "Generated", "Actions"]);
  push @rows, $row . "\n";

  $binnum=0;
  foreach $bin (@bins) {
    $row = "";
    $binnum++;
    $binconfig = EMSUtils->getBinconfig($dbh, $AHCONFIGTABLE, $bin);
    $bininfo = EMSUtils->getBininfo($dbh, $bin);
    $rowspan = (uc($binconfig->{content_type}) eq "MIXED" ? 4 : 1);

    if ($query->param('bin_name') && $query->param('bin_name') eq $bin) {
      $row .= $query->td({-rowspan=>$rowspan, bgcolor=>'#F6F6C4', align=>'right'}, $binnum);
    } else {
      $row .= $query->td({-rowspan=>$rowspan, align=>'right'}, $binnum);
    }

    if (EMSBinlock->islocked($dbh, {bin_name=>$bin})) {
      $imgurl = $main::EMSCONFIG{EMSIMGURL} . "/lock.gif";
    } else {
      $imgurl = $main::EMSCONFIG{EMSIMGURL} . "/info.gif";
    }

    $q = $query->img({-src=>$imgurl,
		      -alt=>($binconfig->{description} || $binconfig->{bin_name}),
		      -title=>($binconfig->{description} || $binconfig->{bin_name})});
    $row .= $query->td({-rowspan=>$rowspan}, $q . " " . $binconfig->{bin_name});

    if (uc($binconfig->{content_type}) eq "MIXED") {
      $row .= $query->td($query->strong("All"));
      $row .= $query->td({-align=>'right'}, defined($bininfo->{totalClusters}) ? $bininfo->{totalClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{totalUneditableClusters}) ? $bininfo->{totalUneditableClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{totalClusters}) ? $bininfo->{totalClusters}-$bininfo->{totalUneditableClusters} : "n/a");

      $row .= $query->td({rowspan=>4, valign=>'top'}, &stats_table($bininfo));
      $row .= $query->td(&action_table($binconfig, $bininfo, "all"));
      push @rows, $row;

      $row = "";
      $row .= $query->td($query->strong("Chem"));
      $row .= $query->td({-align=>'right'}, defined($bininfo->{chemClusters}) ? $bininfo->{chemClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{chemUneditableClusters}) ? $bininfo->{chemUneditableClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{chemClusters}) ? $bininfo->{chemClusters}-$bininfo->{chemUneditableClusters} : "n/a");

      $row .= $query->td(&action_table($binconfig, $bininfo, "chem"));
      push @rows, $row;

      $row = "";
      $row .= $query->td($query->strong("Clinical"));
      $row .= $query->td({-align=>'right'}, defined($bininfo->{clinicalClusters}) ? $bininfo->{clinicalClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{clinicalUneditableClusters}) ? $bininfo->{clinicalUneditableClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{clinicalClusters}) ? $bininfo->{clinicalClusters}-$bininfo->{clinicalUneditableClusters} : "n/a");

      $row .= $query->td(&action_table($binconfig, $bininfo, "clinical"));
      push @rows, $row;

      $row = "";
      $row .= $query->td($query->strong("Other"));
      $row .= $query->td({-align=>'right'}, defined($bininfo->{otherClusters}) ? $bininfo->{otherClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{otherUneditableClusters}) ? $bininfo->{otherUneditableClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{otherClusters}) ? $bininfo->{otherClusters}-$bininfo->{otherUneditableClusters} : "n/a");

      $row .= $query->td(&action_table($binconfig, $bininfo, "other"));
      push @rows, $row;

    } else {

      $row .= $query->td($query->strong("All"));
      $row .= $query->td({-align=>'right'}, $bininfo->{totalClusters});
      $row .= $query->td({-align=>'right'}, defined($bininfo->{totalUneditableClusters}) ? $bininfo->{totalUneditableClusters} : "n/a");
      $row .= $query->td({-align=>'right'}, defined($bininfo->{totalClusters}) ? $bininfo->{totalClusters}-$bininfo->{totalUneditableClusters} : "n/a");

      $row .= $query->td({valign=>'top'}, &stats_table($bininfo));
      $row .= $query->td(&action_table($binconfig, $bininfo));
      push @rows, $row . "\n";
    }
  }
  $html .= $query->table({border=>1, cellpadding=>5, cellspacing=>0, width=>'90%'}, $query->Tr(\@rows));

  &printhtml({title=>'EMS: AH Bins', h1=>"EMS: AH Bins", body=>$html});
  return;
}

sub stats_table {
  my($b) = @_;
  my(@d);

  push @d, [[{align=>'right'}, $query->strong("On:")], (defined($b->{generation_date}) ? $b->{generation_date} : "n/a")];
  push @d, [[{align=>'right'}, $query->strong("By:")], (defined($b->{generation_user}) ? $b->{generation_user} : "n/a")];
  push @d, [[{align=>'right'}, $query->strong("In:")], (defined($b->{generation_time}) ? GeneralUtils->sec2hms($b->{generation_time}) : "n/a")];

  return &toHTMLtable($query, {-border=>0, -cellpadding=>0, -cellspacing=>0}, \@d);
}

sub action_table {
  my($binconfig, $bininfo, $content_type) = @_;
  my(@d);
  my($order_by) = $query->param('order_by');

  if (!$content_type || lc($content_type) eq "all") {
    push @d, [$query->a({href=>$query->url() . "?action=ah_generate&$DBget&order_by=$order_by&bin_name=" . $binconfig->{bin_name}}, "Generate")];
    push @d, [$query->a({href=>$query->url() . "?action=update_counts&$DBget&order_by=$order_by&bin_name=" . $binconfig->{bin_name}}, "Refresh counts")];
    push @d, [$query->a({href=>'https://wiki.nlm.nih.gov/confluence/display/UE/Unimed+Bin+Comments#UnimedBinComments-'.$binconfig->{bin_name}}, "Comments")];
  }

  if (
      (uc($binconfig->{content_type}) ne "MIXED" || lc($content_type) ne "all" || !$content_type)) {
    push @d, [$query->a({href=>$query->url() . "?action=checklist&$DBget&content_type=$content_type&bin_name=" . $binconfig->{bin_name}}, "Checklist")];
    push @d, [$query->a({href=>$query->url() . "?action=worklist&$DBget&content_type_wanted=$content_type&bin_name=" . $binconfig->{bin_name}}, "Worklist")];
  }
  return &toHTMLtable($query, {-border=>0, -cellpadding=>0, -cellspacing=>0}, \@d);
}
1;
