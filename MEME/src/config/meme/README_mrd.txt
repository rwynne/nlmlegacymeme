Version Information
-------------------
RELEASE=4
VERSION=9.0
DATE=20060808
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o FullORFReleaseHandler no longer calls bogus fakeMRDOCSuppressRows method in MMSYS.
 
 o Gold script logic for MRCUI deleted cui count improved.  Also a comment
   was corrected (was missing a leading #)
 
 o Last_release_rank support now in tmp_classes, mrd_classes and the
   generate_core_data_states('C') mapping function in MRD_OPERATIONS.
   
 o MTH ATN names computed for MRSAB instead of hard coded
 
 o qa_checks.csh relaxes a couple of ERROR conditions to WARNING.  Also correctly
   handles an empty MRCOC.RRF
 
 o qa_counts.csh more tolerant of linux.
 

See INSTALL.txt for installation instructions

Old Release Information
-----------------------
RELEASE=4
VERSION=8.0
DATE=20060627
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o gold_script.csh for MRDOC updated to reflect new CVF metadata handling.
 
 o initialize_mrd.csh now includes coc_headings and coc_subheadings
   as tables whose MRD states are initialized.  This is necessary
   because of the new practice of MEDLINE processing in the MID.
   
 o MED<year> ATUI semantics now properly implemented by release_maintenance.cgi

 o Medline handling creates MRDOC properties umls.medline.date and umls.medline.file
 
 o MRD_RELEASE_OPERATIONS.mrdoc_prepare no longer includes CVF metadata.

 o MRD_RELEASE_OPERATIONS.mrconso_prepare computes initial TS, STT, and ISPREF values.

 o MRD_RELEASE_OPERATIONS.mrsat_prepare utilizes new ATUI algorithm.

RELEASE=4
VERSION=7.0
DATE=20060511
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o gold_script.csh has minor bug fixes for MRDOC and for
   MetaMorphoSys (needed to LPAD termgroup_rank).

 o MRD_RELEASE_OPERATIONS.sql sets MTH attribute names in MRSAB correctly.

 o Source metadata report implemented fully.
 
 o qa_checks.csh allows CXTY entries in MRDOC.RRF
 RELEASE=4
VERSION=6.0
DATE=20060331
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o MetamorphoSys make_config.csh script supports 'build indexes' property

 o MRD_OPERATIONS syntax error correction.
 
 o MRD_RELEASE_OPERATIONS small bug fix for MR attribute lookups.  Also added
   attribute_level to MR, DA, and ST lookups.
 
 o MRD_RELEASE_OPERATIONS fixes to apply_cvf to correctly implement the new 
   mrd_content_view_members logic.
    
 o Default mrd.prop_orig file was updated to remove properites relating to sending email
   as the new regime uses MID services instead of properties. 
  
 o FullMRFilesReleaseGenerator now uses MID Services for sending email instead of
   using properties from the file.

RELEASE=4
VERSION=5.0
DATE=20060314
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o Content view members representation and handling changed.  Instead of
   representing one row per content view UI, we represent one row per UI
   and the "code" is the full bit map containing all values for content
   views that utilize that UI.  The cascade field is also included so that
   cascading views are represented together and non-cascading views are
   represented together.  This resulted in a schema change for the
   mrd_content_view_members table as well as changes to the MRD_OPERATIONS
   and MRD_RELEASE_OPERATIONS code for handling the table. This change
   was needed to support large numbers of content views.
   
 o MRD_OPERATIONS handles DA, MR, and ST attribute ATUIs according to the
   new spec, by using CUI as the id and including the attribute value for
   MR and ST attributes.  Even the 00000000 case is handled properly.
   
 o MetamorphoSys component now validates computation of TS, STT, and ISPREF
   in output MRCONSO.RRF

RELEASE=4
VERSION=4.0
DATE=20060214
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o Bug fixes to medline handling, including properly handling
   source_coc_headings_todelete and handling an empty coc_headings.dat file.

 o Bug fix for ORF qa checks routine for MRCON.

 o Command line utility for release target stages was implemented
  
 o gold_script.csh does a better job computing "value_cnt" for MRDOC, was updated
   to allow MRX computations to ignore certain strings on the LVG stop word list,
   and no longer refers to classes_feedback.

 o FullDOCReleaseHandler correctly names the report generated for MRCOC sources.
 
 o FullORFReleaseHandler updated to properly initialize MMSYS "Suppressible" objects
   so that full ORF output subset has correct MRRANK.SUPPRESS values. Included
   an added call to MMSToolkit.fakeMRDOCSuppressRows()
 
 o make_config.csh now properly computes rel_types.dat for MMSYS.  Also changed
   to use OS commands to move config files to $MMSYS_DIR/MMSYS/config directory.
   Previously the java File.renameTo was being used which fails when trying to
   move files across file systems.  A "suppress" property was also added to
   mmsys.*.prop so that MMSYS can properly initialize Suppressible objects from
   the config file.

 o MRD_OPERATIONS.sql and mrd_tables.sql were updated to accommodate 8-digit AUIs. 

 o MRD_RELEASE_OPERATIONS no longer refers to "classes_feedback" and a change was 
   made to MRSAB computation to remove MTH_UMLSMAPSETSEPARATOR from the MTH
   attribute list.  

 o mrd_tables.sql script sets attribute_value for mrd_attributes to match attributes,
   also remove creation of classes_feedback table.
 
 o qa_checks.csh updated to support longer AUIs, to handle Linux better and be
   looser with CUI formats.  It also supports better comparison of MRDOC when
   generated by the MetaMorphoSys target's validate method (ignores the release_info
   entries).
 
 o TargetDetails page now supports viewing a dynamically generated QA report.
 
