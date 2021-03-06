#!@PATH_TO_PERL@

unshift @INC,"$ENV{ENV_HOME}/bin";
require "env.pl";

use lib "$ENV{EXT_LIB}";
use lib "$ENV{URIS_HOME}/lib";
use lib "$ENV{URIS_HOME}/bin";


#!/site/bin/perl5

# The UMLS Release Information System (URIS) version 2.0
# suresh@nlm.nih.gov 10/2003

# The "main" perl script that calls other modules for each individual action

# CGI params:
# config=
# action=<URIS action>
# other action-specific params





#use lib "$ENV{EXT_LIB}";
#use lib "$ENV{URIS_HOME}/lib";
#use lib "$ENV{URIS_HOME}/bin";
$urisTopDir="/umls_prod/URIS_Root";

use File::Path;
use File::Basename;
use XML::Simple;
use Data::Dumper;
#use ParallelExec;
use UrisUtils;

$urisSrcDir = "$ENV{URIS_HOME}/bin";
$uristitle = "UMLS Release Information System v2.0";
$urisconfig = "$ENV{URIS_HOME}/etc/uris.config";

# Environment
$cgi = $ENV{'SCRIPT_NAME'};
$remoteuser = $ENV{'REMOTE_USER'};
$remotehost = $ENV{'REMOTE_HOST'};
$fontsize="-1";
$fs = "<FONT SIZE=$fontsize>";
$fe = "</FONT>";

use CGI;
$query = new CGI;

$action = $query->param('action') || "home";
$urisactions = UrisUtils->loadClientConfig("$urisTopDir/actions.xml");

eval { require $urisSrcDir . "/" . $action . ".pl"; };
if ($@) {
  $html .= $query->header;
  $html .= $query->start_html($uristitle);
  $html .= "Error in action: $action";
  $html .= $query->pre("\n$@\n");
  $html .= $query->end_html;
  print $html;
  exit 0;
}
&$action;
exit 0;