RELEASE=4
VERSION=3.0
DATE=20060106
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o Tools to run Medline processing outside of the DB added.  This approach is faster
   and can be run before initialize_mrd.csh is run.
 
 o mrd_tables.sql sets the date format explicitly before the creation of 
   mrd_coc_headings.
 
 o ORF Checks updated to compare ORF to RRF

RELEASE=4
VERSION=2.0
DATE=20051206
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o Gold script (gold_script.csh) fixes, including: adjustment to MRCUI
   cui2_cnt to account for empty CUI2 values.
   
 o Medline handling changed to accommodate these:
   - Stop processing medline records when create date exceeds start date
   - Ignore records within a doc if publication date > release date
   - Affects: ReleaseClient, MedlineHandler, FullMRFilesReleaseGenerator,
     ReleaseGenerator, medline_parser.pl, update_medline_data.pl
          
 o Changes to qa_checks.csh to have better MRAUI field validation, to handle
   the default empty LUI for MRX comarisons
  
 o Changes to qa_counts.csh to have sab_scui_cnt and sab_suppress_tally for MRCONSO
 
 o Changes to gold_script.csh to have sab_sui_cnt and sab_suppress_tally  for MRCONSO 

 o MRD Server (mrd_server.sh) log name now includes process id.  This allows
   multiple servers to be started at the same time on the same machine without
   trashing the log.
 
 o FullMetaMorphoSysReleaseHandler passes release dir properly when calling
   make_config.csh
   
 o make_config.csh updated to compute suppressed_suis according to the new
   suppressible algorithm (looking for E not Y).

 o MRDActionEngine was updated to not log MRD actions (like adding medline patterns).
 
 o FullMRXReleaseHandler had a small change to catch Exception instead of 
   RuntimeException, hopefully better reporting LVG config problems.

 o MRD_RELEASE_OPERATIONS.sql updated to build MRCUI.RRF DEL rows with 
   MAPIN=null instead of N.

 o Updated initialize_mrd.csh: the section that loads registered_handlers now
   orders the row_sequence in the same way as release targets appear on the 
   Release Summary page.  This way, users can expect that when multiple components 
   are queued, they will be procesed in the order in which they appear.
 

RELEASE=4
VERSION=1.0
DATE=20051028
AUTHORITY=BAC

This release of the MRD Server should contain everything needed to operate MRD
tools and services.  Notable updates include:

 o Fixes to orf_counts to allow parallel processes to overlap successfully. 
 
 o Fixes to initialize_mrd.csh to make it look/work more like update_mrd.csh.
 
 o Fixes to medline_parser.pl and MedlineHandler to set CLASSPATH properly and
   to remove references to the medline.prop file.
   
 o Fixes to gold_script.csh to count MRCONSO.SUPPRESS properly.  Also updated
   to count the sources properly for MRSAB.  Also updated to check for 
   suppressible='E' things when finding MRCONSO suppressible termgroups.
 
 o Fixes to qa_checks.csh to handle submission mode better.  Also was updated
   to ignore SUPPRESS=O when comparing MRCONSO SAB,TTY,SUPPRESS to MRRANKs.
   This applies to the RXNORM OBD,OCD term types.  Also updated to ignore
   definitions whose SAB start with MTH but do not have corresponding SAB
   atoms in MRCONSO (with matching CUI). This was done to accommodate an
   MTHHL7 source that created a 7-bit transformation of a definition connected
   to an HL7 atom.  Also updated to allow MRMAP entries with null TOEXPR in
   the case it is SNOMEDCT and connects to the empty target id.
  
 o MRDActionEngine was created and is now returned by MRDConnection's
   getActionEngine method.  This was needed to allow the adding of a new
   MEDLINE pattern.  

 o MRD_RELEASE_OPERATIONS.sql updated to preserve LAT values in MRSAB for
   obsolete sources picked up by TOVSAB and FROMVSAB entries in MRSAT.
   
 o extlib lvg2005dist.jar file was updated to allow MRX to properly connect
   to LVG software.

