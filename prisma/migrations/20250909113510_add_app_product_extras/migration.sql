-- CreateTable
CREATE TABLE "__refactorlog" (
    "operationkey" UUID NOT NULL,

    CONSTRAINT "pk____refact__d3aeffdb190ede1f" PRIMARY KEY ("operationkey")
);

-- CreateTable
CREATE TABLE "_dailyschedule" (
    "day" VARCHAR(255),
    "Sort Order" DOUBLE PRECISION,
    "month" DOUBLE PRECISION
);

-- CreateTable
CREATE TABLE "apcontent" (
    "pageid" VARCHAR(100) NOT NULL,
    "pagehtml" TEXT NOT NULL,

    CONSTRAINT "pk_apcontent_590729257" PRIMARY KEY ("pageid")
);

-- CreateTable
CREATE TABLE "apinspection" (
    "inspectionid" BIGSERIAL NOT NULL,
    "jobitemid" INTEGER NOT NULL,
    "adnumber" VARCHAR(50),
    "advertiser" VARCHAR(255),
    "caption" VARCHAR(255),
    "runasis" DECIMAL(1,0),
    "inspectedby" VARCHAR(255),
    "inspectiondeadline" VARCHAR(50),
    "typereceived" VARCHAR(50),
    "quantity" INTEGER,
    "isswopcertified" DECIMAL(1,0),
    "hasswopcolorbars" DECIMAL(1,0),
    "hasothercolorbars" DECIMAL(1,0),
    "hasseperateproof" DECIMAL(1,0),
    "iscontentproofmatchcolor" DECIMAL(1,0),
    "fileformat" VARCHAR(255),
    "resolution" VARCHAR(50),
    "trimwidth" VARCHAR(10),
    "trimheight" VARCHAR(10),
    "isbleed" DECIMAL(1,0),
    "issafety" DECIMAL(1,0),
    "colortype" INTEGER,
    "tonaldensity" VARCHAR(50),
    "isadjustmentrequired" DECIMAL(1,0),
    "isoktoadjust" DECIMAL(1,0),
    "isnewfilesupplied" DECIMAL(1,0),
    "isfontsembedded" DECIMAL(1,0),
    "missingfonts" VARCHAR(255),
    "isblack" DECIMAL(1,0),
    "iswhitesmaller" DECIMAL(1,0),
    "notifiedwho" VARCHAR(255),
    "notifieddate" VARCHAR(50),
    "solution" VARCHAR(1000),
    "replacementaccepteddate" VARCHAR(50),
    "comments" VARCHAR(1000),
    "ispassed" INTEGER,
    "assignedto" VARCHAR(255),
    "assignedon" VARCHAR(10),
    "qualitycontrolto" VARCHAR(255),
    "qualitycontrolon" VARCHAR(10),
    "finaltoprinteron" VARCHAR(10),
    "proofreceivedon" VARCHAR(10),

    CONSTRAINT "pk_apinspection_622729371" PRIMARY KEY ("inspectionid")
);

-- CreateTable
CREATE TABLE "apjob" (
    "jobid" BIGSERIAL NOT NULL,
    "gscustomerid" INTEGER NOT NULL,
    "gscontractid" INTEGER NOT NULL,
    "tenantid" UUID NOT NULL,
    "type" SMALLINT NOT NULL,
    "createddate" TIMESTAMP(6),
    "modifieddate" TIMESTAMP(6),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_apjob_654729485" PRIMARY KEY ("jobid")
);

-- CreateTable
CREATE TABLE "apjobheader" (
    "jobid" BIGINT NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "companyname" VARCHAR(100) NOT NULL,
    "publication" VARCHAR(100),
    "issue" VARCHAR(100),
    "comments" VARCHAR(255),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "apjobitem" (
    "jobitemid" BIGSERIAL NOT NULL,
    "jobid" BIGINT NOT NULL,
    "filename" VARCHAR(255) NOT NULL,
    "maskedfilename" VARCHAR(255),
    "imagekey" VARCHAR(36),
    "status" INTEGER NOT NULL DEFAULT 0,
    "createddate" TIMESTAMP(6) NOT NULL,
    "modifieddate" TIMESTAMP(6),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_apjobitem_734729770" PRIMARY KEY ("jobitemid")
);

-- CreateTable
CREATE TABLE "apreportcolumn" (
    "tenantid" UUID NOT NULL,
    "pageid" VARCHAR(100) NOT NULL,
    "columntext" VARCHAR(50) NOT NULL,
    "columnindex" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "apusersettings" (
    "userid" UUID NOT NULL,
    "pageid" VARCHAR(255) NOT NULL,
    "settings" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "cmusersetting" (
    "userid" VARCHAR(36) NOT NULL,
    "applicationid" VARCHAR(36) NOT NULL,
    "objectid" VARCHAR(100) NOT NULL,
    "content" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "dev_29070_tblcontactpageconf" (
    "id" SERIAL NOT NULL,
    "section" VARCHAR(100) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "allowdisplay" DECIMAL(1,0) NOT NULL,
    "usercontrolurl" VARCHAR(500),
    "fieldsetid" VARCHAR(150),
    "showadd" DECIMAL(1,0),
    "showrefresh" DECIMAL(1,0),
    "showgoto" DECIMAL(1,0),
    "expandhandler" TEXT,
    "addcalling" TEXT,
    "refreshcalling" TEXT,
    "gotocalling" TEXT,
    "collapsehandler" TEXT,
    "beforeexpandhandler" TEXT,
    "forcrm" DECIMAL(1,0),
    "forcompany" DECIMAL(1,0),
    "forcontact" DECIMAL(1,0),
    "foradagency" DECIMAL(1,0),
    "foradagencycontact" DECIMAL(1,0),
    "forrelatedcompany" DECIMAL(1,0),
    "foraddnew" DECIMAL(1,0),
    "showcount" DECIMAL(1,0),
    "foreditdoexpand" DECIMAL(1,0),
    "fornewdoexpand" DECIMAL(1,0),
    "addtooltip" VARCHAR(100),
    "gototooltip" VARCHAR(100),
    "parentid" INTEGER,
    "customfieldcategory" VARCHAR(100),
    "showedit" DECIMAL(1,0),
    "allowcount" DECIMAL(1,0),
    "sadisplay" DECIMAL(1,0) NOT NULL,
    "allowrefresh" DECIMAL(1,0) NOT NULL,
    "pagetype" INTEGER,
    "sitetype" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "dev_29268_tblnavbar" (
    "description" VARCHAR(100),
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100),
    "url" VARCHAR(255),
    "admin" DECIMAL(1,0),
    "sortorder" INTEGER,
    "imagepath" VARCHAR(255),
    "newwindow" DECIMAL(1,0),
    "visible" DECIMAL(1,0),
    "icon" VARCHAR(100),
    "tooltip" VARCHAR(500),
    "navbartypeid" INTEGER,
    "accesslevel" VARCHAR(30),
    "movelevel" VARCHAR(30),
    "urlsource" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "dev_29390_taxgroupbyproduct" (
    "id" SERIAL NOT NULL,
    "groupname" VARCHAR(50) NOT NULL,
    "country" VARCHAR(50),
    "state" VARCHAR(10),
    "city" VARCHAR(50),
    "isapplytaxautomatically" DECIMAL(1,0),
    "displayname" VARCHAR(100),
    "isactive" DECIMAL(1,0),
    "productid" INTEGER,
    "isproduct" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "dev_30811_tblnavbar" (
    "description" VARCHAR(100),
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100),
    "url" VARCHAR(255),
    "admin" DECIMAL(1,0),
    "sortorder" INTEGER,
    "imagepath" VARCHAR(255),
    "newwindow" DECIMAL(1,0),
    "visible" DECIMAL(1,0),
    "icon" VARCHAR(100),
    "tooltip" VARCHAR(500),
    "navbartypeid" INTEGER,
    "accesslevel" VARCHAR(30),
    "movelevel" VARCHAR(30),
    "urlsource" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "dtproperties" (
    "id" SERIAL NOT NULL,
    "objectid" INTEGER,
    "property" VARCHAR(64) NOT NULL,
    "value" VARCHAR(255),
    "uvalue" VARCHAR(255),
    "lvalue" BYTEA,
    "version" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "pk_dtproperties_1261247548" PRIMARY KEY ("id","property")
);

-- CreateTable
CREATE TABLE "gsactivities" (
    "gsactivitiesid" SERIAL NOT NULL,
    "gscustomersid" INTEGER,
    "notes" TEXT,
    "datestarted" TIMESTAMP(6),
    "dateadded" TIMESTAMP(6),
    "enabled" DECIMAL(1,0),
    "callback" TIMESTAMP(6),
    "called" DECIMAL(1,0),
    "meeting" TIMESTAMP(6),
    "meetingtype" INTEGER,
    "gsemployeesid" INTEGER,
    "salesresults" INTEGER,
    "meetingend" TIMESTAMP(6),
    "meetingdesc" VARCHAR(255),
    "completed" DECIMAL(1,0) DEFAULT 0,
    "activitytype" INTEGER,
    "private" DECIMAL(1,0),
    "importfileid" INTEGER,
    "importid" INTEGER,
    "datecompleted" TIMESTAMP(6),
    "viewed" DECIMAL(1,0) DEFAULT 0,
    "dateviewed" TIMESTAMP(6),
    "iscall" DECIMAL(1,0) DEFAULT 0,
    "isemail" DECIMAL(1,0) DEFAULT 0,
    "isletter" DECIMAL(1,0) DEFAULT 0,
    "gstaskid" INTEGER,
    "createdbyid" INTEGER,
    "emailmessageid" VARCHAR(250),
    "gscontractsid" INTEGER,
    "ismassemail" DECIMAL(1,0) DEFAULT 0,
    "issystem" DECIMAL(1,0) DEFAULT 1,
    "assignedby" INTEGER,
    "iscompany" DECIMAL(1,0),
    "campaignid" TEXT,
    "ispinned" DECIMAL(1,0),
    "isaischeduled" DECIMAL(1,0),
    "calldisposition" INTEGER,
    "calldispositiontext" TEXT,

    CONSTRAINT "pk_gsactivities_866206236" PRIMARY KEY ("gsactivitiesid")
);

-- CreateTable
CREATE TABLE "gsadcolor" (
    "colorid" SERIAL NOT NULL,
    "colorcode" VARCHAR(50) DEFAULT '',
    "numberofcolors" INTEGER DEFAULT 0,
    "description" VARCHAR(1000) DEFAULT '',
    "sortorder" INTEGER,
    "ratecardid" INTEGER DEFAULT -1,
    "subproducttypeid" INTEGER,

    CONSTRAINT "pk_gscolors_2133582639" PRIMARY KEY ("colorid")
);

-- CreateTable
CREATE TABLE "gsadcolumn" (
    "columnid" SERIAL NOT NULL,
    "columnname" INTEGER,
    "ratecardid" INTEGER,
    "subproducttypeid" INTEGER,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),

    CONSTRAINT "pk_gsadcolumn_1093071130" PRIMARY KEY ("columnid")
);

-- CreateTable
CREATE TABLE "gsadfrequency" (
    "frequencyid" SERIAL NOT NULL,
    "frequency" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "ratecardid" INTEGER DEFAULT -1,
    "subproducttypeid" INTEGER,

    CONSTRAINT "pk_gsadfrequency_2099048" PRIMARY KEY ("frequencyid")
);

-- CreateTable
CREATE TABLE "gsadinch" (
    "inchid" SERIAL NOT NULL,
    "inches" DECIMAL(10,5) NOT NULL,
    "ratecardid" INTEGER,
    "subproducttypeid" INTEGER,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),

    CONSTRAINT "pk_gsadinch_1125071244" PRIMARY KEY ("inchid")
);

-- CreateTable
CREATE TABLE "gsadposition" (
    "positionid" SERIAL NOT NULL,
    "position" VARCHAR(1000) DEFAULT '',
    "sortorder" INTEGER,
    "ratecardid" INTEGER DEFAULT -1,
    "subproducttypeid" INTEGER,

    CONSTRAINT "pk_gsadposition_18099105" PRIMARY KEY ("positionid")
);

-- CreateTable
CREATE TABLE "gsadsize" (
    "gsadsizeid" SERIAL NOT NULL,
    "adsizename" VARCHAR(100),
    "adsizeactual" DOUBLE PRECISION DEFAULT 0,
    "cols" DECIMAL(18,3) DEFAULT 0,
    "inches" DECIMAL(18,3) DEFAULT 0,
    "sortorder" INTEGER,
    "ratecardid" INTEGER DEFAULT -1,
    "subproducttypeid" INTEGER,
    "itemcode" VARCHAR(50),

    CONSTRAINT "pk_gsadsize_1129771082" PRIMARY KEY ("gsadsizeid")
);

-- CreateTable
CREATE TABLE "gsannounce" (
    "gsannounceid" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "dateadded" TIMESTAMP(6),
    "subject" VARCHAR(100),
    "announce" TEXT,
    "sortorder" INTEGER,
    "editorjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "thumbnailimage" TEXT,

    CONSTRAINT "pk_gsannounce_50099219" PRIMARY KEY ("gsannounceid")
);

-- CreateTable
CREATE TABLE "gsannouncedeleted" (
    "gsannounceid" INTEGER NOT NULL,
    "gsemployeesid" INTEGER,
    "dateadded" TIMESTAMP(6),
    "subject" VARCHAR(100),
    "announce" TEXT,
    "sortorder" INTEGER,
    "deletedby" INTEGER,
    "deleteddate" TIMESTAMP(6),
    "editorjson" TEXT,

    CONSTRAINT "pk_gsannouncedeleted_2008550389" PRIMARY KEY ("gsannounceid")
);

-- CreateTable
CREATE TABLE "gscategories" (
    "gscategoriesid" SERIAL NOT NULL,
    "catname" VARCHAR(100),

    CONSTRAINT "pk_gscategories_66099276" PRIMARY KEY ("gscategoriesid")
);

-- CreateTable
CREATE TABLE "gschangeorder2charges" (
    "id" SERIAL NOT NULL,
    "changeorderid" INTEGER,
    "insertionorderid" INTEGER,
    "gscontractschargesid" INTEGER NOT NULL,
    "percentage" DOUBLE PRECISION,
    "amount" DOUBLE PRECISION,
    "charge" DOUBLE PRECISION NOT NULL,
    "notes" VARCHAR(1000),
    "useroverride" DECIMAL(1,0) NOT NULL
);

-- CreateTable
CREATE TABLE "gscirculationpmttype" (
    "gscircpmtid" SERIAL NOT NULL,
    "name" VARCHAR(100),

    CONSTRAINT "pk_gscirculationpmttype_98099390" PRIMARY KEY ("gscircpmtid")
);

-- CreateTable
CREATE TABLE "gscolumns" (
    "gscolumnsid" INTEGER NOT NULL,
    "name" VARCHAR(24),
    "description" VARCHAR(64)
);

-- CreateTable
CREATE TABLE "gscontacttype" (
    "gscontacttypeid" SERIAL NOT NULL,
    "name" VARCHAR(100),
    "canedit" DECIMAL(1,0) DEFAULT 1,
    "enabled" DECIMAL(1,0) DEFAULT 1,
    "sortorder" INTEGER,

    CONSTRAINT "pk_gscontacttype_2127554863" PRIMARY KEY ("gscontacttypeid")
);

-- CreateTable
CREATE TABLE "gscontacttype_real" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) DEFAULT '',
    "canedit" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk_gscontacttype_real_2143554920" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gscontacttypedetails" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER NOT NULL,
    "gscontacttypeid" INTEGER NOT NULL,
    "iscompany" DECIMAL(1,0),

    CONSTRAINT "pk_gscontacttypedetails_12071329" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gscontractimages" (
    "imagesid" SERIAL NOT NULL,
    "imagename" VARCHAR(250),
    "imagefullpath" VARCHAR(2000),
    "position" VARCHAR(100),
    "gscontractsdataid" INTEGER
);

-- CreateTable
CREATE TABLE "gscontractimages_dev_32074" (
    "imagesid" SERIAL NOT NULL,
    "imagename" VARCHAR(250),
    "imagefullpath" VARCHAR(2000),
    "position" VARCHAR(100),
    "gscontractsdataid" INTEGER
);

-- CreateTable
CREATE TABLE "gscontracts" (
    "gscontractsid" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "yr" INTEGER NOT NULL,
    "mnth" INTEGER NOT NULL,
    "pubid" INTEGER NOT NULL,
    "net" DECIMAL(19,4),
    "gross" DECIMAL(19,4),
    "barter" DECIMAL(19,4),
    "adsize" INTEGER,
    "columninches" DECIMAL(18,4) DEFAULT 0,
    "columns" DECIMAL(18,4) DEFAULT 0,
    "adsection" INTEGER,
    "adpositioning" VARCHAR(255),
    "dateadded" TIMESTAMP(6),
    "prodcharge" DOUBLE PRECISION,
    "status1" TIMESTAMP(6),
    "status2" TIMESTAMP(6),
    "status3" TIMESTAMP(6),
    "status4" TIMESTAMP(6),
    "status5" TIMESTAMP(6),
    "status6" TIMESTAMP(6),
    "status8" TIMESTAMP(6),
    "status7" TIMESTAMP(6),
    "adnumber" INTEGER,
    "posreq1" VARCHAR(1000),
    "posreq2" DECIMAL(1,0),
    "posreq3" DECIMAL(1,0),
    "posreq4" DECIMAL(1,0),
    "posreq5" INTEGER DEFAULT 0,
    "acttime" INTEGER,
    "esttime" INTEGER,
    "designer1" INTEGER,
    "designer2" INTEGER,
    "duedate" TIMESTAMP(6),
    "reminderscount" INTEGER DEFAULT 0,
    "color" VARCHAR(50) DEFAULT '',
    "frequency" VARCHAR(100) DEFAULT '',
    "cardrate" DECIMAL(19,4) DEFAULT 0,
    "discount" DECIMAL(19,4) DEFAULT 0,
    "ratecardid" INTEGER DEFAULT -1,
    "adagencydiscount" DECIMAL(1,0) DEFAULT 0,
    "zoneid" INTEGER,
    "adname" VARCHAR(255),
    "pickupcontractid" INTEGER,
    "isbleed" DECIMAL(1,0),
    "repnames" VARCHAR(1000) DEFAULT '',
    "repids" VARCHAR(1000) DEFAULT '',
    "adnotes" TEXT DEFAULT '',
    "importfileid" INTEGER,
    "importid" INTEGER,
    "contractid" INTEGER,
    "lastnotificationsent" DECIMAL(1,0) DEFAULT 0,
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "prodnotes" TEXT DEFAULT '',
    "autorenew" DECIMAL(1,0) DEFAULT 0,
    "autorenewcanceldate" TIMESTAMP(6),
    "autorenewcancelreason" VARCHAR(2000),
    "autorenewcancelcomment" VARCHAR(2000),
    "autorenewdeactivationdate" TIMESTAMP(6),
    "autorenewrenewed" DECIMAL(1,0) DEFAULT 0,
    "description" VARCHAR(500) DEFAULT '',
    "salescontactid" INTEGER,
    "cpm" DECIMAL(18,2) DEFAULT 0,
    "impressions" INTEGER DEFAULT 0,
    "qty" DECIMAL(18,4) DEFAULT 0,
    "price" DECIMAL(18,4) DEFAULT 0,
    "impressionsactual" INTEGER DEFAULT 0,
    "qtyactual" INTEGER DEFAULT 0,
    "digitalpositionid" INTEGER DEFAULT -1,
    "insertionid" INTEGER,
    "adagencypercentage" DECIMAL(18,6),
    "billingcontacts" VARCHAR(1000) DEFAULT '',
    "pickupcontractdescrption" TEXT,
    "addataid" INTEGER,
    "adnumberdisplay" VARCHAR(50),
    "adcolumn" INTEGER,
    "adinch" DECIMAL(10,5),
    "totalcolumninches" DECIMAL(10,5),
    "isinchdropdown" DECIMAL(1,0) DEFAULT 0,
    "status1repid" INTEGER,
    "status2repid" INTEGER,
    "status3repid" INTEGER,
    "status4repid" INTEGER,
    "status5repid" INTEGER,
    "status6repid" INTEGER,
    "status7repid" INTEGER,
    "status8repid" INTEGER,
    "datemodified" TIMESTAMP(6),
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "stageid" INTEGER,
    "iswizard" DECIMAL(1,0) DEFAULT 0,
    "containerid" INTEGER,
    "videocompletionsactual" INTEGER DEFAULT 0,
    "videostartsactual" INTEGER DEFAULT 0,
    "viewableimpressionsactual" INTEGER DEFAULT 0,
    "parentid" INTEGER,
    "ordersource" VARCHAR(100),
    "campaignid" INTEGER,
    "orderstatus" VARCHAR(20) NOT NULL DEFAULT 'Active',

    CONSTRAINT "pk_gscontracts_281104092" PRIMARY KEY ("gscontractsid")
);

-- CreateTable
CREATE TABLE "gscontracts2charges" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER,
    "insertionid" INTEGER,
    "gscontractschargesid" INTEGER NOT NULL,
    "percentage" DOUBLE PRECISION,
    "amount" DOUBLE PRECISION,
    "charge" DOUBLE PRECISION NOT NULL,
    "notes" VARCHAR(1000),
    "useroverride" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "stacked" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gscontracts2charges_dev_31871" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER,
    "insertionid" INTEGER,
    "gscontractschargesid" INTEGER NOT NULL,
    "percentage" DOUBLE PRECISION,
    "amount" DOUBLE PRECISION,
    "charge" DOUBLE PRECISION NOT NULL,
    "notes" VARCHAR(1000),
    "useroverride" DECIMAL(1,0) NOT NULL,
    "stacked" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gscontracts2productioncontact" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER,
    "gscustomersid" INTEGER,
    "isproposal" DECIMAL(1,0),
    "taskid" INTEGER,

    CONSTRAINT "pk_gscontracts2productioncontact_1945982209" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gscontracts_03132025" (
    "gscontractsid" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "yr" INTEGER NOT NULL,
    "mnth" INTEGER NOT NULL,
    "pubid" INTEGER NOT NULL,
    "net" DECIMAL(19,4),
    "gross" DECIMAL(19,4),
    "barter" DECIMAL(19,4),
    "adsize" INTEGER,
    "columninches" DECIMAL(18,4),
    "columns" DECIMAL(18,4),
    "adsection" INTEGER,
    "adpositioning" VARCHAR(255),
    "dateadded" TIMESTAMP(6),
    "prodcharge" DOUBLE PRECISION,
    "status1" TIMESTAMP(6),
    "status2" TIMESTAMP(6),
    "status3" TIMESTAMP(6),
    "status4" TIMESTAMP(6),
    "status5" TIMESTAMP(6),
    "status6" TIMESTAMP(6),
    "status8" TIMESTAMP(6),
    "status7" TIMESTAMP(6),
    "adnumber" INTEGER,
    "posreq1" VARCHAR(1000),
    "posreq2" DECIMAL(1,0),
    "posreq3" DECIMAL(1,0),
    "posreq4" DECIMAL(1,0),
    "posreq5" INTEGER,
    "acttime" INTEGER,
    "esttime" INTEGER,
    "designer1" INTEGER,
    "designer2" INTEGER,
    "duedate" TIMESTAMP(6),
    "reminderscount" INTEGER,
    "color" VARCHAR(50),
    "frequency" VARCHAR(100),
    "cardrate" DECIMAL(19,4),
    "discount" DECIMAL(19,4),
    "ratecardid" INTEGER,
    "adagencydiscount" DECIMAL(1,0),
    "zoneid" INTEGER,
    "adname" VARCHAR(255),
    "pickupcontractid" INTEGER,
    "isbleed" DECIMAL(1,0),
    "repnames" VARCHAR(1000),
    "repids" VARCHAR(1000),
    "adnotes" TEXT,
    "importfileid" INTEGER,
    "importid" INTEGER,
    "contractid" INTEGER,
    "lastnotificationsent" DECIMAL(1,0),
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "prodnotes" TEXT,
    "autorenew" DECIMAL(1,0),
    "autorenewcanceldate" TIMESTAMP(6),
    "autorenewcancelreason" VARCHAR(2000),
    "autorenewcancelcomment" VARCHAR(2000),
    "autorenewdeactivationdate" TIMESTAMP(6),
    "autorenewrenewed" DECIMAL(1,0),
    "description" VARCHAR(500),
    "salescontactid" INTEGER,
    "cpm" DECIMAL(18,2),
    "impressions" INTEGER,
    "qty" DECIMAL(18,4),
    "price" DECIMAL(18,4),
    "impressionsactual" INTEGER,
    "qtyactual" INTEGER,
    "digitalpositionid" INTEGER,
    "insertionid" INTEGER,
    "adagencypercentage" DECIMAL(18,6),
    "billingcontacts" VARCHAR(1000),
    "pickupcontractdescrption" TEXT,
    "addataid" INTEGER,
    "adnumberdisplay" VARCHAR(50),
    "adcolumn" INTEGER,
    "adinch" DECIMAL(10,5),
    "totalcolumninches" DECIMAL(10,5),
    "isinchdropdown" DECIMAL(1,0),
    "status1repid" INTEGER,
    "status2repid" INTEGER,
    "status3repid" INTEGER,
    "status4repid" INTEGER,
    "status5repid" INTEGER,
    "status6repid" INTEGER,
    "status7repid" INTEGER,
    "status8repid" INTEGER,
    "datemodified" TIMESTAMP(6),
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "stageid" INTEGER,
    "iswizard" DECIMAL(1,0),
    "containerid" INTEGER,
    "videocompletionsactual" INTEGER,
    "videostartsactual" INTEGER,
    "viewableimpressionsactual" INTEGER,
    "parentid" INTEGER,
    "ordersource" VARCHAR(100),
    "campaignid" INTEGER
);

-- CreateTable
CREATE TABLE "gscontractscharges" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(50) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "percentage" DOUBLE PRECISION,
    "amount" DOUBLE PRECISION,
    "bothhigher" DECIMAL(1,0) DEFAULT 0,
    "useroverride" DECIMAL(1,0) DEFAULT 0,
    "surcharge" DECIMAL(1,0) DEFAULT 1,
    "beforeagencydiscount" DECIMAL(1,0) DEFAULT 1,
    "taxable" DECIMAL(1,0) DEFAULT 0,
    "noterequired" DECIMAL(1,0) DEFAULT 0,
    "isdefault" DECIMAL(1,0) DEFAULT 0,
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "stacked" DECIMAL(1,0) DEFAULT 1
);

-- CreateTable
CREATE TABLE "gscontractscharges2ratecard" (
    "id" SERIAL NOT NULL,
    "gscontractschargesid" INTEGER,
    "ratecardid" INTEGER
);

-- CreateTable
CREATE TABLE "gscontractsdata" (
    "gscontractsdataid" SERIAL NOT NULL,
    "adpayid" VARCHAR(100),
    "titletext" TEXT,
    "htmltext" TEXT,
    "printtext" TEXT,
    "sortorder" INTEGER,
    "wordcount" INTEGER DEFAULT 0,
    "charcount" INTEGER DEFAULT 0,
    "linecount" INTEGER,
    "footertext" TEXT,

    CONSTRAINT "pk_gscontractsdata_908074521" PRIMARY KEY ("gscontractsdataid")
);

-- CreateTable
CREATE TABLE "gscontractsinstallment" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER NOT NULL,
    "installmentdate" TIMESTAMP(6) NOT NULL,
    "installmentamount" DECIMAL(19,4) NOT NULL,
    "installmentpercentage" DECIMAL(18,10) NOT NULL DEFAULT 0,
    "billingcontactid" INTEGER NOT NULL,
    "insertionid" INTEGER DEFAULT -1,
    "proposalid" INTEGER DEFAULT -1,
    "billamount" DECIMAL(19,4) DEFAULT 0
);

-- CreateTable
CREATE TABLE "gscontractsinstallmentdefaults" (
    "id" SERIAL NOT NULL,
    "pubid" INTEGER NOT NULL,
    "mnth" INTEGER NOT NULL,
    "yr" INTEGER NOT NULL,
    "installmentdate" TIMESTAMP(6) NOT NULL,
    "installmentpercentage" DECIMAL(18,10) NOT NULL
);

-- CreateTable
CREATE TABLE "gscontractsnotes" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER,
    "note" TEXT,
    "datecreated" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "isproduction" DECIMAL(1,0) DEFAULT 0,
    "repid" INTEGER,
    "isprivate" DECIMAL(1,0) DEFAULT 1,
    "attachmenturl" VARCHAR(1000),
    "iscustomerportal" DECIMAL(1,0),
    "isfinal" DECIMAL(1,0) DEFAULT 0,
    "notetype" VARCHAR(10),
    "filesize" DECIMAL(10,2),
    "apprstatus" INTEGER,
    "isapprovalrequired" DECIMAL(1,0),
    "parentid" INTEGER,
    "customerid" INTEGER,
    "taskid" INTEGER,
    "fromemail" VARCHAR(150),
    "isreminder" DECIMAL(1,0),
    "workflowids" VARCHAR(1000),
    "portalquerystring" VARCHAR(500),
    "fromname" VARCHAR(200),
    "toemail" VARCHAR(1000),
    "toccemails" TEXT,
    "jobjacketid" INTEGER,
    "jjpreviousnoteid" INTEGER,
    "nonfinalfilesjson" TEXT,
    "subject" TEXT,
    "htmlbody" TEXT,
    "stageid" INTEGER,
    "templatejson" TEXT,
    "resendnoteparentid" INTEGER DEFAULT 0,
    "indesignsavedfilepath" TEXT,

    CONSTRAINT "pk_gscontractsnotes_1077123128" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gscredit" (
    "creditno" SERIAL NOT NULL,
    "gscustomersid" INTEGER NOT NULL,
    "checkno" INTEGER,
    "amount" INTEGER NOT NULL,
    "datereceived" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "gscustomers" (
    "gscustomersid" SERIAL NOT NULL,
    "customer" VARCHAR(90) DEFAULT '',
    "pre" VARCHAR(100) DEFAULT '',
    "firstname" VARCHAR(50) DEFAULT '',
    "middlename" VARCHAR(50) DEFAULT '',
    "lastname" VARCHAR(50) DEFAULT '',
    "suffix" VARCHAR(50) DEFAULT '',
    "nickname" VARCHAR(50) DEFAULT '',
    "email" VARCHAR(70) DEFAULT '',
    "email2" VARCHAR(70) DEFAULT '',
    "phone" VARCHAR(50) DEFAULT '',
    "phone2" VARCHAR(50) DEFAULT '',
    "homephone" VARCHAR(50) DEFAULT '',
    "attn" VARCHAR(50) DEFAULT '',
    "street" VARCHAR(50) DEFAULT '',
    "street2" VARCHAR(50) DEFAULT '',
    "city" VARCHAR(50) DEFAULT '',
    "st" VARCHAR(50) DEFAULT '',
    "zip" VARCHAR(50) DEFAULT '',
    "county" VARCHAR(50) DEFAULT '',
    "international" VARCHAR(255) DEFAULT '',
    "homeattn" VARCHAR(50) DEFAULT '',
    "homestreet" VARCHAR(50) DEFAULT '',
    "homestreet2" VARCHAR(50) DEFAULT '',
    "homecity" VARCHAR(50) DEFAULT '',
    "homest" VARCHAR(50) DEFAULT '',
    "homezip" VARCHAR(50) DEFAULT '',
    "homeinternational" VARCHAR(50) DEFAULT '',
    "fax" VARCHAR(50) DEFAULT '',
    "homefax" VARCHAR(50) DEFAULT '',
    "dateadded" TIMESTAMP(6),
    "datelstmod" TIMESTAMP(6),
    "title" VARCHAR(70) DEFAULT '',
    "jobdescription" VARCHAR(100) DEFAULT '',
    "spouse" VARCHAR(50) DEFAULT '',
    "kids" VARCHAR(255) DEFAULT '',
    "charity" VARCHAR(255) DEFAULT '',
    "extranotes" VARCHAR(1000) DEFAULT '',
    "gsrepid" INTEGER,
    "gscustomerstypeid" INTEGER,
    "gsadagencyid" INTEGER,
    "adagency" VARCHAR(90) DEFAULT '',
    "priority" INTEGER,
    "budgetplanning" TIMESTAMP(6),
    "adagencystreet" VARCHAR(50) DEFAULT '',
    "adagencycity" VARCHAR(50) DEFAULT '',
    "adagencyst" VARCHAR(50) DEFAULT '',
    "adagencyzip" VARCHAR(50) DEFAULT '',
    "adagencycounty" VARCHAR(50) DEFAULT '',
    "adagencyphone" VARCHAR(50) DEFAULT '',
    "adagencyfax" VARCHAR(50) DEFAULT '',
    "adagencyfirstname" VARCHAR(50) DEFAULT '',
    "adagencylastname" VARCHAR(50) DEFAULT '',
    "adagencyemail" VARCHAR(75) DEFAULT '',
    "adagencycell" VARCHAR(50) DEFAULT '',
    "appointmentsetter" DECIMAL(1,0),
    "convertid" INTEGER,
    "noprodcharge" DECIMAL(1,0),
    "acctbillto" INTEGER,
    "acctquickbooks" VARCHAR(200) DEFAULT '',
    "parentid" INTEGER,
    "relatedcustomerids" VARCHAR(2000) DEFAULT '',
    "phonextn" VARCHAR(8) DEFAULT '',
    "directorycontact" DECIMAL(1,0) DEFAULT 0,
    "birthdate" TIMESTAMP(6),
    "paymentplan" VARCHAR(50) DEFAULT '',
    "url" VARCHAR(255) DEFAULT '',
    "donotfax" DECIMAL(1,0) DEFAULT 0,
    "donotemail" DECIMAL(1,0) DEFAULT 0,
    "terms" VARCHAR(100) DEFAULT '',
    "daystopay" INTEGER DEFAULT 0,
    "isagency" DECIMAL(1,0) DEFAULT 0,
    "phone3" VARCHAR(50) DEFAULT '',
    "phone3xtn" VARCHAR(8) DEFAULT '',
    "includeinforecasting" DECIMAL(1,0) DEFAULT 0,
    "importfileid" INTEGER DEFAULT -1,
    "importid" INTEGER DEFAULT -1,
    "distributionstopid" INTEGER,
    "quickbookscustomerid" VARCHAR(50),
    "editsequence" VARCHAR(16),
    "companyname" VARCHAR(100),
    "userid" VARCHAR(50) DEFAULT '',
    "password" VARCHAR(50) DEFAULT '',
    "nextcallback" TIMESTAMP(6),
    "lastcontact" TIMESTAMP(6),
    "lastcontract" TIMESTAMP(6),
    "lastcomplist" TIMESTAMP(6),
    "referencecustomerid" VARCHAR(30),
    "imageurl" VARCHAR(1000),
    "twitterhandle" VARCHAR(1000),
    "facebookid" VARCHAR(1000),
    "linkedin" VARCHAR(1000),
    "googleplus" VARCHAR(1000),
    "lastcontacttype" VARCHAR(50),
    "issocialprofileconfirmed" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "billingaltemails" VARCHAR(1000),
    "lastsubscriptiondate" TIMESTAMP(6),
    "customertype" INTEGER,
    "emailstatus" VARCHAR(1000),
    "email2status" VARCHAR(1000),
    "leadtype" INTEGER,
    "leadsource" TEXT,
    "prospectingstageid" INTEGER,
    "workflowids" TEXT,
    "leadquality" VARCHAR(200),
    "leadstatus" TEXT,
    "inactive" DECIMAL(1,0),
    "ismkmprofileactive" DECIMAL(1,0),
    "istaxexempt" DECIMAL(1,0),
    "currencyid" INTEGER,

    CONSTRAINT "pk_gscustomers_2020358412" PRIMARY KEY ("gscustomersid")
);

-- CreateTable
CREATE TABLE "gscustomers2agency" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER,
    "gsadagencyid" INTEGER,

    CONSTRAINT "pk_gscustomers2agency_1239115605" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gscustomers_backup_040325" (
    "gscustomersid" INTEGER NOT NULL,
    "customer" VARCHAR(90),
    "pre" VARCHAR(100),
    "firstname" VARCHAR(50),
    "middlename" VARCHAR(50),
    "lastname" VARCHAR(50),
    "suffix" VARCHAR(50),
    "nickname" VARCHAR(50),
    "email" VARCHAR(70),
    "email2" VARCHAR(70),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "homephone" VARCHAR(50),
    "attn" VARCHAR(50),
    "street" VARCHAR(50),
    "street2" VARCHAR(50),
    "city" VARCHAR(50),
    "st" VARCHAR(50),
    "zip" VARCHAR(50),
    "county" VARCHAR(50),
    "international" VARCHAR(255),
    "homeattn" VARCHAR(50),
    "homestreet" VARCHAR(50),
    "homestreet2" VARCHAR(50),
    "homecity" VARCHAR(50),
    "homest" VARCHAR(50),
    "homezip" VARCHAR(50),
    "homeinternational" VARCHAR(50),
    "fax" VARCHAR(50),
    "homefax" VARCHAR(50),
    "dateadded" TIMESTAMP(6),
    "datelstmod" TIMESTAMP(6),
    "title" VARCHAR(70),
    "jobdescription" VARCHAR(100),
    "spouse" VARCHAR(50),
    "kids" VARCHAR(255),
    "charity" VARCHAR(255),
    "extranotes" VARCHAR(1000),
    "gsrepid" INTEGER,
    "gscustomerstypeid" INTEGER,
    "gsadagencyid" INTEGER,
    "adagency" VARCHAR(90),
    "priority" INTEGER,
    "budgetplanning" TIMESTAMP(6),
    "adagencystreet" VARCHAR(50),
    "adagencycity" VARCHAR(50),
    "adagencyst" VARCHAR(50),
    "adagencyzip" VARCHAR(50),
    "adagencycounty" VARCHAR(50),
    "adagencyphone" VARCHAR(50),
    "adagencyfax" VARCHAR(50),
    "adagencyfirstname" VARCHAR(50),
    "adagencylastname" VARCHAR(50),
    "adagencyemail" VARCHAR(75),
    "adagencycell" VARCHAR(50),
    "appointmentsetter" DECIMAL(1,0),
    "convertid" INTEGER,
    "noprodcharge" DECIMAL(1,0),
    "acctbillto" INTEGER,
    "acctquickbooks" VARCHAR(200),
    "parentid" INTEGER,
    "relatedcustomerids" VARCHAR(2000),
    "phonextn" VARCHAR(8),
    "directorycontact" DECIMAL(1,0),
    "birthdate" TIMESTAMP(6),
    "paymentplan" VARCHAR(50),
    "url" VARCHAR(255),
    "donotfax" DECIMAL(1,0),
    "donotemail" DECIMAL(1,0),
    "terms" VARCHAR(100),
    "daystopay" INTEGER,
    "isagency" DECIMAL(1,0),
    "phone3" VARCHAR(50),
    "phone3xtn" VARCHAR(8),
    "includeinforecasting" DECIMAL(1,0),
    "importfileid" INTEGER,
    "importid" INTEGER,
    "distributionstopid" INTEGER,
    "quickbookscustomerid" VARCHAR(50),
    "editsequence" VARCHAR(16),
    "companyname" VARCHAR(100),
    "userid" VARCHAR(50),
    "password" VARCHAR(50),
    "nextcallback" TIMESTAMP(6),
    "lastcontact" TIMESTAMP(6),
    "lastcontract" TIMESTAMP(6),
    "lastcomplist" TIMESTAMP(6),
    "referencecustomerid" VARCHAR(30),
    "imageurl" VARCHAR(1000),
    "twitterhandle" VARCHAR(1000),
    "facebookid" VARCHAR(1000),
    "linkedin" VARCHAR(1000),
    "googleplus" VARCHAR(1000),
    "lastcontacttype" VARCHAR(50),
    "issocialprofileconfirmed" DECIMAL(1,0) NOT NULL,
    "billingaltemails" VARCHAR(1000),
    "lastsubscriptiondate" TIMESTAMP(6),
    "customertype" INTEGER,
    "emailstatus" VARCHAR(1000),
    "email2status" VARCHAR(1000),
    "leadtype" INTEGER,
    "leadsource" TEXT,
    "prospectingstageid" INTEGER,
    "workflowids" TEXT,
    "leadquality" VARCHAR(200),
    "leadstatus" TEXT,
    "inactive" DECIMAL(1,0),
    "ismkmprofileactive" DECIMAL(1,0),
    "istaxexempt" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gscustomers_dev_29161_23012025" (
    "gscustomersid" SERIAL NOT NULL,
    "customer" VARCHAR(90),
    "pre" VARCHAR(100),
    "firstname" VARCHAR(50),
    "middlename" VARCHAR(50),
    "lastname" VARCHAR(50),
    "suffix" VARCHAR(50),
    "nickname" VARCHAR(50),
    "email" VARCHAR(70),
    "email2" VARCHAR(70),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "homephone" VARCHAR(50),
    "attn" VARCHAR(50),
    "street" VARCHAR(50),
    "street2" VARCHAR(50),
    "city" VARCHAR(50),
    "st" VARCHAR(50),
    "zip" VARCHAR(50),
    "county" VARCHAR(50),
    "international" VARCHAR(255),
    "homeattn" VARCHAR(50),
    "homestreet" VARCHAR(50),
    "homestreet2" VARCHAR(50),
    "homecity" VARCHAR(50),
    "homest" VARCHAR(50),
    "homezip" VARCHAR(50),
    "homeinternational" VARCHAR(50),
    "fax" VARCHAR(50),
    "homefax" VARCHAR(50),
    "dateadded" TIMESTAMP(6),
    "datelstmod" TIMESTAMP(6),
    "title" VARCHAR(70),
    "jobdescription" VARCHAR(100),
    "spouse" VARCHAR(50),
    "kids" VARCHAR(255),
    "charity" VARCHAR(255),
    "extranotes" VARCHAR(1000),
    "gsrepid" INTEGER,
    "gscustomerstypeid" INTEGER,
    "gsadagencyid" INTEGER,
    "adagency" VARCHAR(90),
    "priority" INTEGER,
    "budgetplanning" TIMESTAMP(6),
    "adagencystreet" VARCHAR(50),
    "adagencycity" VARCHAR(50),
    "adagencyst" VARCHAR(50),
    "adagencyzip" VARCHAR(50),
    "adagencycounty" VARCHAR(50),
    "adagencyphone" VARCHAR(50),
    "adagencyfax" VARCHAR(50),
    "adagencyfirstname" VARCHAR(50),
    "adagencylastname" VARCHAR(50),
    "adagencyemail" VARCHAR(75),
    "adagencycell" VARCHAR(50),
    "appointmentsetter" DECIMAL(1,0),
    "convertid" INTEGER,
    "noprodcharge" DECIMAL(1,0),
    "acctbillto" INTEGER,
    "acctquickbooks" VARCHAR(200),
    "parentid" INTEGER,
    "relatedcustomerids" VARCHAR(2000),
    "phonextn" VARCHAR(8),
    "directorycontact" DECIMAL(1,0),
    "birthdate" TIMESTAMP(6),
    "paymentplan" VARCHAR(50),
    "url" VARCHAR(255),
    "donotfax" DECIMAL(1,0),
    "donotemail" DECIMAL(1,0),
    "terms" VARCHAR(100),
    "daystopay" INTEGER,
    "isagency" DECIMAL(1,0),
    "phone3" VARCHAR(50),
    "phone3xtn" VARCHAR(8),
    "includeinforecasting" DECIMAL(1,0),
    "importfileid" INTEGER,
    "importid" INTEGER,
    "distributionstopid" INTEGER,
    "quickbookscustomerid" VARCHAR(50),
    "editsequence" VARCHAR(16),
    "companyname" VARCHAR(100),
    "userid" VARCHAR(50),
    "password" VARCHAR(50),
    "nextcallback" TIMESTAMP(6),
    "lastcontact" TIMESTAMP(6),
    "lastcontract" TIMESTAMP(6),
    "lastcomplist" TIMESTAMP(6),
    "referencecustomerid" VARCHAR(30),
    "imageurl" VARCHAR(1000),
    "twitterhandle" VARCHAR(1000),
    "facebookid" VARCHAR(1000),
    "linkedin" VARCHAR(1000),
    "googleplus" VARCHAR(1000),
    "lastcontacttype" VARCHAR(50),
    "issocialprofileconfirmed" DECIMAL(1,0) NOT NULL,
    "billingaltemails" VARCHAR(1000),
    "lastsubscriptiondate" TIMESTAMP(6),
    "customertype" INTEGER,
    "emailstatus" VARCHAR(1000),
    "email2status" VARCHAR(1000),
    "leadtype" INTEGER,
    "leadsource" TEXT,
    "prospectingstageid" INTEGER,
    "workflowids" TEXT,
    "leadquality" VARCHAR(200),
    "leadstatus" TEXT,
    "inactive" DECIMAL(1,0),
    "ismkmprofileactive" DECIMAL(1,0),
    "istaxexempt" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gscustomersdeleted" (
    "gscustomersid" INTEGER,
    "customer" VARCHAR(90),
    "pre" VARCHAR(50),
    "firstname" VARCHAR(50),
    "middlename" VARCHAR(50),
    "lastname" VARCHAR(50),
    "suffix" VARCHAR(50),
    "nickname" VARCHAR(50),
    "email" VARCHAR(70),
    "email2" VARCHAR(70),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "cellphone" VARCHAR(50),
    "homephone" VARCHAR(50),
    "attn" VARCHAR(50),
    "street" VARCHAR(50),
    "street2" VARCHAR(50),
    "city" VARCHAR(50),
    "st" VARCHAR(50),
    "zip" VARCHAR(50),
    "county" VARCHAR(50),
    "international" VARCHAR(255),
    "homeattn" VARCHAR(50),
    "homestreet" VARCHAR(50),
    "homestreet2" VARCHAR(50),
    "homecity" VARCHAR(50),
    "homest" VARCHAR(50),
    "homezip" VARCHAR(50),
    "homeinternational" VARCHAR(50),
    "fax" VARCHAR(50),
    "homefax" VARCHAR(50),
    "dateadded" TIMESTAMP(6),
    "datelstmod" TIMESTAMP(6),
    "title" VARCHAR(70),
    "jobdescription" VARCHAR(100),
    "spouse" VARCHAR(50),
    "kids" VARCHAR(255),
    "charity" VARCHAR(255),
    "extranotes" VARCHAR(2000),
    "gsrepid" INTEGER,
    "gscustomerstypeid" INTEGER,
    "gssubcustomerstypeid" INTEGER,
    "gsadagencyid" INTEGER,
    "adagency" VARCHAR(50),
    "priority" INTEGER,
    "budgetplanning" TIMESTAMP(6),
    "adagencystreet" VARCHAR(50),
    "adagencycity" VARCHAR(50),
    "adagencyst" VARCHAR(50),
    "adagencyzip" VARCHAR(50),
    "adagencycounty" VARCHAR(50),
    "adagencyphone" VARCHAR(50),
    "adagencyfax" VARCHAR(50),
    "adagencyfirstname" VARCHAR(50),
    "adagencylastname" VARCHAR(50),
    "adagencyemail" VARCHAR(75),
    "adagencycell" VARCHAR(50),
    "appointmentsetter" DECIMAL(1,0),
    "convertid" INTEGER,
    "noprodcharge" DECIMAL(1,0),
    "acctbillto" INTEGER,
    "acctquickbooks" VARCHAR(200),
    "parentid" INTEGER,
    "relatedcustomerids" VARCHAR(255),
    "phonextn" VARCHAR(8),
    "directorycontact" DECIMAL(1,0),
    "birthdate" TIMESTAMP(6),
    "paymentplan" VARCHAR(50),
    "distributionpoint" DECIMAL(1,0),
    "url" VARCHAR(255),
    "donotfax" DECIMAL(1,0),
    "donotemail" DECIMAL(1,0),
    "complistid" INTEGER,
    "subscriberid" INTEGER,
    "oncomplist" DECIMAL(1,0),
    "validated" DECIMAL(1,0),
    "validatedcode" INTEGER,
    "phoneformatted" VARCHAR(50),
    "terms" VARCHAR(100),
    "daystopay" INTEGER,
    "lastsync" TIMESTAMP(6),
    "isagency" DECIMAL(1,0),
    "phone3" VARCHAR(50),
    "datedeleted" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "deletedby" INTEGER,
    "lastcontact" TIMESTAMP(6),
    "lastcontract" TIMESTAMP(6),
    "lastcomplist" TIMESTAMP(6),
    "imageurl" VARCHAR(1000),
    "twitterhandle" VARCHAR(1000),
    "facebookid" VARCHAR(1000),
    "linkedin" VARCHAR(1000),
    "googleplus" VARCHAR(1000),
    "mergedtocustid" INTEGER,
    "isarchive" DECIMAL(1,0),
    "emailstatus" VARCHAR(5),
    "copycontact" DECIMAL(1,0),
    "ispartial" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gscustomerslastcontact" (
    "gsemployeesid" INTEGER,
    "gscustomersid" INTEGER,
    "contactdate" TIMESTAMP(6) DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "gscustomerstype" (
    "gscustomerstypeid" SERIAL NOT NULL,
    "type" VARCHAR(100) NOT NULL,
    "dateadded" TIMESTAMP(6),
    "enabled" DECIMAL(1,0),

    CONSTRAINT "pk_gscustomerstype_998398726" PRIMARY KEY ("gscustomerstypeid")
);

-- CreateTable
CREATE TABLE "gsdept" (
    "gsdeptid" SERIAL NOT NULL,
    "dept" VARCHAR(50),
    "dateadded" TIMESTAMP(6),
    "sortorder" INTEGER,

    CONSTRAINT "pk_gsdept_178099675" PRIMARY KEY ("gsdeptid")
);

-- CreateTable
CREATE TABLE "gsdisplaytypes" (
    "gsdisplaytypeid" SERIAL NOT NULL,
    "gsdisplaytypename" CHAR(100),

    CONSTRAINT "pk_gsdisplaytypes_155915677" PRIMARY KEY ("gsdisplaytypeid")
);

-- CreateTable
CREATE TABLE "gsdue" (
    "gsdueid" SERIAL NOT NULL,
    "yr" INTEGER,
    "mnth" INTEGER,
    "duedate" TIMESTAMP(6),
    "invoicedate" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "gseditorials" (
    "gseditorialsid" SERIAL NOT NULL,
    "publication1" INTEGER,
    "publication" INTEGER,
    "issue" TIMESTAMP(6),
    "issueid" INTEGER,
    "issueyear" INTEGER,
    "editname" VARCHAR(75),
    "editlength" VARCHAR(10),
    "edittype" INTEGER,
    "inphoto" TIMESTAMP(6),
    "inphotoscan" TIMESTAMP(6),
    "indesign" TIMESTAMP(6),
    "instory" TIMESTAMP(6),
    "in1stedit" TIMESTAMP(6),
    "infinaledit" TIMESTAMP(6),
    "inpostscript" TIMESTAMP(6),
    "photocontact" VARCHAR(50),
    "photoscheduled" VARCHAR(50),
    "problems" VARCHAR(50),
    "gswriterid" INTEGER,
    "gseditorid" INTEGER,
    "gsphotoid" INTEGER,
    "writername" VARCHAR(50),
    "writercontact" VARCHAR(50),
    "editorialcontacts" TEXT,
    "editorialtext" TEXT,
    "formid" INTEGER,
    "budget" DOUBLE PRECISION,
    "datedue" TIMESTAMP(6),
    "dateassigned" TIMESTAMP(6),
    "photodatedue" TIMESTAMP(6),
    "photodateassigned" TIMESTAMP(6),
    "editwords" SMALLINT,
    "perpage" DOUBLE PRECISION,
    "perword" DOUBLE PRECISION,

    CONSTRAINT "pk_gseditorials_194099732" PRIMARY KEY ("gseditorialsid")
);

-- CreateTable
CREATE TABLE "gseditorials2contact" (
    "id" SERIAL NOT NULL,
    "gseditorialsid" INTEGER,
    "gscustomersid" INTEGER,
    "iswriter" DECIMAL(1,0),
    "isphotographer" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gseditorialstext" (
    "id" SERIAL NOT NULL,
    "gseditorialsid" INTEGER,
    "pagenumber" INTEGER,
    "wordcount" INTEGER,
    "charactercount" INTEGER,
    "text" TEXT
);

-- CreateTable
CREATE TABLE "gsedittype" (
    "gsedittypeid" SERIAL NOT NULL,
    "gsedittypename" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "gsempcommissions" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "ratecardid" INTEGER,
    "commission" DECIMAL(18,6),

    CONSTRAINT "pk__gsempcommissions__2baa4f42" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gsemployees" (
    "gsemployeesid" SERIAL NOT NULL,
    "firstname" VARCHAR(50),
    "lastname" VARCHAR(50),
    "email" VARCHAR(50),
    "jobtitle" VARCHAR(50),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "street" VARCHAR(50),
    "city" VARCHAR(50),
    "st" VARCHAR(50),
    "zip" VARCHAR(50),
    "userid" VARCHAR(50),
    "password" VARCHAR(50),
    "enabled" DECIMAL(1,0),
    "dateadded" TIMESTAMP(6),
    "admin" DECIMAL(1,0),
    "gsdeptid" INTEGER NOT NULL,
    "salesterritory" VARCHAR(60),
    "acctqbsalesrep" VARCHAR(5),
    "goalcalls" SMALLINT,
    "goalsales" INTEGER,
    "birthdate" TIMESTAMP(6),
    "hiredate" TIMESTAMP(6),
    "salesdata" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "activitydetail" DECIMAL(1,0),
    "showinlists" DECIMAL(1,0) DEFAULT 1,
    "cancreatecontracts" DECIMAL(1,0) DEFAULT 1,
    "candeletecustomers" INTEGER DEFAULT 1,
    "managerid" INTEGER DEFAULT -1,
    "manageroverride" DOUBLE PRECISION,
    "candeletenotes" INTEGER DEFAULT 1,
    "caneditnotes" INTEGER DEFAULT 1,
    "notes" VARCHAR(1000),
    "issa" DECIMAL(1,0) DEFAULT 0,
    "caneditgoals" DECIMAL(1,0) DEFAULT 0,
    "cansyncgoogle" DECIMAL(1,0) DEFAULT 0,
    "googun" VARCHAR(100),
    "googpw" VARCHAR(100),
    "googmodedefault" INTEGER DEFAULT 1,
    "googcalfromdate" INTEGER DEFAULT -1,
    "googcaltodate" INTEGER DEFAULT 12,
    "caneditannouncements" DECIMAL(1,0) DEFAULT 0,
    "fax" VARCHAR(50),
    "lastmmnotificationdate" TIMESTAMP(6),
    "dsuser" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "canwrklistaccountaccess" INTEGER,
    "notessetting" INTEGER,
    "issystem" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "googleoauthrefreshtoken" TEXT,
    "googleoauthconnectionstatus" INTEGER,
    "batchdelete" VARCHAR(15) NOT NULL DEFAULT '',
    "bccemailid" VARCHAR(250),
    "campaignerkey" VARCHAR(250),
    "campaigneruserid" VARCHAR(250),
    "campaignerpwd" VARCHAR(250),
    "linktypeid" INTEGER,
    "mailchimpapikey" VARCHAR(1000) DEFAULT '',
    "imageurl" VARCHAR(2000),
    "enablebatchupdate" INTEGER NOT NULL DEFAULT 0,
    "defaultdashboardid" INTEGER,
    "ismailchimpenabled" DECIMAL(1,0),
    "iscampaignerenabled" DECIMAL(1,0),
    "gmailid" VARCHAR(100),
    "gmailname" VARCHAR(100),
    "gmailrefreshtoken" TEXT,
    "isgmailtype" DECIMAL(1,0),
    "canuseapi" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "outlookaccountdetails" TEXT,
    "color" VARCHAR(10),
    "roleid" INTEGER,
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "cansendcrmemail" DECIMAL(1,0),
    "caneditorders" DECIMAL(1,0),
    "cancreatechangeorders" DECIMAL(1,0),
    "candeleteorders" DECIMAL(1,0),
    "gamaccess" INTEGER NOT NULL DEFAULT 0,
    "canapplychangeorders" DECIMAL(1,0),
    "canallowadminactionsonorders" DECIMAL(1,0),
    "cancreatepaymentplans" DECIMAL(1,0),
    "storecardeditaccess" INTEGER,

    CONSTRAINT "pk_gsemployees_210099789" PRIMARY KEY ("gsemployeesid")
);

-- CreateTable
CREATE TABLE "gsemployees02042025" (
    "gsemployeesid" SERIAL NOT NULL,
    "firstname" VARCHAR(50),
    "lastname" VARCHAR(50),
    "email" VARCHAR(50),
    "jobtitle" VARCHAR(50),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "street" VARCHAR(50),
    "city" VARCHAR(50),
    "st" VARCHAR(50),
    "zip" VARCHAR(50),
    "userid" VARCHAR(50),
    "password" VARCHAR(50),
    "enabled" DECIMAL(1,0),
    "dateadded" TIMESTAMP(6),
    "admin" DECIMAL(1,0),
    "gsdeptid" INTEGER NOT NULL,
    "salesterritory" VARCHAR(60),
    "acctqbsalesrep" VARCHAR(5),
    "goalcalls" SMALLINT,
    "goalsales" INTEGER,
    "birthdate" TIMESTAMP(6),
    "hiredate" TIMESTAMP(6),
    "salesdata" DECIMAL(1,0) NOT NULL,
    "activitydetail" DECIMAL(1,0),
    "showinlists" DECIMAL(1,0),
    "cancreatecontracts" DECIMAL(1,0),
    "candeletecustomers" INTEGER,
    "managerid" INTEGER,
    "manageroverride" DOUBLE PRECISION,
    "candeletenotes" INTEGER,
    "caneditnotes" INTEGER,
    "notes" VARCHAR(1000),
    "issa" DECIMAL(1,0),
    "caneditgoals" DECIMAL(1,0),
    "cansyncgoogle" DECIMAL(1,0),
    "googun" VARCHAR(100),
    "googpw" VARCHAR(100),
    "googmodedefault" INTEGER,
    "googcalfromdate" INTEGER,
    "googcaltodate" INTEGER,
    "caneditannouncements" DECIMAL(1,0),
    "fax" VARCHAR(50),
    "lastmmnotificationdate" TIMESTAMP(6),
    "dsuser" DECIMAL(1,0) NOT NULL,
    "canwrklistaccountaccess" INTEGER,
    "notessetting" INTEGER,
    "issystem" DECIMAL(1,0) NOT NULL,
    "googleoauthrefreshtoken" TEXT,
    "googleoauthconnectionstatus" INTEGER,
    "batchdelete" VARCHAR(15) NOT NULL,
    "bccemailid" VARCHAR(250),
    "campaignerkey" VARCHAR(250),
    "campaigneruserid" VARCHAR(250),
    "campaignerpwd" VARCHAR(250),
    "linktypeid" INTEGER,
    "mailchimpapikey" VARCHAR(1000),
    "imageurl" VARCHAR(2000),
    "enablebatchupdate" INTEGER NOT NULL,
    "defaultdashboardid" INTEGER,
    "ismailchimpenabled" DECIMAL(1,0),
    "iscampaignerenabled" DECIMAL(1,0),
    "gmailid" VARCHAR(100),
    "gmailname" VARCHAR(100),
    "gmailrefreshtoken" TEXT,
    "isgmailtype" DECIMAL(1,0),
    "canuseapi" DECIMAL(1,0) NOT NULL,
    "outlookaccountdetails" TEXT,
    "color" VARCHAR(10),
    "roleid" INTEGER,
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "cansendcrmemail" DECIMAL(1,0),
    "caneditorders" DECIMAL(1,0),
    "cancreatechangeorders" DECIMAL(1,0),
    "candeleteorders" DECIMAL(1,0),
    "gamaccess" INTEGER NOT NULL,
    "canapplychangeorders" DECIMAL(1,0),
    "canallowadminactionsonorders" DECIMAL(1,0),
    "cancreatepaymentplans" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gsemployees_dev_29773" (
    "gsemployeesid" SERIAL NOT NULL,
    "firstname" VARCHAR(50),
    "lastname" VARCHAR(50),
    "email" VARCHAR(50),
    "jobtitle" VARCHAR(50),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "street" VARCHAR(50),
    "city" VARCHAR(50),
    "st" VARCHAR(50),
    "zip" VARCHAR(50),
    "userid" VARCHAR(50),
    "password" VARCHAR(50),
    "enabled" DECIMAL(1,0),
    "dateadded" TIMESTAMP(6),
    "admin" DECIMAL(1,0),
    "gsdeptid" INTEGER NOT NULL,
    "salesterritory" VARCHAR(60),
    "acctqbsalesrep" VARCHAR(5),
    "goalcalls" SMALLINT,
    "goalsales" INTEGER,
    "birthdate" TIMESTAMP(6),
    "hiredate" TIMESTAMP(6),
    "salesdata" DECIMAL(1,0) NOT NULL,
    "activitydetail" DECIMAL(1,0),
    "showinlists" DECIMAL(1,0),
    "cancreatecontracts" DECIMAL(1,0),
    "candeletecustomers" INTEGER,
    "managerid" INTEGER,
    "manageroverride" DOUBLE PRECISION,
    "candeletenotes" INTEGER,
    "caneditnotes" INTEGER,
    "notes" VARCHAR(1000),
    "issa" DECIMAL(1,0),
    "caneditgoals" DECIMAL(1,0),
    "cansyncgoogle" DECIMAL(1,0),
    "googun" VARCHAR(100),
    "googpw" VARCHAR(100),
    "googmodedefault" INTEGER,
    "googcalfromdate" INTEGER,
    "googcaltodate" INTEGER,
    "caneditannouncements" DECIMAL(1,0),
    "fax" VARCHAR(50),
    "lastmmnotificationdate" TIMESTAMP(6),
    "dsuser" DECIMAL(1,0) NOT NULL,
    "canwrklistaccountaccess" INTEGER,
    "notessetting" INTEGER,
    "issystem" DECIMAL(1,0) NOT NULL,
    "googleoauthrefreshtoken" TEXT,
    "googleoauthconnectionstatus" INTEGER,
    "batchdelete" VARCHAR(15) NOT NULL,
    "bccemailid" VARCHAR(250),
    "campaignerkey" VARCHAR(250),
    "campaigneruserid" VARCHAR(250),
    "campaignerpwd" VARCHAR(250),
    "linktypeid" INTEGER,
    "mailchimpapikey" VARCHAR(1000),
    "imageurl" VARCHAR(2000),
    "enablebatchupdate" INTEGER NOT NULL,
    "defaultdashboardid" INTEGER,
    "ismailchimpenabled" DECIMAL(1,0),
    "iscampaignerenabled" DECIMAL(1,0),
    "gmailid" VARCHAR(100),
    "gmailname" VARCHAR(100),
    "gmailrefreshtoken" TEXT,
    "isgmailtype" DECIMAL(1,0),
    "canuseapi" DECIMAL(1,0) NOT NULL,
    "outlookaccountdetails" TEXT,
    "color" VARCHAR(10),
    "roleid" INTEGER,
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "cansendcrmemail" DECIMAL(1,0),
    "caneditorders" DECIMAL(1,0),
    "cancreatechangeorders" DECIMAL(1,0),
    "candeleteorders" DECIMAL(1,0),
    "gamaccess" INTEGER NOT NULL,
    "canapplychangeorders" DECIMAL(1,0),
    "canallowadminactionsonorders" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gsevents" (
    "eventid" SERIAL NOT NULL,
    "eventname" VARCHAR(100) NOT NULL,
    "eventdate" TIMESTAMP(6),
    "location" VARCHAR(200),
    "starttimehr" INTEGER,
    "starttimemts" CHAR(10),
    "posteddate" TIMESTAMP(6),
    "reminder1" TIMESTAMP(6),
    "reminder2" TIMESTAMP(6),
    "reminder3" TIMESTAMP(6),
    "reminder4" TIMESTAMP(6),
    "confirmnote" VARCHAR(25),
    "confirmtext" TEXT,
    "direction" TEXT,
    "beforemsg" VARCHAR(500),
    "aftermsg" VARCHAR(500),
    "filename" VARCHAR(100),
    "deleteflag" CHAR(10),
    "hostid" INTEGER NOT NULL,

    CONSTRAINT "pk_events_226099846" PRIMARY KEY ("eventid")
);

-- CreateTable
CREATE TABLE "gsfiles" (
    "gsfilesid" SERIAL NOT NULL,
    "gseditorialsid" INTEGER NOT NULL,
    "filename" VARCHAR(100),
    "filepath" VARCHAR(100),
    "gsemployeesid" INTEGER,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "gsgensource" (
    "gsgensourceid" SERIAL NOT NULL,
    "name" VARCHAR(100),

    CONSTRAINT "pk_gsgensource_274100017" PRIMARY KEY ("gsgensourceid")
);

-- CreateTable
CREATE TABLE "gsgoals" (
    "gsgoalid" SERIAL NOT NULL,
    "name" VARCHAR(64),
    "frequency" SMALLINT,

    CONSTRAINT "pk_gsgoals_290100074" PRIMARY KEY ("gsgoalid")
);

-- CreateTable
CREATE TABLE "gsgoalsactual" (
    "gsgoalsactualid" SERIAL NOT NULL,
    "mnth" INTEGER,
    "yr" INTEGER,
    "goal" DOUBLE PRECISION,
    "actual" DOUBLE PRECISION,
    "gsemployeesid" INTEGER,
    "gsgoalid" INTEGER,
    "pubid" INTEGER,

    CONSTRAINT "pk_gsgoalsactual_306100131" PRIMARY KEY ("gsgoalsactualid")
);

-- CreateTable
CREATE TABLE "gsgroup" (
    "gsgroupid" SERIAL NOT NULL,
    "name" VARCHAR(64),
    "gsemployeesid" INTEGER,

    CONSTRAINT "pk_gsgroup_322100188" PRIMARY KEY ("gsgroupid")
);

-- CreateTable
CREATE TABLE "gsgroupmember" (
    "gsgroupmemberid" SERIAL NOT NULL,
    "gsgroupid" INTEGER,
    "gscustomersid" INTEGER,

    CONSTRAINT "pk_gsgroupmember_338100245" PRIMARY KEY ("gsgroupmemberid")
);

-- CreateTable
CREATE TABLE "gsinvitees" (
    "eventid" INTEGER NOT NULL,
    "gscustomersid" INTEGER NOT NULL,
    "response" CHAR(5),
    "guestcount" INTEGER,
    "comments" TEXT,

    CONSTRAINT "pk_gsinvitees_354100302" PRIMARY KEY ("eventid","gscustomersid")
);

-- CreateTable
CREATE TABLE "gslettercategory" (
    "gslettercategoryid" SERIAL NOT NULL,
    "name" VARCHAR(50) DEFAULT '',
    "editable" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_gslettercategory_1085962945" PRIMARY KEY ("gslettercategoryid")
);

-- CreateTable
CREATE TABLE "gslettercategory2103" (
    "gslettercategoryid" SERIAL NOT NULL,
    "name" VARCHAR(50),
    "editable" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gsletters" (
    "letterid" SERIAL NOT NULL,
    "lettertype" VARCHAR(50) DEFAULT 'Letter',
    "name" VARCHAR(500) DEFAULT '',
    "categoryid" INTEGER DEFAULT -1,
    "magazineid" INTEGER DEFAULT -1,
    "authorid" INTEGER DEFAULT -1,
    "filename" VARCHAR(255) DEFAULT '',
    "filepath" VARCHAR(255) DEFAULT '',
    "topmargin" DECIMAL(18,2) DEFAULT 1,
    "bottommargin" DECIMAL(18,2) DEFAULT 1,
    "leftmargin" DECIMAL(18,2) DEFAULT 1.25,
    "rightmargin" DECIMAL(18,2) DEFAULT 1.25,
    "header" VARCHAR(500) DEFAULT '',
    "footer" VARCHAR(500) DEFAULT '',
    "portrait" DECIMAL(1,0) DEFAULT 1,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "ismerge" DECIMAL(1,0) DEFAULT 0,
    "mailinglistid" INTEGER DEFAULT -1,
    "first100chars" VARCHAR(103) DEFAULT '',
    "createdbyid" INTEGER DEFAULT -1,
    "updatedbyid" INTEGER DEFAULT -1,
    "defaultrepinfoblock" VARCHAR(1000) DEFAULT '',
    "recipientrules" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER,
    "greetingrules" VARCHAR(1000) DEFAULT 'Dear~,~To Whom It May Concern,',
    "addressrules" VARCHAR(1000) DEFAULT '',
    "text" TEXT DEFAULT '',
    "saeditonly" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "editorjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "thumbnailimage" TEXT,
    "active" DECIMAL(1,0),
    "itemid" INTEGER,
    "itemtype" VARCHAR(255),
    "lettercategory" VARCHAR(255),
    "isaitemplate" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gsletters2103" (
    "letterid" SERIAL NOT NULL,
    "lettertype" VARCHAR(50),
    "name" VARCHAR(500),
    "categoryid" INTEGER,
    "magazineid" INTEGER,
    "authorid" INTEGER,
    "filename" VARCHAR(255),
    "filepath" VARCHAR(255),
    "topmargin" DECIMAL(18,2),
    "bottommargin" DECIMAL(18,2),
    "leftmargin" DECIMAL(18,2),
    "rightmargin" DECIMAL(18,2),
    "header" VARCHAR(500),
    "footer" VARCHAR(500),
    "portrait" DECIMAL(1,0),
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "ismerge" DECIMAL(1,0),
    "mailinglistid" INTEGER,
    "first100chars" VARCHAR(103),
    "createdbyid" INTEGER,
    "updatedbyid" INTEGER,
    "defaultrepinfoblock" VARCHAR(1000),
    "recipientrules" VARCHAR(1000),
    "contacttypeid" INTEGER,
    "greetingrules" VARCHAR(1000),
    "addressrules" VARCHAR(1000),
    "text" TEXT,
    "saeditonly" DECIMAL(1,0) NOT NULL,
    "editorjson" TEXT,
    "isoldtemplate" DECIMAL(1,0),
    "thumbnailimage" TEXT,
    "active" DECIMAL(1,0),
    "itemid" INTEGER,
    "itemtype" VARCHAR(255),
    "lettercategory" VARCHAR(255),
    "isaitemplate" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gsletters_050202025" (
    "letterid" SERIAL NOT NULL,
    "lettertype" VARCHAR(50),
    "name" VARCHAR(500),
    "categoryid" INTEGER,
    "magazineid" INTEGER,
    "authorid" INTEGER,
    "filename" VARCHAR(255),
    "filepath" VARCHAR(255),
    "topmargin" DECIMAL(18,2),
    "bottommargin" DECIMAL(18,2),
    "leftmargin" DECIMAL(18,2),
    "rightmargin" DECIMAL(18,2),
    "header" VARCHAR(500),
    "footer" VARCHAR(500),
    "portrait" DECIMAL(1,0),
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "ismerge" DECIMAL(1,0),
    "mailinglistid" INTEGER,
    "first100chars" VARCHAR(103),
    "createdbyid" INTEGER,
    "updatedbyid" INTEGER,
    "defaultrepinfoblock" VARCHAR(1000),
    "recipientrules" VARCHAR(1000),
    "contacttypeid" INTEGER,
    "greetingrules" VARCHAR(1000),
    "addressrules" VARCHAR(1000),
    "text" TEXT,
    "saeditonly" DECIMAL(1,0) NOT NULL,
    "editorjson" TEXT,
    "isoldtemplate" DECIMAL(1,0),
    "thumbnailimage" TEXT,
    "active" DECIMAL(1,0),
    "itemid" INTEGER,
    "itemtype" VARCHAR(255),
    "lettercategory" VARCHAR(255),
    "isaitemplate" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gsletters_110425" (
    "letterid" INTEGER NOT NULL,
    "lettertype" VARCHAR(50),
    "name" VARCHAR(500),
    "categoryid" INTEGER,
    "magazineid" INTEGER,
    "authorid" INTEGER,
    "filename" VARCHAR(255),
    "filepath" VARCHAR(255),
    "topmargin" DECIMAL(18,2),
    "bottommargin" DECIMAL(18,2),
    "leftmargin" DECIMAL(18,2),
    "rightmargin" DECIMAL(18,2),
    "header" VARCHAR(500),
    "footer" VARCHAR(500),
    "portrait" DECIMAL(1,0),
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "ismerge" DECIMAL(1,0),
    "mailinglistid" INTEGER,
    "first100chars" VARCHAR(103),
    "createdbyid" INTEGER,
    "updatedbyid" INTEGER,
    "defaultrepinfoblock" VARCHAR(1000),
    "recipientrules" VARCHAR(1000),
    "contacttypeid" INTEGER,
    "greetingrules" VARCHAR(1000),
    "addressrules" VARCHAR(1000),
    "text" TEXT,
    "saeditonly" DECIMAL(1,0) NOT NULL,
    "editorjson" TEXT,
    "isoldtemplate" DECIMAL(1,0),
    "thumbnailimage" TEXT,
    "active" DECIMAL(1,0),
    "itemid" INTEGER,
    "itemtype" VARCHAR(255),
    "lettercategory" VARCHAR(255),
    "isaitemplate" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gslogin" (
    "gsloginid" SERIAL NOT NULL,
    "userid" SMALLINT,
    "logintime" TIMESTAMP(6),
    "logouttime" TIMESTAMP(6),
    "source" VARCHAR(20),

    CONSTRAINT "pk_gslogin_402100473" PRIMARY KEY ("gsloginid")
);

-- CreateTable
CREATE TABLE "gsmailinglist" (
    "id" SERIAL NOT NULL,
    "listname" VARCHAR(50) DEFAULT '',
    "includedidlist" TEXT DEFAULT '',
    "excludedidlist" TEXT DEFAULT '',
    "listsql" TEXT DEFAULT '',
    "listenglishsql" TEXT DEFAULT '',
    "listspecialsql" TEXT DEFAULT '',
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "history" TEXT DEFAULT '',
    "createdbyid" INTEGER DEFAULT -1,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "contacttypeid" INTEGER DEFAULT -1,
    "wizard" DECIMAL(1,0) DEFAULT 0,
    "searchedfieldsandvalues" TEXT,

    CONSTRAINT "pk_gsmailinglist_1084635007" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gsmailinglist_campaignhistory" (
    "uniqid" SERIAL NOT NULL,
    "campaignid" VARCHAR(100),
    "campaignname" VARCHAR(1000),
    "letterid" INTEGER,
    "mailing_listid" INTEGER,
    "mailing_listname" VARCHAR(200),
    "listidofcontactology" TEXT,
    "segmentid" INTEGER,
    "createdcampaignon" TIMESTAMP(6),
    "insertedon" TIMESTAMP(6),
    "scheduletime" TIMESTAMP(6),
    "userid" VARCHAR(200),
    "bodytext" TEXT,
    "success" DECIMAL(1,0),
    "contactologystausmessage" VARCHAR(2000),
    "attachurl" VARCHAR(300),
    "countofcotnacts" INTEGER,
    "isbademails" DECIMAL(1,0),
    "bademails" TEXT,
    "emailsendertype" INTEGER,
    "marketingmanagercampaignid" INTEGER,
    "asyncronousticketid" VARCHAR(1000),
    "subject" TEXT,
    "mailchimpapikey" VARCHAR(200),
    "templateidofcampaign" VARCHAR(200),
    "templatejson" TEXT,
    "sender" VARCHAR(100),
    "ismanual" DECIMAL(1,0),
    "followupcampaignid" VARCHAR(100),
    "sendername" VARCHAR(200),
    "isremainder" DECIMAL(1,0),
    "isattacholdtemplate" DECIMAL(1,0),
    "campaigntype" INTEGER,
    "campaign" INTEGER,
    "optout" VARCHAR(100),
    "updatepreferences" VARCHAR(100),
    "footer" VARCHAR(100),
    "productid" INTEGER,
    "businessunitid" INTEGER,
    "viewinbrowser" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "gsmailinglist_contacts" (
    "contactid" SERIAL NOT NULL,
    "listidofcontactology" INTEGER,
    "contactemail" VARCHAR(100),
    "first_name" VARCHAR(100),
    "last_name" VARCHAR(100),
    "gscustomerid" BIGINT,
    "createdate" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "gsmailinglistconfig" (
    "configid" SERIAL NOT NULL,
    "subject" VARCHAR(20),
    "fromname" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "gsmailinglistsql" (
    "id" SERIAL NOT NULL,
    "mailinglistid" INTEGER,
    "whereclause" TEXT,
    "addorremove" DECIMAL(1,0),
    "englishlanguage" TEXT
);

-- CreateTable
CREATE TABLE "gsmarketcharge" (
    "gsmchargeid" SERIAL NOT NULL,
    "gsmchargename" VARCHAR(200),
    "gsemployeesid" INTEGER,

    CONSTRAINT "pk_gsmarketcharge_434100587" PRIMARY KEY ("gsmchargeid")
);

-- CreateTable
CREATE TABLE "gsmarketmethod" (
    "gsmmethodid" SERIAL NOT NULL,
    "gsmmethod" VARCHAR(200),

    CONSTRAINT "pk_gsmarketmethod_450100644" PRIMARY KEY ("gsmmethodid")
);

-- CreateTable
CREATE TABLE "gsmarketname" (
    "gsmnameid" SERIAL NOT NULL,
    "gsmname" VARCHAR(200),
    "magazineid" INTEGER,

    CONSTRAINT "pk_gsmarketingname_466100701" PRIMARY KEY ("gsmnameid")
);

-- CreateTable
CREATE TABLE "gsmeeting" (
    "gsmeetingid" SERIAL NOT NULL,
    "gsmeetingname" VARCHAR(100),

    CONSTRAINT "pk_gsmeeting_482100758" PRIMARY KEY ("gsmeetingid")
);

-- CreateTable
CREATE TABLE "gsmenu" (
    "gsmenuid" SERIAL NOT NULL,
    "menuname" VARCHAR(50),
    "menuitem" VARCHAR(50),
    "menulink" VARCHAR(50),
    "menumanagement" INTEGER,
    "sortorder" INTEGER,
    "parentid" INTEGER,

    CONSTRAINT "pk_gsmenu_498100815" PRIMARY KEY ("gsmenuid")
);

-- CreateTable
CREATE TABLE "gsmonth" (
    "monthid" SMALLINT NOT NULL,
    "name" VARCHAR(50) NOT NULL
);

-- CreateTable
CREATE TABLE "gsmtask" (
    "gsmtaskid" SERIAL NOT NULL,
    "name" VARCHAR(128),
    "description" VARCHAR(1000),
    "senddate" TIMESTAMP(6),
    "completed" VARCHAR(12),
    "gsmnameid" INTEGER,
    "gsmchargeid" INTEGER,
    "gsmmethodid" INTEGER,
    "filename" VARCHAR(200),

    CONSTRAINT "pk_gsmtask_514100872" PRIMARY KEY ("gsmtaskid")
);

-- CreateTable
CREATE TABLE "gsnotifications" (
    "from_gsemployeesid" INTEGER NOT NULL,
    "to_gsemployeesid" INTEGER NOT NULL,
    "notification_viewed" TIMESTAMP(6),
    "gsnotificationsid" SERIAL NOT NULL,
    "notification" TEXT,
    "notification_sent" TIMESTAMP(6),
    "viewed" DECIMAL(1,0) DEFAULT 0,
    "dateviewed" TIMESTAMP(6),
    "gstaskid" INTEGER
);

-- CreateTable
CREATE TABLE "gsoncomplist" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50),
    "flag" DECIMAL(1,0),

    CONSTRAINT "pk_gsoncomplist_530100929" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gspagessold" (
    "gspagessoldid" SERIAL NOT NULL,
    "gspublicationid" INTEGER NOT NULL,
    "mnth" INTEGER NOT NULL,
    "yr" INTEGER NOT NULL,
    "pgsedit" DOUBLE PRECISION,
    "pgsdirectory" DOUBLE PRECISION,
    "pgsadjustment" DOUBLE PRECISION,
    "frmsplanned16" INTEGER,
    "frmsplanned8" INTEGER,

    CONSTRAINT "pk_gspagessold_546100986" PRIMARY KEY ("gspagessoldid")
);

-- CreateTable
CREATE TABLE "gspaymentmethod" (
    "id" SERIAL NOT NULL,
    "paymentmethod" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,

    CONSTRAINT "pk_gspaymentmethod_1975730141" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gspayments" (
    "gscontractsid" INTEGER NOT NULL,
    "amount" INTEGER
);

-- CreateTable
CREATE TABLE "gspaymentterms" (
    "id" SERIAL NOT NULL,
    "terms" VARCHAR(100) DEFAULT '',
    "daystopay" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "pk_gspaymentterms_1911729913" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gspriority" (
    "gspriorityid" SERIAL NOT NULL,
    "gspriorityname" VARCHAR(50),
    "colorcode" VARCHAR(10),

    CONSTRAINT "pk_gspriority_562101043" PRIMARY KEY ("gspriorityid")
);

-- CreateTable
CREATE TABLE "gsprioritytask" (
    "gspriorityid" SERIAL NOT NULL,
    "gspriorityname" VARCHAR(50),
    "color" VARCHAR(100),
    "sortorder" INTEGER,
    "istask" DECIMAL(1,0),

    CONSTRAINT "pk_gsprioritytask_694397643" PRIMARY KEY ("gspriorityid")
);

-- CreateTable
CREATE TABLE "gsproddefaults" (
    "clientid" INTEGER NOT NULL,
    "ratecard" INTEGER,
    "presstype" INTEGER,
    "formsize" INTEGER,
    "credits" INTEGER,

    CONSTRAINT "pk_gsproddefaults_578101100" PRIMARY KEY ("clientid")
);

-- CreateTable
CREATE TABLE "gsprojecttask" (
    "id" SERIAL NOT NULL,
    "projectname" VARCHAR(50),

    CONSTRAINT "pk_gsprojecttask_790397985" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gspublicationdate" (
    "id" SERIAL NOT NULL,
    "magfrequencyid" INTEGER,
    "issuedate" TIMESTAMP(6),
    "yr" INTEGER,

    CONSTRAINT "pk_gspublicationdate_594101157" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gspublications" (
    "gspublicationid" SERIAL NOT NULL,
    "pubname" VARCHAR(60),
    "pubabbrev" VARCHAR(60),
    "avgpagerate" DOUBLE PRECISION,
    "issueset" INTEGER DEFAULT 1,
    "acctqbclass" VARCHAR(25),
    "circ" INTEGER,
    "producttypeid" INTEGER DEFAULT 1,
    "subproducttypeid" INTEGER,
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "ratecardid" INTEGER,
    "neptemp" DECIMAL(18,4),
    "nep" DECIMAL(18,4),
    "isdisplayinds" DECIMAL(1,0) DEFAULT 1,
    "productcategoryid" INTEGER,
    "imageurl" TEXT,
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "createdon" TIMESTAMP(6),
    "updatedon" TIMESTAMP(6),
    "pageheight" DECIMAL(18,3),
    "pagewidth" DECIMAL(18,3),
    "tasktype" DECIMAL(1,0),

    CONSTRAINT "pk_gspublications_610101214" PRIMARY KEY ("gspublicationid")
);

-- CreateTable
CREATE TABLE "app_product_extras" (
    "id" TEXT NOT NULL,
    "gspublicationid" INTEGER NOT NULL,
    "organization_id" TEXT,
    "description" TEXT,
    "type" TEXT,
    "is_featured" BOOLEAN DEFAULT false,
    "currency" TEXT DEFAULT 'USD',
    "pricing_model" TEXT,
    "billing_cycle" TEXT,
    "subcategory" TEXT,
    "tags" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "app_product_extras_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gspubsections" (
    "gspubsectionsid" SERIAL NOT NULL,
    "sectionname" VARCHAR(75) NOT NULL,
    "subproducttypeid" INTEGER,
    "sortorder" INTEGER,

    CONSTRAINT "pk_gspubsections_626101271" PRIMARY KEY ("gspubsectionsid")
);

-- CreateTable
CREATE TABLE "gsquickbooksaccts" (
    "accountname" VARCHAR(255),
    "city" VARCHAR(255),
    "state" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "gsreturnedcopies" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER,
    "gscontractsid" INTEGER,
    "pubid" INTEGER,
    "magazineid" INTEGER,
    "returnedcopies" INTEGER,
    "datereturned" TIMESTAMP(6),
    "yr" INTEGER,
    "mnth" INTEGER,
    "notes" VARCHAR(200),

    CONSTRAINT "pk_gsreturnedcopies_642101328" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "gssentemails" (
    "gssentemailid" SERIAL NOT NULL,
    "gscustomersid" INTEGER NOT NULL,
    "gsemployeesid" INTEGER NOT NULL,
    "msgsubject" VARCHAR(75),
    "msgtext" TEXT,
    "msgsent" TIMESTAMP(6),
    "msgreceived" TIMESTAMP(6),

    CONSTRAINT "pk_gssentemails_658101385" PRIMARY KEY ("gssentemailid")
);

-- CreateTable
CREATE TABLE "gsshippingprefs" (
    "gscustomersid" INTEGER,
    "gspublicationid" INTEGER,
    "copies" INTEGER,
    "notes" VARCHAR(60),
    "gsshippingtypeid" INTEGER,
    "magazineid" INTEGER
);

-- CreateTable
CREATE TABLE "gsshippingtypes" (
    "gsshippingtypeid" SERIAL NOT NULL,
    "gsshippingtypename" CHAR(100),

    CONSTRAINT "pk_gsshippingtypes_674101442" PRIMARY KEY ("gsshippingtypeid")
);

-- CreateTable
CREATE TABLE "gssubcustomerstype" (
    "gssubcustomerstypeid" SERIAL NOT NULL,
    "type" VARCHAR(100),
    "dateadded" TIMESTAMP(6),
    "enabled" DECIMAL(1,0),
    "gscustomerstypeid" INTEGER NOT NULL,

    CONSTRAINT "pk_gssubcustomerstype_690101499" PRIMARY KEY ("gssubcustomerstypeid")
);

-- CreateTable
CREATE TABLE "gssubpayments" (
    "subno" SERIAL NOT NULL,
    "gscontractsid" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "datereceived" TIMESTAMP(6),
    "dateentered" TIMESTAMP(6),
    "checkno" INTEGER,
    "paymentmethod" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "gssubsource" (
    "gssubsourceid" SERIAL NOT NULL,
    "name" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "gssurveyanswers" (
    "answerid" INTEGER NOT NULL,
    "surveyid" INTEGER NOT NULL,
    "questionid" INTEGER NOT NULL,
    "customerid" INTEGER,
    "answer" VARCHAR(255),
    "answertime" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "gssurveyquestions" (
    "questionid" INTEGER NOT NULL,
    "surveyid" INTEGER,
    "surveyquestion" VARCHAR(150),
    "surveyanswers" VARCHAR(255),
    "questiontype" INTEGER
);

-- CreateTable
CREATE TABLE "gstask" (
    "gstaskid" SERIAL NOT NULL,
    "gsempid_assigned" INTEGER,
    "gsempid_created" INTEGER,
    "name" VARCHAR(1000),
    "description" VARCHAR(1000),
    "duedate" TIMESTAMP(6),
    "startdate" TIMESTAMP(6),
    "priority" VARCHAR(200),
    "private" DECIMAL(1,0),
    "completed" VARCHAR(12),
    "gscategoriesid" INTEGER,

    CONSTRAINT "pk_gstask_1344059874" PRIMARY KEY ("gstaskid")
);

-- CreateTable
CREATE TABLE "gstemplate" (
    "gstemplateid" SERIAL NOT NULL,
    "description" VARCHAR(128),
    "filename" VARCHAR(26),

    CONSTRAINT "pk_gstemplate_722101613" PRIMARY KEY ("gstemplateid")
);

-- CreateTable
CREATE TABLE "gswriter" (
    "gswriterid" SERIAL NOT NULL,
    "name" VARCHAR(100) DEFAULT '',
    "email" VARCHAR(50) DEFAULT '',
    "phone" VARCHAR(50) DEFAULT '',
    "address" VARCHAR(50) DEFAULT '',
    "city" VARCHAR(50) DEFAULT '',
    "state" VARCHAR(50) DEFAULT '',
    "zip" VARCHAR(50) DEFAULT '',
    "notes" VARCHAR(50) DEFAULT ''
);

-- CreateTable
CREATE TABLE "gszip" (
    "city" VARCHAR(50),
    "state" VARCHAR(50),
    "zip" VARCHAR(50),
    "A/C" VARCHAR(50),
    "fips" VARCHAR(50),
    "county" VARCHAR(50),
    "Pref?" VARCHAR(50),
    "T/Z" VARCHAR(50),
    "DST?" VARCHAR(50),
    "type" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "pgactivity" (
    "workflowid" VARCHAR(36) NOT NULL,
    "activityid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "status" INTEGER NOT NULL,
    "assignedon" TIMESTAMP(6),
    "dueon" TIMESTAMP(6),
    "createdon" TIMESTAMP(6) NOT NULL,
    "modifiedon" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "pgactivityresult" (
    "activityid" VARCHAR(36) NOT NULL,
    "startedon" TIMESTAMP(6) NOT NULL,
    "completedon" TIMESTAMP(6) NOT NULL,
    "state" SMALLINT NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "modifiedon" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "pgassetgroup" (
    "groupid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "productid" INTEGER NOT NULL,
    "issuenumber" INTEGER,
    "issueyear" INTEGER,
    "type" SMALLINT NOT NULL DEFAULT 0,
    "state" SMALLINT NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "modifiedon" TIMESTAMP(6) NOT NULL,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_pgassetgroup_32211365" PRIMARY KEY ("groupid")
);

-- CreateTable
CREATE TABLE "pgassetgroupmember" (
    "groupid" VARCHAR(36) NOT NULL,
    "mailid" VARCHAR(255) NOT NULL,
    "firstname" VARCHAR(100) NOT NULL,
    "lastname" VARCHAR(100) NOT NULL
);

-- CreateTable
CREATE TABLE "pgassetitem" (
    "itemid" VARCHAR(36) NOT NULL,
    "groupid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "extension" VARCHAR(10) NOT NULL,
    "parentitemid" VARCHAR(36),
    "comments" VARCHAR(255),
    "submittermailid" VARCHAR(100) NOT NULL,
    "submittername" VARCHAR(100) NOT NULL,
    "customerid" INTEGER,
    "customername" VARCHAR(100),
    "contractid" INTEGER,
    "entityid" VARCHAR(36),
    "entitytype" VARCHAR(36),
    "status" SMALLINT NOT NULL DEFAULT 0,
    "state" SMALLINT NOT NULL DEFAULT 0,
    "filesize" INTEGER NOT NULL DEFAULT 0,
    "width" INTEGER NOT NULL DEFAULT 0,
    "height" INTEGER NOT NULL DEFAULT 0,
    "createdon" TIMESTAMP(6) NOT NULL,
    "modifiedon" TIMESTAMP(6) NOT NULL,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "srcassetitemid" VARCHAR(36),
    "seindexstatus" DECIMAL(1,0) DEFAULT 0,
    "hostissueid" VARCHAR(50),
    "physicalfilestatus" DECIMAL(1,0) DEFAULT 0,
    "id" BIGSERIAL NOT NULL,

    CONSTRAINT "pai_id_1680217236" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pgassetitemhyperlink" (
    "assetitemid" VARCHAR(36) NOT NULL,
    "hyperlinkid" VARCHAR(36) NOT NULL,
    "x" DECIMAL(9,4) NOT NULL,
    "y" DECIMAL(9,4) NOT NULL,
    "width" DECIMAL(7,3) NOT NULL,
    "height" DECIMAL(7,3) NOT NULL,
    "url" VARCHAR(255) NOT NULL
);

-- CreateTable
CREATE TABLE "pgassetitemtext" (
    "assetitemid" VARCHAR(36) NOT NULL,
    "text" TEXT NOT NULL,
    "id" BIGSERIAL NOT NULL,

    CONSTRAINT "pait_id_1696217293" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pgclip" (
    "clipid" VARCHAR(36) NOT NULL,
    "productid" INTEGER NOT NULL,
    "issuenumber" INTEGER NOT NULL,
    "issueyear" INTEGER NOT NULL,
    "cliptype" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "modifiedon" TIMESTAMP(6) NOT NULL,
    "deissueid" INTEGER,
    "spreadclip1" VARCHAR(36),
    "spreadclip2" VARCHAR(36),

    CONSTRAINT "pk_pgclipboard_144211764" PRIMARY KEY ("clipid")
);

-- CreateTable
CREATE TABLE "pgcomment" (
    "commentid" VARCHAR(36) NOT NULL,
    "entityid" VARCHAR(36) NOT NULL,
    "entitytype" VARCHAR(36) NOT NULL,
    "text" TEXT NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "createdby" VARCHAR(255) NOT NULL
);

-- CreateTable
CREATE TABLE "pgcontent" (
    "contentid" VARCHAR(36) NOT NULL,
    "entityid" VARCHAR(36) NOT NULL,
    "entitytype" VARCHAR(36) NOT NULL,
    "text" TEXT,
    "wordcount" INTEGER,
    "charactercount" INTEGER,
    "createdon" TIMESTAMP(6) NOT NULL,
    "modifiedon" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "pgcontentviews" (
    "pgcntviewid" BIGSERIAL NOT NULL,
    "issueid" VARCHAR(50),
    "eventpage" VARCHAR(50),
    "eventtype" INTEGER,
    "pageviews" BIGINT,
    "dtcreated" TIMESTAMP(6) DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(6)),
    "deissueid" BIGINT,

    CONSTRAINT "pk_pgcontentviews_208211992" PRIMARY KEY ("pgcntviewid")
);

-- CreateTable
CREATE TABLE "pgcontributor" (
    "editorialid" VARCHAR(36) NOT NULL,
    "contactid" INTEGER NOT NULL,
    "type" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "pgdefolio" (
    "folioid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "size" INTEGER NOT NULL,
    "dflocreatedon" TIMESTAMP(6) DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "pgdehistory" (
    "User" VARCHAR(255) NOT NULL,
    "sourceid" VARCHAR(36) NOT NULL,
    "type" SMALLINT NOT NULL,
    "content" TEXT NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "pgdeissueplan" (
    "folioid" VARCHAR(36) NOT NULL,
    "productid" INTEGER NOT NULL,
    "issuenumber" INTEGER NOT NULL,
    "issueyear" INTEGER NOT NULL,
    "Order" INTEGER NOT NULL,
    "relativepagestartindex" SMALLINT NOT NULL,
    "absolutepagestartindex" SMALLINT NOT NULL,
    "isfolioowner" DECIMAL(1,0) DEFAULT 0,
    "iscover" DECIMAL(1,0) DEFAULT 0,
    "deissueid" BIGINT,
    "dipcreatedon" TIMESTAMP(6) DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "pgeditorial" (
    "editorialid" VARCHAR(36) NOT NULL,
    "productid" INTEGER NOT NULL,
    "issuenumber" INTEGER NOT NULL,
    "issueyear" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "sizeid" INTEGER NOT NULL,
    "typeid" INTEGER NOT NULL,
    "pagecount" DECIMAL(5,2),
    "wordcount" INTEGER,
    "budget" DECIMAL(8,2),
    "budgetperpage" DECIMAL(8,2),
    "budgetperword" DECIMAL(8,2),
    "createdon" TIMESTAMP(6) NOT NULL,
    "modifiedon" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "pk_pgeditorial_416212733" PRIMARY KEY ("editorialid")
);

-- CreateTable
CREATE TABLE "pgfolio" (
    "folioid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" VARCHAR(255) NOT NULL,
    "size" INTEGER NOT NULL,
    "flocreatedon" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "isexpanded" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "pghistory" (
    "User" VARCHAR(255) NOT NULL,
    "sourceid" VARCHAR(36) NOT NULL,
    "type" SMALLINT NOT NULL,
    "content" TEXT NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "issueid" VARCHAR(50) NOT NULL
);

-- CreateTable
CREATE TABLE "pghotspot" (
    "hotspotid" VARCHAR(36) NOT NULL,
    "pageid" VARCHAR(36) NOT NULL,
    "x" DECIMAL(9,4) NOT NULL,
    "y" DECIMAL(9,4) NOT NULL,
    "width" DECIMAL(7,3) NOT NULL,
    "height" DECIMAL(7,3) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "type" INTEGER NOT NULL,
    "command" VARCHAR(255) NOT NULL,
    "tooltip" VARCHAR(255),
    "borderwidth" SMALLINT NOT NULL DEFAULT 2,
    "bordercolor" VARCHAR(8) NOT NULL DEFAULT '#000000',
    "backgroundcolor" VARCHAR(8) NOT NULL DEFAULT '#FFFFFF',
    "pghscreatedon" TIMESTAMP(6) DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "pginsertionnotes" (
    "id" SERIAL NOT NULL,
    "notes" TEXT,
    "contractid" INTEGER,
    "isdeleted" DECIMAL(1,0) DEFAULT 0,
    "dateadded" TIMESTAMP(6),

    CONSTRAINT "pk__pginsert__3214ec27504c1376" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pginspection" (
    "itemid" VARCHAR(36) NOT NULL,
    "adnumber" VARCHAR(50),
    "advertiser" VARCHAR(255),
    "caption" VARCHAR(255),
    "runasis" DECIMAL(1,0),
    "inspectedby" VARCHAR(255),
    "inspectiondeadline" VARCHAR(50),
    "typereceived" VARCHAR(50),
    "quantity" INTEGER,
    "isswopcertified" INTEGER,
    "hasswopcolorbars" INTEGER,
    "hasothercolorbars" INTEGER,
    "hasseperateproof" INTEGER,
    "iscontentproofmatchcolor" INTEGER,
    "fileformat" VARCHAR(255),
    "resolution" VARCHAR(50),
    "trimwidth" VARCHAR(10),
    "trimheight" VARCHAR(10),
    "isbleed" INTEGER,
    "issafety" INTEGER,
    "colortype" INTEGER,
    "tonaldensity" VARCHAR(50),
    "isadjustmentrequired" INTEGER,
    "isoktoadjust" INTEGER,
    "isnewfilesupplied" INTEGER,
    "isfontsembedded" INTEGER,
    "missingfonts" VARCHAR(255),
    "isblack" INTEGER,
    "iswhitesmaller" INTEGER,
    "notifiedwho" VARCHAR(255),
    "notifieddate" VARCHAR(50),
    "solution" VARCHAR(1000),
    "replacementaccepteddate" VARCHAR(50),
    "comments" VARCHAR(1000),
    "ispassed" INTEGER,
    "assignedto" VARCHAR(255),
    "assignedon" VARCHAR(10),
    "qualitycontrolto" VARCHAR(255),
    "qualitycontrolon" VARCHAR(10),
    "finaltoprinteron" VARCHAR(10),
    "proofreceivedon" VARCHAR(10)
);

-- CreateTable
CREATE TABLE "pginteractivity" (
    "interactivityid" VARCHAR(36) NOT NULL,
    "pageid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "type" INTEGER NOT NULL,
    "x" DECIMAL(9,4) NOT NULL,
    "y" DECIMAL(9,4) NOT NULL,
    "width" DECIMAL(7,3) NOT NULL,
    "height" DECIMAL(7,3) NOT NULL,
    "parameters" TEXT,
    "createdon" TIMESTAMP(6) NOT NULL,
    "title" VARCHAR(500),
    "description" VARCHAR(1000)
);

-- CreateTable
CREATE TABLE "pginteractivityitem" (
    "interactivityid" VARCHAR(36) NOT NULL,
    "itemid" VARCHAR(36) NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "itemurl" VARCHAR(200)
);

-- CreateTable
CREATE TABLE "pgissuehostdetails" (
    "hostserverid" BIGINT,
    "issueid" VARCHAR(20),
    "deissueid" BIGINT,
    "hostdomainname" VARCHAR(200),
    "hostphysicalfolder" VARCHAR(200),
    "createdon" TIMESTAMP(6) DEFAULT timezone('UTC'::text, CURRENT_TIMESTAMP(6)),
    "assetservervd" VARCHAR(50),
    "assetprocessver" VARCHAR(10) DEFAULT 'v9'
);

-- CreateTable
CREATE TABLE "pgissueplan" (
    "folioid" VARCHAR(36) NOT NULL,
    "productid" INTEGER NOT NULL,
    "issuenumber" INTEGER NOT NULL,
    "issueyear" INTEGER NOT NULL,
    "Order" INTEGER NOT NULL,
    "isfolioowner" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "relativepagestartindex" SMALLINT NOT NULL,
    "absolutepagestartindex" SMALLINT NOT NULL,
    "iscover" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "ipcreatedon" TIMESTAMP(6) DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "pgissuetoc" (
    "tocid" BIGSERIAL NOT NULL,
    "issuenumber" INTEGER,
    "issueyear" INTEGER,
    "productid" INTEGER,
    "fileid" VARCHAR(36),
    "toctext" TEXT,
    "toccreatedon" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "deissueid" INTEGER,

    CONSTRAINT "pk_pgissuetoc_393924625" PRIMARY KEY ("tocid")
);

-- CreateTable
CREATE TABLE "pgpage" (
    "pageid" VARCHAR(36) NOT NULL,
    "entityid" VARCHAR(36),
    "entitytype" VARCHAR(36),
    "Order" INTEGER NOT NULL,
    "backgroundcolor" VARCHAR(8) NOT NULL DEFAULT '0xFFFFFF',
    "bordercolor" VARCHAR(8) NOT NULL DEFAULT '0x000000',
    "fileid" VARCHAR(36),
    "text" TEXT,
    "pgcreatedon" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "rptpgid" VARCHAR(10),
    "dspgid" VARCHAR(10),
    "depageviews" BIGINT DEFAULT 0,
    "pagename" VARCHAR(50),
    "issystempagename" DECIMAL(1,0) DEFAULT 1,
    "ispage" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk_pgpage_1998890438" PRIMARY KEY ("pageid")
);

-- CreateTable
CREATE TABLE "pgpageinsert" (
    "insertid" VARCHAR(36) NOT NULL,
    "entityid" VARCHAR(36),
    "entitytype" VARCHAR(36),
    "contractid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "sizeid" VARCHAR(36) NOT NULL,
    "x" DECIMAL(9,4) NOT NULL DEFAULT 0,
    "y" DECIMAL(9,4) NOT NULL DEFAULT 0,
    "type" INTEGER NOT NULL DEFAULT 0,
    "tag" VARCHAR(255),
    "backgroundcolor" VARCHAR(8) NOT NULL DEFAULT '0xFFFFFF',
    "bordercolor" VARCHAR(8) NOT NULL DEFAULT '0x000000',
    "isimported" DECIMAL(1,0) DEFAULT 0,
    "pginscreatedon" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "inserttype" INTEGER DEFAULT 0,
    "genericinspgid" VARCHAR(36),
    "issueid" VARCHAR(36)
);

-- CreateTable
CREATE TABLE "pgpageinsertmoved" (
    "insertid" VARCHAR(36) NOT NULL,
    "entityid" VARCHAR(36),
    "entitytype" VARCHAR(36),
    "contractid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "sizeid" VARCHAR(36) NOT NULL,
    "x" DECIMAL(9,4) NOT NULL DEFAULT 0,
    "y" DECIMAL(9,4) NOT NULL DEFAULT 0,
    "type" INTEGER NOT NULL DEFAULT 0,
    "tag" VARCHAR(255),
    "backgroundcolor" VARCHAR(8) NOT NULL DEFAULT '0xFFFFFF',
    "bordercolor" VARCHAR(8) NOT NULL DEFAULT '0x000000',
    "isimported" DECIMAL(1,0) DEFAULT 0,
    "pginscreatedon" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "srcissueid" VARCHAR(20),
    "destissueid" VARCHAR(20),
    "isdeleted" DECIMAL(1,0) DEFAULT 0,
    "pginsmovedon" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "pginsmovedeletedon" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "pgpageitem" (
    "layoutitemid" VARCHAR(36) NOT NULL,
    "pageid" VARCHAR(36) NOT NULL,
    "contentid" VARCHAR(36) NOT NULL,
    "tag" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "pgqueue" (
    "queueid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100),
    "type" INTEGER NOT NULL,
    "productid" INTEGER NOT NULL,
    "issuenumber" INTEGER NOT NULL,
    "issueyear" INTEGER NOT NULL,
    "mailid" VARCHAR(255) NOT NULL,
    "content" TEXT NOT NULL,
    "status" SMALLINT NOT NULL DEFAULT 0,
    "createdon" TIMESTAMP(6) NOT NULL,
    "deissueid" INTEGER
);

-- CreateTable
CREATE TABLE "pgrecent" (
    "mailid" VARCHAR(255) NOT NULL,
    "productid" INTEGER NOT NULL,
    "productname" VARCHAR(60) NOT NULL,
    "issuename" VARCHAR(25) NOT NULL,
    "issuenumber" INTEGER NOT NULL,
    "issueyear" INTEGER NOT NULL,
    "workedon" TIMESTAMP(6) NOT NULL,
    "deissueid" INTEGER,
    "issueselectiontype" CHAR(1) DEFAULT 'P'
);

-- CreateTable
CREATE TABLE "pgsetting" (
    "id" VARCHAR(36) NOT NULL,
    "content" TEXT
);

-- CreateTable
CREATE TABLE "pgsize" (
    "sizeid" INTEGER NOT NULL,
    "productid" INTEGER NOT NULL,
    "definitionid" VARCHAR(36),
    "width" DECIMAL(9,4) NOT NULL DEFAULT 0,
    "height" DECIMAL(9,4) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "pgsizedefinition" (
    "definitionid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "size" DECIMAL(8,4) NOT NULL,
    "layout" VARCHAR(36) NOT NULL,
    "constant" VARCHAR(36) NOT NULL,
    "multiplier" DECIMAL(6,2) NOT NULL,
    "sortorder" SMALLINT DEFAULT 0
);

-- CreateTable
CREATE TABLE "pgsizetobu" (
    "sizeid" INTEGER,
    "bu" INTEGER,
    "definationid" VARCHAR(50),
    "width" DECIMAL(18,0),
    "height" DECIMAL(18,0)
);

-- CreateTable
CREATE TABLE "pgtag" (
    "entityid" VARCHAR(36) NOT NULL,
    "entitytype" VARCHAR(36) NOT NULL,
    "text" VARCHAR(255) NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "id" BIGSERIAL NOT NULL,

    CONSTRAINT "pt_id_1664217179" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pgworkflow" (
    "workflowid" VARCHAR(36) NOT NULL,
    "entityid" VARCHAR(36) NOT NULL,
    "entitytype" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "pgworkgroupdetails" (
    "workgroupdetailsid" SERIAL NOT NULL,
    "workgroupid" INTEGER NOT NULL,
    "productid" INTEGER,
    "issuenumber" INTEGER,
    "issueyear" INTEGER
);

-- CreateTable
CREATE TABLE "pgworkgroups" (
    "workgroupid" SERIAL NOT NULL,
    "workgroupname" VARCHAR(100) NOT NULL,
    "fromdate" DATE,
    "todate" DATE,
    "isdeleted" DECIMAL(1,0) DEFAULT 0,
    "createdby" VARCHAR(36),
    "createddate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "modifiedby" VARCHAR(36),
    "modifieddate" TIMESTAMP(6) DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "ppad" (
    "adid" SERIAL NOT NULL,
    "advertiserid" INTEGER NOT NULL,
    "advertiserbrandid" INTEGER,
    "mediatitleid" INTEGER NOT NULL,
    "markettypeid" INTEGER,
    "mediaunits" DECIMAL(5,2) NOT NULL,
    "reportingmonth" INTEGER NOT NULL,
    "reportingyear" INTEGER NOT NULL,
    "sourceid" UUID,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "createddate" TIMESTAMP(6),
    "modifieddate" TIMESTAMP(6),

    CONSTRAINT "pk_ppad_1470732392" PRIMARY KEY ("adid")
);

-- CreateTable
CREATE TABLE "ppaddress" (
    "addressid" SERIAL NOT NULL,
    "street" VARCHAR(50),
    "street2" VARCHAR(50),
    "city" VARCHAR(50),
    "county" VARCHAR(50),
    "region" VARCHAR(50),
    "postalcode" VARCHAR(50),
    "country" VARCHAR(50),
    "latitude" DECIMAL(18,6),
    "longitude" DECIMAL(18,6),
    "isdirty" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppaddress_1518732563" PRIMARY KEY ("addressid")
);

-- CreateTable
CREATE TABLE "ppadvertiser" (
    "advertiserid" SERIAL NOT NULL,
    "advertiser" VARCHAR(100),
    "agency" VARCHAR(100),
    "addressid" INTEGER,
    "phone" VARCHAR(20),
    "website" VARCHAR(100),
    "email" VARCHAR(100),
    "sourceid" UUID,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppadvertiser_1566732734" PRIMARY KEY ("advertiserid")
);

-- CreateTable
CREATE TABLE "ppadvertiserbrand" (
    "advertiserbrandid" SERIAL NOT NULL,
    "advertiserbrand" VARCHAR(50),
    "advertiserid" INTEGER,
    "sourceid" UUID,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppadvertiserbrand_1614732905" PRIMARY KEY ("advertiserbrandid")
);

-- CreateTable
CREATE TABLE "ppadvertisercategory" (
    "advertiserid" INTEGER NOT NULL,
    "categoryid" INTEGER NOT NULL,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "ppadvertisercontext" (
    "advertiserid" INTEGER NOT NULL,
    "context" VARCHAR(100),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "ppadvertiserrepresentative" (
    "advertiserid" INTEGER NOT NULL,
    "representativeid" INTEGER NOT NULL,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "ppadvertiserterritory" (
    "advertiserid" INTEGER NOT NULL,
    "territoryid" INTEGER NOT NULL,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "ppcategory" (
    "categoryid" SERIAL NOT NULL,
    "category" VARCHAR(50),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppcategory_1790733532" PRIMARY KEY ("categoryid")
);

-- CreateTable
CREATE TABLE "ppimport" (
    "importid" UUID NOT NULL,
    "importdate" TIMESTAMP(6) NOT NULL,
    "documentname" VARCHAR(255) NOT NULL,
    "documenthash" VARCHAR(255),

    CONSTRAINT "pk_ppimport_1838733703" PRIMARY KEY ("importid")
);

-- CreateTable
CREATE TABLE "ppissue" (
    "issueid" SERIAL NOT NULL,
    "mediatitleid" INTEGER NOT NULL,
    "issuename" VARCHAR(50) NOT NULL,
    "issueyear" INTEGER NOT NULL,
    "reportingmonth" INTEGER NOT NULL,
    "reportingyear" INTEGER NOT NULL,
    "sourceid" UUID,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppissue_1870733817" PRIMARY KEY ("issueid")
);

-- CreateTable
CREATE TABLE "ppmarkettype" (
    "markettypeid" SERIAL NOT NULL,
    "markettype" VARCHAR(50),
    "sourceid" UUID,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppmarkettype_1918733988" PRIMARY KEY ("markettypeid")
);

-- CreateTable
CREATE TABLE "ppmediacompany" (
    "mediacompanyid" SERIAL NOT NULL,
    "mediacompany" VARCHAR(50),
    "addressid" INTEGER,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppmediacompany_1966734159" PRIMARY KEY ("mediacompanyid")
);

-- CreateTable
CREATE TABLE "ppmediatitle" (
    "mediatitleid" SERIAL NOT NULL,
    "mediatitle" VARCHAR(100),
    "mediacompanyid" INTEGER,
    "mediatypeid" INTEGER,
    "pagerate" INTEGER NOT NULL DEFAULT 0,
    "sourceid" UUID,
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppmediatitle_2014734330" PRIMARY KEY ("mediatitleid")
);

-- CreateTable
CREATE TABLE "ppmediatype" (
    "mediatypeid" SERIAL NOT NULL,
    "mediatype" VARCHAR(50),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppmediatype_2078734558" PRIMARY KEY ("mediatypeid")
);

-- CreateTable
CREATE TABLE "pprepresentative" (
    "representativeid" SERIAL NOT NULL,
    "representative" VARCHAR(50),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_pprepresentative_2126734729" PRIMARY KEY ("representativeid")
);

-- CreateTable
CREATE TABLE "ppterritory" (
    "territoryid" SERIAL NOT NULL,
    "territory" VARCHAR(50),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_ppterritory_27251252" PRIMARY KEY ("territoryid")
);

-- CreateTable
CREATE TABLE "ppusersettings" (
    "userid" UUID NOT NULL,
    "pageid" VARCHAR(255) NOT NULL,
    "settings" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "tblactionspanelconfig" (
    "id" SERIAL NOT NULL,
    "pagename" VARCHAR(100) NOT NULL,
    "actionname" VARCHAR(250) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "controlid" VARCHAR(100) NOT NULL,
    "controltype" VARCHAR(100) NOT NULL DEFAULT 'taglabel',
    "isvisible" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "enabledforcrm" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "enabledforcompany" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "enabledforcontact" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "enabledforagency" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "enabledforagencycontact" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "showinaddmode" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "clickhandler" TEXT,
    "calloutid" VARCHAR(100),
    "style" VARCHAR(100),
    "saonly" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "hideforreadonlyrep" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "groupid" VARCHAR(100),
    "adminonly" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblactivitiesdeleted" (
    "id" SERIAL NOT NULL,
    "gsactivitiesid" INTEGER NOT NULL,
    "gscustomersid" INTEGER,
    "notes" TEXT,
    "datestarted" TIMESTAMP(6),
    "dateadded" TIMESTAMP(6),
    "enabled" DECIMAL(1,0),
    "callback" TIMESTAMP(6),
    "called" DECIMAL(1,0),
    "meeting" TIMESTAMP(6),
    "meetingtype" INTEGER,
    "gsemployeesid" INTEGER,
    "salesresults" INTEGER,
    "meetingend" TIMESTAMP(6),
    "meetingdesc" VARCHAR(255),
    "probability" VARCHAR(50),
    "objection" VARCHAR(50),
    "hrsbilled" INTEGER,
    "hrsactual" INTEGER,
    "hrsrates" INTEGER,
    "completed" DECIMAL(1,0),
    "recur" CHAR(10),
    "occur" INTEGER,
    "recurflag" CHAR(10),
    "gsactivitysalesid" INTEGER,
    "activitytype" INTEGER,
    "private" DECIMAL(1,0),
    "importfileid" INTEGER,
    "importid" INTEGER,
    "datecompleted" TIMESTAMP(6),
    "viewed" DECIMAL(1,0),
    "dateviewed" TIMESTAMP(6),
    "iscall" DECIMAL(1,0),
    "isemail" DECIMAL(1,0),
    "isletter" DECIMAL(1,0),
    "deletedby" INTEGER,
    "deleteddate" TIMESTAMP(6) DEFAULT clock_timestamp(),

    CONSTRAINT "pk_tblactivitiesdeleted_1083971038" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblactivitiessynced" (
    "id" INTEGER NOT NULL,
    "custid" INTEGER,
    "eventid" VARCHAR(1000),
    "updatetype" VARCHAR(32),
    "title" VARCHAR(100),
    "Desc" VARCHAR(4000),
    "author" VARCHAR(100),
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "recur" VARCHAR(1000),
    "gsemployeesid" INTEGER
);

-- CreateTable
CREATE TABLE "tblactivitysystem" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "note" TEXT NOT NULL,
    "createdbyid" INTEGER NOT NULL,
    "createddate" TIMESTAMP(6) NOT NULL,
    "ispinned" DECIMAL(1,0),
    "activitytype" INTEGER,
    "campaignid" TEXT,
    "iscompany" DECIMAL(1,0),
    "isletter" DECIMAL(1,0),
    "gscontractsid" INTEGER,
    "importfileid" INTEGER,
    "importid" INTEGER,
    "activitylabel" VARCHAR(100),

    CONSTRAINT "pk_tblactivitysystem_combinationcolumns_1962698290" PRIMARY KEY ("id","customerid")
);

-- CreateTable
CREATE TABLE "tblactivitysystemlabels" (
    "id" SERIAL NOT NULL,
    "note" TEXT NOT NULL,
    "activitylabel" VARCHAR(100),
    "category" INTEGER,
    "Default" DECIMAL(1,0),
    "issystem" DECIMAL(1,0),
    "reason" TEXT,
    "sortorder" INTEGER,
    "iseditable" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tbladtaxes" (
    "id" SERIAL NOT NULL,
    "taxcode" VARCHAR(25),
    "taxname" VARCHAR(75),
    "percentage" DECIMAL(19,4),
    "states" VARCHAR(255),

    CONSTRAINT "pk__tbladtaxes__5a9a4855" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbladvsearchallcolumn2producttype" (
    "id" SERIAL NOT NULL,
    "columnid" INTEGER,
    "producttype" INTEGER,
    "pagetype" INTEGER,

    CONSTRAINT "pk__tbladvse__3214ec2728331521" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbladvsearchallcolumn2producttype_backup_dev33377" (
    "id" SERIAL NOT NULL,
    "columnid" INTEGER,
    "producttype" INTEGER,
    "pagetype" INTEGER
);

-- CreateTable
CREATE TABLE "tbladvsearchallcolumn2producttype_dev_33054" (
    "id" SERIAL NOT NULL,
    "columnid" INTEGER,
    "producttype" INTEGER,
    "pagetype" INTEGER
);

-- CreateTable
CREATE TABLE "tbladvsearchallcolumns" (
    "id" SERIAL NOT NULL,
    "dbname" VARCHAR(100) NOT NULL,
    "displayname" VARCHAR(100) NOT NULL,
    "isdefault" INTEGER NOT NULL,
    "pagetype" INTEGER,
    "propertymappingname" VARCHAR(200),
    "sortorder" INTEGER,
    "dbscript" VARCHAR(2000),
    "groupby" VARCHAR(200),

    CONSTRAINT "pk_tbladvsearchallcolumns_745977934" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbladvsearchallcolumns_17012025" (
    "id" SERIAL NOT NULL,
    "dbname" VARCHAR(100) NOT NULL,
    "displayname" VARCHAR(100) NOT NULL,
    "isdefault" INTEGER NOT NULL,
    "pagetype" INTEGER,
    "propertymappingname" VARCHAR(200),
    "sortorder" INTEGER,
    "dbscript" VARCHAR(2000),
    "groupby" VARCHAR(200)
);

-- CreateTable
CREATE TABLE "tbladvsearchallcolumns_19022025" (
    "id" SERIAL NOT NULL,
    "dbname" VARCHAR(100) NOT NULL,
    "displayname" VARCHAR(100) NOT NULL,
    "isdefault" INTEGER NOT NULL,
    "pagetype" INTEGER,
    "propertymappingname" VARCHAR(200),
    "sortorder" INTEGER,
    "dbscript" VARCHAR(2000),
    "groupby" VARCHAR(200)
);

-- CreateTable
CREATE TABLE "tbladvsearchallcolumns_backup_dev33377" (
    "id" INTEGER NOT NULL,
    "dbname" VARCHAR(100) NOT NULL,
    "displayname" VARCHAR(100) NOT NULL,
    "isdefault" INTEGER NOT NULL,
    "pagetype" INTEGER,
    "propertymappingname" VARCHAR(200),
    "sortorder" INTEGER,
    "dbscript" VARCHAR(2000),
    "groupby" VARCHAR(200)
);

-- CreateTable
CREATE TABLE "tbladvsearchallcolumns_dev31299" (
    "id" SERIAL NOT NULL,
    "dbname" VARCHAR(100) NOT NULL,
    "displayname" VARCHAR(100) NOT NULL,
    "isdefault" INTEGER NOT NULL,
    "pagetype" INTEGER,
    "propertymappingname" VARCHAR(200),
    "sortorder" INTEGER,
    "dbscript" VARCHAR(2000),
    "groupby" VARCHAR(200)
);

-- CreateTable
CREATE TABLE "tblaiagentlog" (
    "id" SERIAL NOT NULL,
    "currentvalues" TEXT,
    "updatedvalues" TEXT,
    "loggedinuser" INTEGER,
    "userprompt" VARCHAR(500),
    "sqlquery" TEXT,
    "actionname" VARCHAR(50),
    "createdatetime" TIMESTAMP(6),

    CONSTRAINT "pk__tblaiage__3214ec071067fcf2" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblaifiles" (
    "fileid" SERIAL NOT NULL,
    "itemid" INTEGER,
    "filename" VARCHAR(255),
    "filesize" DECIMAL(18,2),
    "filepath" VARCHAR(255),
    "assistantid" TEXT,
    "assistantfileid" TEXT,
    "modifieddate" DATE,
    "aifilestatus" TEXT,
    "userid" INTEGER,
    "itemtype" TEXT,
    "aitemplateid" INTEGER,

    CONSTRAINT "pk__tblaifil__6f0f98bfa1f684b2" PRIMARY KEY ("fileid")
);

-- CreateTable
CREATE TABLE "tblaifiles_bkp_18032025" (
    "fileid" SERIAL NOT NULL,
    "itemid" INTEGER,
    "filename" VARCHAR(255),
    "filesize" DECIMAL(18,2),
    "filepath" VARCHAR(255),
    "assistantid" TEXT,
    "assistantfileid" TEXT,
    "modifieddate" DATE,
    "aifilestatus" TEXT,
    "userid" INTEGER,
    "itemtype" TEXT,
    "aitemplateid" INTEGER
);

-- CreateTable
CREATE TABLE "tblarpaymentgatewayccprofilehistory" (
    "id" SERIAL NOT NULL,
    "customerprofileid" INTEGER NOT NULL,
    "previousexpirydate" CHAR(20),
    "currentexpirydate" CHAR(20),
    "updatedby" INTEGER,
    "updatedbytime" TIMESTAMP(6),
    "customerid" INTEGER,

    CONSTRAINT "pk_tblarpaymentgatewayccprofilehistory_432980869" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblasyncactivity" (
    "id" SERIAL NOT NULL,
    "eventtype" VARCHAR(20),
    "refrenceid" INTEGER,
    "name" VARCHAR(100),
    "success" INTEGER,
    "repid" INTEGER,
    "threadmessage" TEXT,
    "attachmenturl" TEXT,
    "countofcontacts" INTEGER,
    "createdon" TIMESTAMP(6),
    "completedon" TIMESTAMP(6),
    "threadid" VARCHAR(1000)
);

-- CreateTable
CREATE TABLE "tblasynctrackactivity" (
    "id" SERIAL NOT NULL,
    "referenceid" INTEGER,
    "asyncid" INTEGER,
    "transtype" VARCHAR(100),
    "updateddatetime" TIMESTAMP(6),
    "status" VARCHAR(20),

    CONSTRAINT "pk__tblasync__3214ec07332dd77e" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblautomatedschedule" (
    "criteriaid" SERIAL NOT NULL,
    "criterianame" VARCHAR(100) NOT NULL,
    "startdate" TIMESTAMP(6) NOT NULL,
    "enddate" TIMESTAMP(6),
    "frequencytype" SMALLINT NOT NULL,
    "frequency" VARCHAR(50) NOT NULL,
    "frequencytime" TIME(6),
    "workflowid" INTEGER NOT NULL,
    "subworkflowid" INTEGER NOT NULL,
    "criteriatype" VARCHAR(50) NOT NULL,
    "criteriajsonobject" TEXT NOT NULL,
    "status" VARCHAR(50),
    "notificationtoids" TEXT,
    "pagetype" INTEGER NOT NULL,
    "parentid" INTEGER,
    "createdby" INTEGER,
    "createdon" TIMESTAMP(6),
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),

    CONSTRAINT "pk_tblautomatedschedule_1785317670" PRIMARY KEY ("criteriaid")
);

-- CreateTable
CREATE TABLE "tblautomatedschedulehistory" (
    "id" SERIAL NOT NULL,
    "criteriaid" INTEGER NOT NULL,
    "fieldname" VARCHAR(100) NOT NULL,
    "previousvalue" TEXT,
    "currentvalue" TEXT,
    "updatedby" VARCHAR(200) NOT NULL,
    "updatedon" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "pk_tblautomatedschedulehistory_1950890267" PRIMARY KEY ("id","criteriaid")
);

-- CreateTable
CREATE TABLE "tblautomatedscheduletrack" (
    "id" SERIAL NOT NULL,
    "criteriaid" INTEGER NOT NULL,
    "startdate" TIMESTAMP(6) NOT NULL,
    "enddate" TIMESTAMP(6),
    "refid" TEXT NOT NULL,
    "asyncid" BIGINT,
    "count" INTEGER,
    "status" VARCHAR(25) NOT NULL,
    "createdby" INTEGER,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedon" TIMESTAMP(6),
    "message" TEXT,

    CONSTRAINT "pk_tblautomatedscheduletrack_1833317841" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblbatchbillingpaymenttrack" (
    "id" SERIAL NOT NULL,
    "transactionrefid" BIGINT NOT NULL,
    "customerid" INTEGER NOT NULL,
    "customer" VARCHAR(100),
    "cardtype" VARCHAR(100),
    "cardexp" VARCHAR(100),
    "cardnumber" VARCHAR(100),
    "invoicenumber" TEXT,
    "amountpaid" DECIMAL(18,2),
    "creditcardfee" DECIMAL(18,2),
    "paymentstatus" TEXT,
    "errormessage" TEXT,
    "gatewaymerchantid" INTEGER,
    "multicurrencyid" INTEGER,

    CONSTRAINT "pk_tblbatchbillingpaymenttrack_2062174642" PRIMARY KEY ("id","transactionrefid")
);

-- CreateTable
CREATE TABLE "tblbsaplacements" (
    "id" SERIAL NOT NULL,
    "campaignid" INTEGER,
    "zoneid" INTEGER,
    "advertisementid" INTEGER,
    "issynced" DECIMAL(1,0),

    CONSTRAINT "pk__tblbsapl__3214ec074e9ed8aa" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblbusinessunit" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) DEFAULT '',
    "details" TEXT DEFAULT '',
    "products" TEXT DEFAULT '',

    CONSTRAINT "pk_tblbusinessunit_1026362971" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblbusinessunit2product" (
    "id" SERIAL NOT NULL,
    "businessunitid" INTEGER,
    "productid" INTEGER,

    CONSTRAINT "pk_tblbusinessunit2product_1042363028" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcampaignrecipients" (
    "id" SERIAL NOT NULL,
    "campaignid" VARCHAR(100),
    "contactid" INTEGER,
    "email" VARCHAR(70),
    "delivered" DECIMAL(1,0),
    "opened" DECIMAL(1,0),
    "clicks" INTEGER,
    "spam" DECIMAL(1,0),
    "bounce" DECIMAL(1,0),
    "status" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "tblcbmoclassifiedstyle" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(50) NOT NULL,
    "name" VARCHAR(300) NOT NULL,
    "Group" VARCHAR(100),
    "adjustmentid" INTEGER,
    "stylejson" TEXT,
    "sortorder" INTEGER NOT NULL,

    CONSTRAINT "pk_tblcbmoclassifiedstyle_1275411863" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcbmoorder2classifiedstyle" (
    "id" SERIAL NOT NULL,
    "orderid" INTEGER NOT NULL,
    "cbmoclassifiedstyleid" INTEGER NOT NULL,
    "contracts2chargesid" INTEGER,

    CONSTRAINT "pk_tblcbmoorder2classifiedstyle_1323412034" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblchangeorderdefinition" (
    "changeorderdefinitionid" SERIAL NOT NULL,
    "description" VARCHAR(1000),
    "isdefault" DECIMAL(1,0),
    "upperhtml" TEXT,
    "lowerhtml" TEXT,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "updatedbyid" INTEGER,
    "showtotal" DECIMAL(1,0) DEFAULT 0,
    "totaltext" TEXT DEFAULT 'Total:',
    "saeditonly" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "active" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "thumbnailimage" TEXT,
    "isshowpaymentplan" DECIMAL(1,0) DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblchangeorderdisplayfields" (
    "fieldid" SERIAL NOT NULL,
    "lineitemtypeid" INTEGER,
    "header" VARCHAR(100),
    "fieldname" VARCHAR(500),
    "format" VARCHAR(100),
    "replace" VARCHAR(100),
    "sortorder" INTEGER,
    "subproducttypeid" INTEGER,
    "description" TEXT,

    CONSTRAINT "pk_tblchangeorderdisplayfields_2055222622" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblchangeorderhistory" (
    "id" SERIAL NOT NULL,
    "changeorderid" INTEGER NOT NULL,
    "orderid" INTEGER,
    "fieldname" VARCHAR(100),
    "oldvalue" VARCHAR(1000),
    "newvalue" VARCHAR(1000),
    "oldvalueid" INTEGER,
    "newvalueid" INTEGER,
    "updatedby" INTEGER,
    "updatedbyname" VARCHAR(1000),
    "updatedon" TIMESTAMP(6),
    "action" VARCHAR(50),
    "fielddbname" VARCHAR(100),

    CONSTRAINT "pk_tblchangeorderhistory_546361261" PRIMARY KEY ("id","changeorderid")
);

-- CreateTable
CREATE TABLE "tblchangeorderinsertion" (
    "id" SERIAL NOT NULL,
    "changeorderid" INTEGER NOT NULL,
    "changedescription" TEXT,
    "orderid" INTEGER,
    "ratecardid" INTEGER,
    "adsizeid" INTEGER,
    "adpositionid" INTEGER,
    "adcolorid" INTEGER,
    "adfrequencyid" INTEGER,
    "adsectionid" INTEGER,
    "adcolumnid" INTEGER,
    "adinchid" INTEGER,
    "net" DECIMAL(19,4),
    "gross" DECIMAL(19,4),
    "barter" DECIMAL(19,4),
    "prodcharge" DOUBLE PRECISION,
    "cardrate" DECIMAL(19,4),
    "discount" DECIMAL(19,4),
    "surcharge" DECIMAL(19,4),
    "cpm" DECIMAL(18,2),
    "price" DECIMAL(18,4),
    "createdate" TIMESTAMP(6),
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "adagencydiscount" DECIMAL(1,0),
    "adagencypercentage" DECIMAL(18,6),
    "issueid" INTEGER,
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "year" INTEGER
);

-- CreateTable
CREATE TABLE "tblchangeorderinternalapprovalhistory" (
    "id" SERIAL NOT NULL,
    "changeorderid" INTEGER NOT NULL,
    "action" VARCHAR(1050) NOT NULL,
    "actionby" INTEGER NOT NULL,
    "username" VARCHAR(100),
    "actiondate" TIMESTAMP(6) NOT NULL,
    "description" VARCHAR(1050),
    "source" VARCHAR(50),

    CONSTRAINT "pk_tblchangeorderinternalapprovalhistory_834362287" PRIMARY KEY ("id","changeorderid")
);

-- CreateTable
CREATE TABLE "tblchangeorderlineitemdefinition" (
    "id" SERIAL NOT NULL,
    "changeorderid" INTEGER,
    "changeorderdefinitionid" INTEGER,
    "lineitemtypeid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(500) DEFAULT '',
    "amount" DECIMAL(19,4),
    "showamount" DECIMAL(1,0) DEFAULT 1,
    "sortorder" INTEGER,
    "displaydetails" DECIMAL(1,0) DEFAULT 1,
    "displaysubtotal" DECIMAL(1,0) DEFAULT 0,
    "groupbyproduct" DECIMAL(1,0) DEFAULT 0,
    "subproducttypeid" INTEGER,
    "displaysummaries" DECIMAL(1,0) DEFAULT 1,
    "totaltext" VARCHAR(500) DEFAULT 'Total',
    "barteramount" DECIMAL(19,4),
    "groupbyissue" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblchangeorderlineitemdefinition_2119222850" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblchangeorderlineitemdisplay" (
    "displayid" SERIAL NOT NULL,
    "lineitemdefinitionid" INTEGER,
    "fieldtype" VARCHAR(100),
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "header" VARCHAR(100),
    "sortorder" INTEGER,
    "description" VARCHAR(1000),
    "addtototal" DECIMAL(1,0),
    "showtotal" DECIMAL(1,0),
    "collapseonblank" DECIMAL(1,0),
    "subtractfromtotal" DECIMAL(1,0),
    "showmin" DECIMAL(1,0) DEFAULT 0,
    "showmax" DECIMAL(1,0) DEFAULT 0,
    "hidecolumn" DECIMAL(1,0) DEFAULT 0,
    "blankcolumn" DECIMAL(1,0) DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblchangeorderlineitemtemplate" (
    "id" SERIAL NOT NULL,
    "changeorderid" INTEGER NOT NULL,
    "thumbnailimage" TEXT,
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "createddate" TIMESTAMP(6),

    CONSTRAINT "pk_tblchangeorderlineitemtemplate_19739373" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblchangeorders" (
    "changeorderid" SERIAL NOT NULL,
    "name" VARCHAR(1000),
    "notes" TEXT,
    "statuscode" INTEGER,
    "customerid" INTEGER,
    "producttype" INTEGER,
    "templateid" INTEGER,
    "upperhtml" TEXT,
    "lowerhtml" TEXT,
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "createdbyuserid" INTEGER,
    "updatedbyuserid" INTEGER,
    "showtotal" DECIMAL(1,0) DEFAULT 0,
    "totaltext" TEXT DEFAULT 'Total:',
    "approvalstatus" INTEGER,

    CONSTRAINT "pk_tblchangeorders_51739487" PRIMARY KEY ("changeorderid")
);

-- CreateTable
CREATE TABLE "tblchangeordersplitreps" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER,
    "gsemployeesid" INTEGER,
    "percentage" DECIMAL(18,2),
    "changeorderid" INTEGER,

    CONSTRAINT "pk__tblchang__3214ec07b8161b15" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcirc2frequency" (
    "id" SERIAL NOT NULL,
    "magazineid" INTEGER NOT NULL,
    "issueid" INTEGER NOT NULL,
    "circulation" INTEGER
);

-- CreateTable
CREATE TABLE "tblcitymapping" (
    "citycode" VARCHAR(10) NOT NULL,
    "cityname" VARCHAR(100) NOT NULL
);

-- CreateTable
CREATE TABLE "tblclassifiedelementsmap" (
    "indesigntemplateid" INTEGER NOT NULL,
    "elementname" VARCHAR(100) NOT NULL,
    "dbelementmapname" VARCHAR(100),
    "elementsearch" INTEGER NOT NULL,
    "elementsorting" INTEGER NOT NULL,
    "iscustom" DECIMAL(1,0) NOT NULL,
    "specialelements" TEXT,
    "ishrtagrequired" DECIMAL(1,0),
    "id" SERIAL NOT NULL,
    "isactive" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblclassifiedelementsmap_1016546855" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblclientactivity" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER,
    "company" VARCHAR(100),
    "Client ID" INTEGER,
    "Client URL" VARCHAR(100),
    "DB Name" VARCHAR(100),
    "SQL IP" VARCHAR(100),
    "Client Added" DATE,
    "Client Rep" VARCHAR(100),
    "a1" VARCHAR(50),
    "a2" VARCHAR(50),
    "a3" VARCHAR(50),
    "a4" VARCHAR(50),
    "s1" VARCHAR(50),
    "s2" VARCHAR(50),
    "s3" VARCHAR(50),
    "p1" VARCHAR(50),
    "ar1" VARCHAR(50),
    "ar2" VARCHAR(50),
    "c1" VARCHAR(50),
    "c2" VARCHAR(50),
    "e1" VARCHAR(50),
    "d1" VARCHAR(50),
    "ds" VARCHAR(50),
    "qb" VARCHAR(50),
    "training" TEXT,
    "imports" TEXT,
    "Last Login" DATE,
    "Last Note" DATE,
    "Last Contract" DATE,
    "Last Proposal" DATE,
    "Last Invoice" DATE,
    "Last Sub" DATE,
    "Last Comp Sub" DATE,
    "Last Paid Sub" DATE,
    "Num Products" INTEGER,
    "Num Mags" INTEGER,
    "updatedfor2011" DECIMAL(1,0),
    "Mag Names" TEXT,
    "Admin Email" TEXT,
    "NonAdmin Email" TEXT,
    "users" INTEGER,
    "expectedusers" VARCHAR(50),
    "All Billing" INTEGER,
    "YTD Billing" INTEGER,
    "PrevYr Billing" INTEGER,
    "last12monthissuesales" BIGINT,
    "lasttemplateaddedtoproduct" DATE,
    "lasttemplateremovedfromproduct" DATE,
    "lastfolioadded" DATE,
    "lastfolioremoved" DATE,
    "lastinsertionadded" DATE,
    "lastinsertionremoved" DATE,
    "lastassetassigned" DATE,
    "lastassetremoved" DATE,
    "lasttemplateassignedtopage" DATE,
    "lasttemplateremovedfrompage" DATE,
    "lasttemplatechangedonpage" DATE,
    "lastassetuploaded" DATE,
    "lastdigeditionpublished" DATE,
    "reportupdated" DATE DEFAULT clock_timestamp(),
    "QBWC Enabled" DECIMAL(1,0) DEFAULT 0,
    "lastedinsertadded" TIMESTAMP(6),
    "lastedinsertremoved" TIMESTAMP(6),
    "lastipadeditionpublished" TIMESTAMP(6),
    "lastpagesadded" TIMESTAMP(6),
    "lastpagesdeleted" TIMESTAMP(6),
    "usrid" VARCHAR(36),
    "mailid" VARCHAR(255),
    "usrfirstname" VARCHAR(200),
    "usrlastname" VARCHAR(200),
    "subdomain" VARCHAR(200),
    "loggedon" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "tblclosedissues" (
    "id" SERIAL NOT NULL,
    "zoneid" INTEGER,
    "issueid" INTEGER,
    "issueyear" INTEGER,
    "dateclosed" TIMESTAMP(6),
    "closestartdate" TIMESTAMP(6),
    "closeenddate" TIMESTAMP(6),
    "closedby" INTEGER,

    CONSTRAINT "pk_tblclosedissues_610153269" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcloudcommunicationactivity" (
    "cloudcommunicationid" SERIAL NOT NULL,
    "activityid" INTEGER NOT NULL,
    "calldurationseconds" INTEGER NOT NULL,
    "direction" VARCHAR(20),
    "medium" VARCHAR(20),

    CONSTRAINT "pk_tblcloudcommunicationactivity_ccid_1431936423" PRIMARY KEY ("cloudcommunicationid")
);

-- CreateTable
CREATE TABLE "tblcollateral" (
    "id" SERIAL NOT NULL,
    "filename" VARCHAR(75) NOT NULL,
    "description" VARCHAR(75) NOT NULL,
    "datetime" TIMESTAMP(6) NOT NULL,
    "category" VARCHAR(75),
    "magazineid" INTEGER,
    "deptids" VARCHAR(1000) DEFAULT '',
    "userids" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblcollateral_770101784" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcompanydefaults" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "siteid" INTEGER,
    "name" VARCHAR(100) NOT NULL DEFAULT '',
    "street" VARCHAR(100) DEFAULT '',
    "city" VARCHAR(100) DEFAULT '',
    "st" VARCHAR(25) DEFAULT '',
    "zip" VARCHAR(25) DEFAULT '',
    "phone" VARCHAR(50) DEFAULT '',
    "fax" VARCHAR(50) DEFAULT '',
    "srshowpriority" DECIMAL(1,0),
    "srshowrep" DECIMAL(1,0),
    "srshowlastcontact" DECIMAL(1,0),
    "srshowname" DECIMAL(1,0),
    "srshowcategory" DECIMAL(1,0),
    "srshowphone" DECIMAL(1,0),
    "srshowfax" DECIMAL(1,0),
    "srshowemail" DECIMAL(1,0),
    "srshowagency" DECIMAL(1,0),
    "sradmindelete" DECIMAL(1,0),
    "sradminexport" DECIMAL(1,0),
    "sradminassign" DECIMAL(1,0),
    "onlinesubscriptionreplyemail" VARCHAR(100) DEFAULT '',
    "onlinesubscriptionconfirmationemail" VARCHAR(100) DEFAULT '',
    "onlinesubscriptionphone" VARCHAR(100) DEFAULT '',
    "onlinesubscriptionfax" VARCHAR(100) DEFAULT '',
    "pnp_publishername" VARCHAR(100) DEFAULT '',
    "newcustomerpages" DECIMAL(1,0) DEFAULT 1,
    "synccontactsignorerep" DECIMAL(1,0) DEFAULT 0,
    "defaultzoneid" INTEGER,
    "defaultmagfrequencyid" INTEGER,
    "defaultyear" INTEGER,
    "defaultenddate" TIMESTAMP(6),
    "tenantid" VARCHAR(255) DEFAULT '',
    "contactologykey" VARCHAR(200),
    "address2" VARCHAR(100),
    "emailaddress" VARCHAR(100),
    "country" VARCHAR(255),
    "footercname" VARCHAR(300),
    "footerwebsite" VARCHAR(300),
    "footeraddress1" VARCHAR(300),
    "footeraddress2" VARCHAR(300),
    "footeremail" VARCHAR(250),
    "footerphone" VARCHAR(100),
    "footeriname" VARCHAR(200),
    "footerimage" TEXT,
    "websiteurl" VARCHAR(300),
    "linkedinurl" VARCHAR(300),
    "websitesummary" TEXT,
    "linkedinsummary" TEXT
);

-- CreateTable
CREATE TABLE "tblcomplist" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER,
    "subscriberid" INTEGER,
    "subscriptionid" INTEGER,
    "gsadagencyid" INTEGER,

    CONSTRAINT "pk_tblcomplist_2005634238" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontact" (
    "contactid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "parentid" INTEGER DEFAULT -1,
    "relatedcontactids" VARCHAR(500) DEFAULT '',
    "donotemail" DECIMAL(1,0) DEFAULT 0,
    "donotfax" DECIMAL(1,0) DEFAULT 0,
    "donotcall" DECIMAL(1,0) DEFAULT 0,
    "donotmail" DECIMAL(1,0) DEFAULT 0,
    "notes" VARCHAR(8000) DEFAULT '',
    "companyname" VARCHAR(100) DEFAULT '',
    "companydepartment" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblcontacts_1133963116" PRIMARY KEY ("contactid")
);

-- CreateTable
CREATE TABLE "tblcontact2category" (
    "id" SERIAL NOT NULL,
    "contactid" INTEGER,
    "categoryid" INTEGER,

    CONSTRAINT "pk_tblcontact2category_1149963173" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontact2contacttype" (
    "id" SERIAL NOT NULL,
    "contactid" INTEGER,
    "contacttypeid" INTEGER,

    CONSTRAINT "pk_tblcontact2contacttype_1165963230" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontact2group" (
    "id" SERIAL NOT NULL,
    "contactid" INTEGER,
    "groupid" INTEGER,

    CONSTRAINT "pk_tblcontact2group_1181963287" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontact2role" (
    "id" SERIAL NOT NULL,
    "contactid" INTEGER,
    "roleid" INTEGER,

    CONSTRAINT "pk_tblcontact2role_1197963344" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontactaddress" (
    "addressid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "contactid" INTEGER NOT NULL,
    "addresstypeid" INTEGER NOT NULL DEFAULT -1,
    "isprimary" DECIMAL(1,0) DEFAULT 0,
    "attn" VARCHAR(100) DEFAULT '',
    "address1" VARCHAR(100) DEFAULT '',
    "address2" VARCHAR(100) DEFAULT '',
    "city" VARCHAR(100) DEFAULT '',
    "region" VARCHAR(100) DEFAULT '',
    "postalcode" VARCHAR(100) DEFAULT '',
    "country" VARCHAR(100) DEFAULT '',
    "county" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(8000) DEFAULT '',
    "frommonth" INTEGER DEFAULT -1,
    "fromday" INTEGER DEFAULT -1,
    "tomonth" INTEGER DEFAULT -1,
    "today" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactaddress_1213963401" PRIMARY KEY ("addressid")
);

-- CreateTable
CREATE TABLE "tblcontactaddresstype" (
    "addresstypeid" SERIAL NOT NULL,
    "addresstype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactaddresstype_1229963458" PRIMARY KEY ("addresstypeid")
);

-- CreateTable
CREATE TABLE "tblcontactadvsearchpageviewforrep" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER NOT NULL,
    "viewid" INTEGER NOT NULL,
    "isoperatorsearch" DECIMAL(1,0),
    "pagename" INTEGER,

    CONSTRAINT "pk_tblcontactadvsearchpageviewforrep_839882259" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontactadvsearchpageviews" (
    "id" SERIAL NOT NULL,
    "viewname" VARCHAR(100) NOT NULL,
    "description" TEXT,

    CONSTRAINT "pk_tblcontactadvsearchpageviews_871882373" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontactcategory" (
    "categoryid" SERIAL NOT NULL,
    "category" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(100) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactcategory_1245963515" PRIMARY KEY ("categoryid")
);

-- CreateTable
CREATE TABLE "tblcontacteditsectionsrepconf" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER NOT NULL,
    "sectionid" INTEGER NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "foreditdoexpand" DECIMAL(1,0) NOT NULL,
    "allowdisplay" DECIMAL(1,0) NOT NULL,

    CONSTRAINT "pk__tblconta__3214ec27151364b2" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontacteditsectionsrepconf_19990" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER NOT NULL,
    "sectionid" INTEGER NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "foreditdoexpand" DECIMAL(1,0) NOT NULL,
    "allowdisplay" DECIMAL(1,0) NOT NULL
);

-- CreateTable
CREATE TABLE "tblcontactemail" (
    "emailid" SERIAL NOT NULL,
    "contactid" INTEGER NOT NULL,
    "isprimary" DECIMAL(1,0) DEFAULT 0,
    "email" VARCHAR(100) DEFAULT '',
    "emailtypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactemail_1261963572" PRIMARY KEY ("emailid")
);

-- CreateTable
CREATE TABLE "tblcontactemailtype" (
    "emailtypeid" SERIAL NOT NULL,
    "emailtype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactemailtype_1277963629" PRIMARY KEY ("emailtypeid")
);

-- CreateTable
CREATE TABLE "tblcontactfax" (
    "faxid" SERIAL NOT NULL,
    "contactid" INTEGER NOT NULL,
    "isprimary" DECIMAL(1,0) DEFAULT 0,
    "faxtypeid" INTEGER DEFAULT -1,
    "faxareacode" VARCHAR(100) DEFAULT '',
    "faxfirst3" VARCHAR(100) DEFAULT '',
    "faxlast4" VARCHAR(100) DEFAULT '',
    "faxextension" VARCHAR(100) DEFAULT '',
    "faxnumber" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblcontactfax_1293963686" PRIMARY KEY ("faxid")
);

-- CreateTable
CREATE TABLE "tblcontactfaxtype" (
    "faxtypeid" SERIAL NOT NULL,
    "faxtype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactfaxtype_1309963743" PRIMARY KEY ("faxtypeid")
);

-- CreateTable
CREATE TABLE "tblcontactgroup" (
    "groupid" SERIAL NOT NULL,
    "Group" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactgroup_1325963800" PRIMARY KEY ("groupid")
);

-- CreateTable
CREATE TABLE "tblcontactinterestgroups" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(100),
    "interestgroupid" INTEGER,
    "subscribed" DECIMAL(1,0),
    "datestamp" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "tblcontactpageconf" (
    "id" SERIAL NOT NULL,
    "section" VARCHAR(100) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "allowdisplay" DECIMAL(1,0) NOT NULL,
    "usercontrolurl" VARCHAR(500),
    "fieldsetid" VARCHAR(150),
    "showadd" DECIMAL(1,0),
    "showrefresh" DECIMAL(1,0),
    "showgoto" DECIMAL(1,0),
    "expandhandler" TEXT,
    "addcalling" TEXT,
    "refreshcalling" TEXT,
    "gotocalling" TEXT,
    "collapsehandler" TEXT,
    "beforeexpandhandler" TEXT,
    "forcrm" DECIMAL(1,0),
    "forcompany" DECIMAL(1,0),
    "forcontact" DECIMAL(1,0),
    "foradagency" DECIMAL(1,0),
    "foradagencycontact" DECIMAL(1,0),
    "forrelatedcompany" DECIMAL(1,0),
    "foraddnew" DECIMAL(1,0),
    "showcount" DECIMAL(1,0),
    "foreditdoexpand" DECIMAL(1,0),
    "fornewdoexpand" DECIMAL(1,0),
    "addtooltip" VARCHAR(100),
    "gototooltip" VARCHAR(100),
    "parentid" INTEGER,
    "customfieldcategory" VARCHAR(100),
    "showedit" DECIMAL(1,0),
    "allowcount" DECIMAL(1,0),
    "sadisplay" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "allowrefresh" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "pagetype" INTEGER DEFAULT 0,
    "sitetype" VARCHAR(50),

    CONSTRAINT "pk__tblconta__3214ec0718e3f596" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontactpageconf_03062025" (
    "id" SERIAL NOT NULL,
    "section" VARCHAR(100) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "allowdisplay" DECIMAL(1,0) NOT NULL,
    "usercontrolurl" VARCHAR(500),
    "fieldsetid" VARCHAR(150),
    "showadd" DECIMAL(1,0),
    "showrefresh" DECIMAL(1,0),
    "showgoto" DECIMAL(1,0),
    "expandhandler" TEXT,
    "addcalling" TEXT,
    "refreshcalling" TEXT,
    "gotocalling" TEXT,
    "collapsehandler" TEXT,
    "beforeexpandhandler" TEXT,
    "forcrm" DECIMAL(1,0),
    "forcompany" DECIMAL(1,0),
    "forcontact" DECIMAL(1,0),
    "foradagency" DECIMAL(1,0),
    "foradagencycontact" DECIMAL(1,0),
    "forrelatedcompany" DECIMAL(1,0),
    "foraddnew" DECIMAL(1,0),
    "showcount" DECIMAL(1,0),
    "foreditdoexpand" DECIMAL(1,0),
    "fornewdoexpand" DECIMAL(1,0),
    "addtooltip" VARCHAR(100),
    "gototooltip" VARCHAR(100),
    "parentid" INTEGER,
    "customfieldcategory" VARCHAR(100),
    "showedit" DECIMAL(1,0),
    "allowcount" DECIMAL(1,0),
    "sadisplay" DECIMAL(1,0) NOT NULL,
    "allowrefresh" DECIMAL(1,0) NOT NULL,
    "pagetype" INTEGER,
    "sitetype" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblcontactpageconf_19990" (
    "id" SERIAL NOT NULL,
    "section" VARCHAR(100) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "allowdisplay" DECIMAL(1,0) NOT NULL,
    "usercontrolurl" VARCHAR(500),
    "fieldsetid" VARCHAR(150),
    "showadd" DECIMAL(1,0),
    "showrefresh" DECIMAL(1,0),
    "showgoto" DECIMAL(1,0),
    "expandhandler" TEXT,
    "addcalling" TEXT,
    "refreshcalling" TEXT,
    "gotocalling" TEXT,
    "collapsehandler" TEXT,
    "beforeexpandhandler" TEXT,
    "forcrm" DECIMAL(1,0),
    "forcompany" DECIMAL(1,0),
    "forcontact" DECIMAL(1,0),
    "foradagency" DECIMAL(1,0),
    "foradagencycontact" DECIMAL(1,0),
    "forrelatedcompany" DECIMAL(1,0),
    "foraddnew" DECIMAL(1,0),
    "showcount" DECIMAL(1,0),
    "foreditdoexpand" DECIMAL(1,0),
    "fornewdoexpand" DECIMAL(1,0),
    "addtooltip" VARCHAR(100),
    "gototooltip" VARCHAR(100),
    "parentid" INTEGER,
    "customfieldcategory" VARCHAR(100),
    "showedit" DECIMAL(1,0),
    "allowcount" DECIMAL(1,0),
    "countquery" TEXT,
    "sadisplay" DECIMAL(1,0) NOT NULL,
    "allowrefresh" DECIMAL(1,0) NOT NULL,
    "pagetype" INTEGER,
    "sitetype" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblcontactpageconfhistory" (
    "id" SERIAL NOT NULL,
    "sectionid" INTEGER,
    "option" VARCHAR(500),
    "oldvalue" VARCHAR(500),
    "newvalue" VARCHAR(500),
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "batchno" INTEGER,

    CONSTRAINT "pk__tblconta__3214ec077eef1969" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontactperson" (
    "personid" SERIAL NOT NULL,
    "contactid" INTEGER NOT NULL,
    "persontypeid" INTEGER DEFAULT -1,
    "isprimary" DECIMAL(1,0) DEFAULT 0,
    "prefix" VARCHAR(100) DEFAULT '',
    "firstname" VARCHAR(100) DEFAULT '',
    "middlename" VARCHAR(100) DEFAULT '',
    "lastname" VARCHAR(100) DEFAULT '',
    "suffix" VARCHAR(100) DEFAULT '',
    "title" VARCHAR(100) DEFAULT '',
    "jobdescription" VARCHAR(100) DEFAULT '',
    "nickname" VARCHAR(100) DEFAULT '',
    "informalname" VARCHAR(100) DEFAULT '',
    "formalname" VARCHAR(100) DEFAULT '',
    "salutation" VARCHAR(100) DEFAULT '',
    "birthday" VARCHAR(100) DEFAULT '',
    "ssn" VARCHAR(100) DEFAULT '',
    "sex" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(8000) DEFAULT '',

    CONSTRAINT "pk_tblcontactperson_1341963857" PRIMARY KEY ("personid")
);

-- CreateTable
CREATE TABLE "tblcontactpersontype" (
    "persontypeid" SERIAL NOT NULL,
    "persontype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactpersontype_1357963914" PRIMARY KEY ("persontypeid")
);

-- CreateTable
CREATE TABLE "tblcontactphone" (
    "phoneid" SERIAL NOT NULL,
    "contactid" INTEGER NOT NULL,
    "isprimary" DECIMAL(1,0) DEFAULT 0,
    "phonetypeid" INTEGER DEFAULT -1,
    "areacode" VARCHAR(100) DEFAULT '',
    "first3" VARCHAR(100) DEFAULT '',
    "last4" VARCHAR(100) DEFAULT '',
    "extension" VARCHAR(100) DEFAULT '',
    "number" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblcontactphone_1373963971" PRIMARY KEY ("phoneid")
);

-- CreateTable
CREATE TABLE "tblcontactphonetype" (
    "phonetypeid" SERIAL NOT NULL,
    "phonetype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactphonetype_1389964028" PRIMARY KEY ("phonetypeid")
);

-- CreateTable
CREATE TABLE "tblcontactprefix" (
    "prefixid" SERIAL NOT NULL,
    "prefix" VARCHAR(100) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactprefix_1405964085" PRIMARY KEY ("prefixid")
);

-- CreateTable
CREATE TABLE "tblcontactrole" (
    "roleid" SERIAL NOT NULL,
    "role" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontactrole_1421964142" PRIMARY KEY ("roleid")
);

-- CreateTable
CREATE TABLE "tblcontacttype" (
    "contacttypeid" SERIAL NOT NULL,
    "contacttype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblcontacttype_1437964199" PRIMARY KEY ("contacttypeid")
);

-- CreateTable
CREATE TABLE "tblcontacturl" (
    "urlid" SERIAL NOT NULL,
    "contactid" INTEGER NOT NULL,
    "isprimary" DECIMAL(1,0) DEFAULT 0,
    "url" VARCHAR(100) DEFAULT '',
    "urltypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontacturl_1453964256" PRIMARY KEY ("urlid")
);

-- CreateTable
CREATE TABLE "tblcontacturltype" (
    "urltypeid" SERIAL NOT NULL,
    "urltype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "contacttypeid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblcontacturltype_1469964313" PRIMARY KEY ("urltypeid")
);

-- CreateTable
CREATE TABLE "tblcontract" (
    "contractid" SERIAL NOT NULL,
    "contractnumber" VARCHAR(100) DEFAULT '',
    "gscustomersid" INTEGER,
    "gsadagencyid" INTEGER DEFAULT -1,
    "total" DECIMAL(19,4) DEFAULT 0,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "contractdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "duedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "paymentdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "updatedbyuserid" INTEGER,
    "upperhtml" TEXT DEFAULT '',
    "lowerhtml" TEXT DEFAULT '',
    "voiddate" TIMESTAMP(6),
    "voidedbyuserid" INTEGER,
    "locked" DECIMAL(1,0) DEFAULT 0,
    "lockdate" TIMESTAMP(6),
    "publications" VARCHAR(1000) DEFAULT '',
    "convertedtocontract" DECIMAL(1,0) DEFAULT 0,
    "gsactivitiesid" INTEGER,
    "showinstallments" DECIMAL(1,0) DEFAULT 1,
    "salescontactid" INTEGER,
    "startdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "enddate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "barterdisplayname" VARCHAR(50) DEFAULT '',
    "editgroupbroken" DECIMAL(1,0) DEFAULT 0,
    "showtotal" DECIMAL(1,0) DEFAULT 0,
    "gsrepid" INTEGER,
    "mergefieldsupdated" DECIMAL(1,0) DEFAULT 0,
    "totaltext" TEXT DEFAULT 'Total:',
    "rsstatus" VARCHAR(100),
    "rsid" VARCHAR(100),
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "isshowpaymentplan" DECIMAL(1,0) DEFAULT 0,
    "templateid" INTEGER,
    "name" VARCHAR(500),
    "viewstatus" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "approvalstatus" INTEGER NOT NULL DEFAULT 0,
    "copyrenew" VARCHAR(20),
    "parentid" INTEGER,
    "lineitemgroupby" INTEGER,
    "lineitemorderby" VARCHAR(500),

    CONSTRAINT "pk_tblcontract_1472776354" PRIMARY KEY ("contractid")
);

-- CreateTable
CREATE TABLE "tblcontractdefinition" (
    "contractdefinitionid" SERIAL NOT NULL,
    "description" VARCHAR(1000) DEFAULT '',
    "isdefault" DECIMAL(1,0) DEFAULT 0,
    "upperhtml" TEXT DEFAULT '',
    "lowerhtml" TEXT DEFAULT '',
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "updatedbyid" INTEGER,
    "showtotal" DECIMAL(1,0) DEFAULT 0,
    "totaltext" TEXT DEFAULT 'Total:',
    "saeditonly" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "active" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "thumbnailimage" TEXT,
    "isshowpaymentplan" DECIMAL(1,0) DEFAULT 0,
    "lineitemgroupby" INTEGER,
    "lineitemorderby" VARCHAR(500),

    CONSTRAINT "pk_tblcontractdefinition_1213299432" PRIMARY KEY ("contractdefinitionid")
);

-- CreateTable
CREATE TABLE "tblcontractdeleted" (
    "contractid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "deletedby" INTEGER NOT NULL,
    "deletedon" TIMESTAMP(6) NOT NULL,
    "jsondata" TEXT,

    CONSTRAINT "pk_tblcontractdeleted_1726889469" PRIMARY KEY ("contractid")
);

-- CreateTable
CREATE TABLE "tblcontractdisplayfields" (
    "fieldid" SERIAL NOT NULL,
    "lineitemtypeid" INTEGER,
    "header" VARCHAR(100),
    "fieldname" VARCHAR(500),
    "format" VARCHAR(100),
    "replace" VARCHAR(100),
    "sortorder" INTEGER,
    "subproducttypeid" INTEGER,
    "description" TEXT,

    CONSTRAINT "pk_tblcontractdisplayfields_1217543521" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblcontractdisplayfields_backup_dev33377" (
    "fieldid" SERIAL NOT NULL,
    "lineitemtypeid" INTEGER,
    "header" VARCHAR(100),
    "fieldname" VARCHAR(500),
    "format" VARCHAR(100),
    "replace" VARCHAR(100),
    "sortorder" INTEGER,
    "subproducttypeid" INTEGER,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblcontractdisplayfields_dev_33019" (
    "fieldid" SERIAL NOT NULL,
    "lineitemtypeid" INTEGER,
    "header" VARCHAR(100),
    "fieldname" VARCHAR(500),
    "format" VARCHAR(100),
    "replace" VARCHAR(100),
    "sortorder" INTEGER,
    "subproducttypeid" INTEGER,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblcontractinstallment" (
    "id" SERIAL NOT NULL,
    "contractid" INTEGER NOT NULL,
    "insertionid" INTEGER NOT NULL,
    "installmentdate" TIMESTAMP(6) NOT NULL,
    "installmentamount" DECIMAL(19,4) NOT NULL,
    "installmentpercentage" DECIMAL(18,10) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblcontractlineitem_old" (
    "id" SERIAL NOT NULL,
    "contractid" INTEGER,
    "insertionid" INTEGER,
    "sortorder" INTEGER,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),

    CONSTRAINT "pk_tblcontractlineitem_1504776468" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontractlineitemdefinition" (
    "id" SERIAL NOT NULL,
    "contractid" INTEGER,
    "contractdefinitionid" INTEGER,
    "lineitemtypeid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(500) DEFAULT '',
    "amount" DECIMAL(19,4),
    "showamount" DECIMAL(1,0) DEFAULT 1,
    "sortorder" INTEGER,
    "displaydetails" DECIMAL(1,0) DEFAULT 1,
    "displaysubtotal" DECIMAL(1,0) DEFAULT 0,
    "groupbyproduct" DECIMAL(1,0) DEFAULT 0,
    "subproducttypeid" INTEGER,
    "displaysummaries" DECIMAL(1,0) DEFAULT 1,
    "totaltext" VARCHAR(500) DEFAULT 'Total',
    "barteramount" DECIMAL(19,4),
    "groupbyissue" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblcontractlineitemdefinition_1520776525" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontractlineitemdisplay" (
    "displayid" SERIAL NOT NULL,
    "lineitemdefinitionid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "description" VARCHAR(1000) DEFAULT '',
    "addtototal" DECIMAL(1,0) DEFAULT 0,
    "showtotal" DECIMAL(1,0) DEFAULT 0,
    "collapseonblank" DECIMAL(1,0) DEFAULT 0,
    "subtractfromtotal" DECIMAL(1,0) DEFAULT 0,
    "showmin" DECIMAL(1,0) DEFAULT 0,
    "showmax" DECIMAL(1,0) DEFAULT 0,
    "hidecolumn" DECIMAL(1,0) DEFAULT 0,
    "blankcolumn" DECIMAL(1,0) DEFAULT 0,
    "istaxable" DECIMAL(1,0) DEFAULT 0,
    "groupid" INTEGER,

    CONSTRAINT "pk_tblcontractlineitemdisplay_578361375" PRIMARY KEY ("displayid")
);

-- CreateTable
CREATE TABLE "tblcontractlineitemtype" (
    "lineitemtypeid" SERIAL NOT NULL,
    "type" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblcontractlineitemtype_1552776639" PRIMARY KEY ("lineitemtypeid")
);

-- CreateTable
CREATE TABLE "tblcontrolpanel" (
    "id" SERIAL NOT NULL,
    "installmentbilling" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "multiplepubs" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "surcharges" DECIMAL(1,0) DEFAULT 0,
    "movecontracts" DECIMAL(1,0),
    "contactreqfields" DECIMAL(1,0),
    "showmyinfo" DECIMAL(1,0) DEFAULT 1,
    "checkcreditlimitonrunsheet" DECIMAL(1,0) DEFAULT 0,
    "checkcreditlimitonadd" DECIMAL(1,0) DEFAULT 0,
    "checkcreditlimitonpropose" DECIMAL(1,0) DEFAULT 0,
    "limitcustomersearchbyrep" DECIMAL(1,0) DEFAULT 0,
    "limitcalendarbyrep" DECIMAL(1,0) DEFAULT 0,
    "checkcreditlimitonrunsheetdays" INTEGER DEFAULT 30,
    "checkcreditlimitonproposedays" INTEGER DEFAULT 30,
    "checkcreditlimitonadddays" INTEGER DEFAULT 30,
    "allowfaxing" DECIMAL(1,0) DEFAULT 0,
    "limitcustomeraddbyrep" DECIMAL(1,0) DEFAULT 0,
    "newadsonrunsheet" DECIMAL(1,0) DEFAULT 0,
    "allownonadminaddtocalendar" DECIMAL(1,0) DEFAULT 0,
    "barterdisplayname" VARCHAR(100) DEFAULT 'Barter',
    "defaultsubscriptiontype" INTEGER DEFAULT 1,
    "issueyearcheckboxstart" INTEGER DEFAULT -1,
    "issueyearcheckboxend" INTEGER DEFAULT 2,
    "defaulttogrossratecard" DECIMAL(1,0) DEFAULT 0,
    "qbintegration" DECIMAL(1,0) DEFAULT 0,
    "qbintegrationtype" INTEGER DEFAULT 1,
    "invoicevoidadminonly" DECIMAL(1,0) DEFAULT 1,
    "allowautorenew" DECIMAL(1,0) DEFAULT 0,
    "updatedfor2011" DECIMAL(1,0) DEFAULT 0,
    "allownetadjustments" DECIMAL(1,0) DEFAULT 1,
    "displaycompany" DECIMAL(1,0) DEFAULT 0,
    "defaulttoautorenew" DECIMAL(1,0) DEFAULT 0,
    "loggedinrepchoice" DECIMAL(1,0) DEFAULT 0,
    "loggedinrepchoiceproposal" DECIMAL(1,0) DEFAULT 1,
    "invcheck" DECIMAL(1,0),
    "stopinvfail" DECIMAL(1,0),
    "invpropcheck" DECIMAL(1,0),
    "stopinvpropfail" DECIMAL(1,0),
    "invenabled" DECIMAL(1,0) DEFAULT 0,
    "allowitemcode" DECIMAL(1,0),
    "cinvoicebydefault" DECIMAL(1,0) DEFAULT 0,
    "statementsperbillingcontact" DECIMAL(1,0) DEFAULT 0,
    "contactologykey" VARCHAR(400) DEFAULT '',
    "isgooglecalendar" DECIMAL(1,0) DEFAULT 0,
    "clientid" VARCHAR(2000),
    "clientsecret" VARCHAR(2000),
    "redirecturi" VARCHAR(2000),
    "contactautoformat" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "pickupfromdescriptionsetup" TEXT NOT NULL DEFAULT 'ISNULL(gsPublications.PubName,'''')||'':''||ISNULL(gsContracts.Description,'''')||'' ''||''''||'' ''||''''||'' ''||''''',
    "allowproductioncharges" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "isstateastextbox" DECIMAL(1,0) DEFAULT 0,
    "isshowamountoninventoryreport" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "qbaccesstkn" TEXT,
    "qbaccesstknsecrt" TEXT,
    "qbrealmid" TEXT,
    "googleanalyticsname" VARCHAR(500),
    "timeadd" INTEGER NOT NULL DEFAULT 0,
    "alloweditadnumber" DECIMAL(1,0) DEFAULT 0,
    "ismagazinevisible" DECIMAL(1,0) DEFAULT 0,
    "campaigneruserid" VARCHAR(250),
    "campaignerpwd" VARCHAR(250),
    "isenabletrackingcodes" DECIMAL(1,0) DEFAULT 0,
    "mailchimpapikey" VARCHAR(1000) DEFAULT '',
    "emailsendertype" INTEGER,
    "mailchimpmergefields" TEXT,
    "sitetype" VARCHAR(200),
    "isesignature" DECIMAL(1,0) DEFAULT 0,
    "isenablebatchorderupdate" DECIMAL(1,0) DEFAULT 0,
    "ischatenabled" DECIMAL(1,0) DEFAULT 0,
    "isticketenabled" DECIMAL(1,0) DEFAULT 0,
    "rskey" VARCHAR(1000) DEFAULT '',
    "mirabelemailaccountid" VARCHAR(1000) DEFAULT '',
    "ismirabelemailtrackingenabled" DECIMAL(1,0) DEFAULT 0,
    "ismirabelemailtranssendenabled" DECIMAL(1,0) DEFAULT 0,
    "isgroupbuyenabled" DECIMAL(1,0) DEFAULT 0,
    "emailidverification" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "ismkmenabled" DECIMAL(1,0),
    "isrsnew" DECIMAL(1,0),
    "isfinancechargesenabled" DECIMAL(1,0) DEFAULT 0,
    "isenableprimarycontactswitch" DECIMAL(1,0) DEFAULT 0,
    "isenableprimarycontactswitchforadminonly" DECIMAL(1,0) DEFAULT 1,
    "switchproposals" DECIMAL(1,0) DEFAULT 0,
    "switchorders" DECIMAL(1,0) DEFAULT 0,
    "switchinvoices" DECIMAL(1,0) DEFAULT 0,
    "qbtokengenerateddate" TIMESTAMP(6),
    "ispaymentplanenabled" DECIMAL(1,0) DEFAULT 0,
    "switchpaymentplan" DECIMAL(1,0) DEFAULT 0,
    "isbillingcontactremoveenabled" DECIMAL(1,0) DEFAULT 0,
    "canadminonlyremovebillingcontact" DECIMAL(1,0) DEFAULT 0,
    "switchproposalsonbcr" DECIMAL(1,0) DEFAULT 0,
    "switchordersonbcr" DECIMAL(1,0) DEFAULT 0,
    "switchinvoicesonbcr" DECIMAL(1,0) DEFAULT 0,
    "switchpaymentplansonbcr" DECIMAL(1,0) DEFAULT 0,
    "isrepnotificationsenabled" DECIMAL(1,0) DEFAULT 0,
    "ismulticurrencyenabled" DECIMAL(1,0),
    "paymentgatewaystatus" INTEGER,
    "isnewcontactsync" DECIMAL(1,0) DEFAULT 0,
    "istempmkmrepnotification" DECIMAL(1,0) DEFAULT 0,
    "isprocessingfeeenabled" DECIMAL(1,0),
    "issuessortby" VARCHAR(30),
    "isproposalopenapprovalenabled" DECIMAL(1,0),
    "isopenaienabled" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "issharedjobjacketenabled" DECIMAL(1,0) DEFAULT 0,
    "allowlevelpricingformultipleproduct" DECIMAL(1,0),
    "notesummary" DECIMAL(1,0) DEFAULT 0,
    "aitextimprover" DECIMAL(1,0) DEFAULT 0,
    "genaiwithsalesletter" DECIMAL(1,0) DEFAULT 0,
    "companyexecutivesummary" DECIMAL(1,0) DEFAULT 0,
    "meetingscheduler" DECIMAL(1,0) DEFAULT 0,
    "isindesignenabled" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "isorderentrybybusinessunit" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "isproposalpagelinkoppenabled" DECIMAL(1,0),
    "isproposalpagelinkrequireoppenabled" DECIMAL(1,0),
    "isarscheduleinvoiceenabled" DECIMAL(1,0) DEFAULT 0,
    "isarschedulepaymentenabled" DECIMAL(1,0) DEFAULT 0,
    "isfilerenameenabled" DECIMAL(1,0),
    "patternquery" TEXT,
    "isorderlistsecurityenabled" DECIMAL(1,0) DEFAULT 0,
    "issingleadindesignenabled" DECIMAL(1,0) DEFAULT 0,
    "isenablemediakitai" DECIMAL(1,0) DEFAULT 0,
    "isemergencybackupenabled" DECIMAL(1,0) DEFAULT 0,
    "isinternalapprovalenabled" DECIMAL(1,0) DEFAULT 0,
    "isemergencybackupfileenabled" DECIMAL(1,0) DEFAULT 0,
    "isproposalconverttoorderonapproval" DECIMAL(1,0),
    "issplitrepchangeorder" DECIMAL(1,0),
    "ischargebritemediaorderenabled" DECIMAL(1,0),
    "istextimageenabled" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "iscalldispositionenabled" DECIMAL(1,0),
    "isenableqbmulticurrency" DECIMAL(1,0) DEFAULT 0,
    "captureccprofileonproposalapproval" DECIMAL(1,0),
    "isinvoicepdfenabled" DECIMAL(1,0) DEFAULT 0,
    "isorderassigntoalert" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblcontrolpanel_309836416" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcontrolpanelfordb" (
    "dbname" VARCHAR(500),
    "emailcount" INTEGER,
    "exceptioncount" INTEGER,
    "mmaccountid" TEXT
);

-- CreateTable
CREATE TABLE "tblcountry" (
    "id" SERIAL NOT NULL,
    "countrycode" VARCHAR(50),
    "countryname" VARCHAR(50),

    CONSTRAINT "countrydetails_pk_1605072954" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcountrycodemapping" (
    "id" SERIAL NOT NULL,
    "countrycode" VARCHAR(2) NOT NULL,
    "altname" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_tblcountrycodemapping_1060459102" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcredittypes" (
    "credittypeid" SERIAL NOT NULL,
    "credittype" VARCHAR(100) NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "createdby" INTEGER NOT NULL,
    "updatedon" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "updatedby" INTEGER NOT NULL,
    "isadd" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "issystem" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk__tblcredi__83fd6db88feb05d1" PRIMARY KEY ("credittypeid")
);

-- CreateTable
CREATE TABLE "tblcustomactionpdf2dsuploadstatus" (
    "id" SERIAL NOT NULL,
    "fileid" VARCHAR(50),
    "pubid" INTEGER,
    "issueid" INTEGER,
    "issueyear" INTEGER,
    "pagenumber" INTEGER,
    "filename" VARCHAR(100),
    "status" SMALLINT,
    "createddate" TIMESTAMP(6),
    "history" TEXT
);

-- CreateTable
CREATE TABLE "tblcustomactiontaskmapping" (
    "id" SERIAL NOT NULL,
    "mmid" INTEGER,
    "targetid" VARCHAR(250),
    "Table" VARCHAR(250),
    "createddate" TIMESTAMP(6),
    "updateddate" TIMESTAMP(6),
    "history" TEXT,

    CONSTRAINT "pk__tblcusto__3214ec272f73aec6" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomdisplaytext" (
    "id" SERIAL NOT NULL,
    "actualtext" VARCHAR(250),
    "displaytext" VARCHAR(250),
    "category" VARCHAR(100),
    "isactive" DECIMAL(1,0),
    "createdon" TIMESTAMP(6),
    "createdby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "updatedby" INTEGER,

    CONSTRAINT "pk_tblcustomdisplaytext_2012742423" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomer2category" (
    "id" SERIAL NOT NULL,
    "contactid" INTEGER,
    "categoryid" INTEGER,

    CONSTRAINT "pk_tblcustomer2category_1877842002" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomer2mkm" (
    "customerid" INTEGER NOT NULL,
    "mkmreferenceid" BIGINT,
    "lastmodified" TIMESTAMP(6),
    "transtype" VARCHAR(10),

    CONSTRAINT "pk__tblcusto__a4ae64b86287e4e5" PRIMARY KEY ("customerid")
);

-- CreateTable
CREATE TABLE "tblcustomer2priority" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER,
    "priorityid" INTEGER,

    CONSTRAINT "pk_tblcustomer2priority_1909842116" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomer2product" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "productid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblcustomer2product_386360691" PRIMARY KEY ("customerid","productid")
);

-- CreateTable
CREATE TABLE "tblcustomerbillingcontacthistory" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER,
    "billingcontactid" INTEGER,
    "source" VARCHAR(150),
    "status" VARCHAR(10),
    "createdon" TIMESTAMP(6),
    "updatedon" TIMESTAMP(6),
    "updatedby" INTEGER,

    CONSTRAINT "pk_tblcustomerbillingcontacthistory_1016598910" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomercategorysummary" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "type" TEXT,

    CONSTRAINT "pk__tblcusto__3214ec07b537501d" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomerfiles" (
    "file_id" SERIAL NOT NULL,
    "filename" VARCHAR(500),
    "notes" VARCHAR(255),
    "gscustomersid" INTEGER,
    "createdate" TIMESTAMP(6),
    "gsemployeesid" INTEGER,
    "gscontractsid" INTEGER,
    "taskid" INTEGER,

    CONSTRAINT "pk__tblcustomerfiles__0d5ad24c" PRIMARY KEY ("file_id")
);

-- CreateTable
CREATE TABLE "tblcustomerleadsourcemapping" (
    "id" SERIAL NOT NULL,
    "leadsourceid" INTEGER,
    "customerid" INTEGER,

    CONSTRAINT "pk__tblcusto__3214ec073c9cb725" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomerleadtypemapping" (
    "id" SERIAL NOT NULL,
    "leadtypeid" INTEGER,
    "customerid" INTEGER,

    CONSTRAINT "pk__tblcusto__3214ec07885105eb" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomerpaymentprofile" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "pgtransactionid" VARCHAR(50),
    "profileid" VARCHAR(50),
    "paymentgatewaydetailid" INTEGER,
    "expdate" DATE,
    "paymentmethod" VARCHAR(100),
    "number" VARCHAR(20),
    "createddate" TIMESTAMP(6),
    "updateddate" TIMESTAMP(6),

    CONSTRAINT "pk_tblcustomerpaymentprofile_1568932861" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomerprospectstagemapping" (
    "id" SERIAL NOT NULL,
    "stageid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "date" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "pk__tblcusto__3214ec27d5a84cb3" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomersleadsource" (
    "leadsourceid" SERIAL NOT NULL,
    "leadsourcevalue" VARCHAR(500),
    "sortorder" INTEGER,

    CONSTRAINT "pk__tblcusto__9fb37dd3c1d744d1" PRIMARY KEY ("leadsourceid")
);

-- CreateTable
CREATE TABLE "tblcustomersleadstatus" (
    "id" SERIAL NOT NULL,
    "leadstatus" VARCHAR(200),
    "sortorder" INTEGER,

    CONSTRAINT "pk__tblcusto__3214ec07ddc476ff" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomersleadtypes" (
    "leadtypeid" SERIAL NOT NULL,
    "leadtypevalue" VARCHAR(200),
    "sortorder" INTEGER NOT NULL,

    CONSTRAINT "pk__tblcusto__023608480ba4a65d" PRIMARY KEY ("leadtypeid")
);

-- CreateTable
CREATE TABLE "tblcustomerworkflowmapping" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER,
    "workflowid" INTEGER,
    "status" VARCHAR(100),
    "date" TIMESTAMP(6),
    "enrollmentid" TEXT,
    "active" DECIMAL(1,0),

    CONSTRAINT "pk__tblcusto__3214ec07b0999b5f" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfield" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "locations" TEXT NOT NULL,
    "inputtype" VARCHAR(50) NOT NULL,
    "datatype" VARCHAR(50) NOT NULL,
    "defaultvalue" TEXT NOT NULL DEFAULT '',
    "maxlength" INTEGER NOT NULL DEFAULT 0,
    "optionlist" TEXT NOT NULL DEFAULT '',
    "userviewlist" TEXT NOT NULL DEFAULT '',
    "deptviewlist" TEXT NOT NULL DEFAULT '',
    "usereditlist" TEXT NOT NULL DEFAULT '',
    "depteditlist" TEXT NOT NULL DEFAULT '',
    "zonelist" TEXT NOT NULL DEFAULT '',
    "date" TIMESTAMP(6),
    "candelete" DECIMAL(1,0) DEFAULT 1,
    "formula" TEXT DEFAULT '',
    "formuladisplay" TEXT DEFAULT '',
    "ischarge" DECIMAL(1,0) DEFAULT 0,
    "valuelist" TEXT DEFAULT '',
    "isinvoicenoteditable" DECIMAL(1,0) DEFAULT 0,
    "producttypeid" INTEGER,
    "isrequired" DECIMAL(1,0) DEFAULT 0,
    "issyncwithmes" DECIMAL(1,0),
    "synctogam" DECIMAL(1,0) DEFAULT 0,
    "isrequiredforpm" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblcustomfield_202535855" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfield2department" (
    "id" SERIAL NOT NULL,
    "gsdeptid" INTEGER,
    "customfieldid" INTEGER,
    "canview" DECIMAL(1,0),
    "canedit" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblcustomfield2employee" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "customfieldid" INTEGER,
    "canview" DECIMAL(1,0),
    "canedit" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblcustomfield2product" (
    "id" SERIAL NOT NULL,
    "productid" INTEGER,
    "customfieldid" INTEGER
);

-- CreateTable
CREATE TABLE "tblcustomfieldcalculatedfields" (
    "id" SERIAL NOT NULL,
    "location" VARCHAR(100),
    "fieldname" VARCHAR(255),
    "datasource" VARCHAR(255),
    "idfield" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "tblcustomfielddatacontact" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblcustomfielddatacontact_378536482" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfielddataeditorial" (
    "id" SERIAL NOT NULL,
    "gseditorialsid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblcustomfielddataeditorial_410536596" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfielddataemployee" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "tblcustomfielddataproduction" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER,
    "insertionid" INTEGER,
    "Probability (%)" VARCHAR(100) DEFAULT '90',
    "PO #" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblcustomfielddataproduction_458536767" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfielddataproject" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER NOT NULL,
    "taskid" INTEGER,
    "Host/Sponsor" VARCHAR(500) DEFAULT ''
);

-- CreateTable
CREATE TABLE "tblcustomfielddataproject_dev_30027_1" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER NOT NULL,
    "taskid" INTEGER
);

-- CreateTable
CREATE TABLE "tblcustomfielddatasubscriber" (
    "id" SERIAL NOT NULL,
    "subscriberid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblcustomfielddatasubscriber_490536881" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfielddatasubscription" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblcustomfieldsubscription_522536995" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfielddynamic" (
    "id" SERIAL NOT NULL,
    "customfieldid" INTEGER,
    "custmfieldname" TEXT,
    "gscontractsid" INTEGER,
    "custmfielddataprodvalue" TEXT,
    "locations" VARCHAR(500),

    CONSTRAINT "pk_tblcustomfielddynamic_1297647916" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfielddynamicproposal" (
    "tabletoupdate" TEXT,
    "idfieldname" TEXT,
    "fieldname" TEXT,
    "idfieldvalue" TEXT,
    "textvalue" TEXT,
    "integervalue" INTEGER,
    "decimalvalue" DECIMAL(16,2),
    "pdatevalue" TEXT,
    "pbitvalue" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblcustomfieldlocations" (
    "id" SERIAL NOT NULL,
    "location" VARCHAR(255),
    "tablename" VARCHAR(255),
    "pagename" VARCHAR(100) DEFAULT '',
    "idfield" VARCHAR(100) DEFAULT '',
    "tablestoref" VARCHAR(500),

    CONSTRAINT "pk_tblcustomfieldlocations_1255063607" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomfieldsortorder" (
    "id" SERIAL NOT NULL,
    "customfieldid" INTEGER NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "location" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_tblcustomfieldsortorder_554537109" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblcustomreport" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL DEFAULT '',
    "reporttype" VARCHAR(50),
    "header" TEXT DEFAULT '',
    "helptext" TEXT DEFAULT '',
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "selectdistinct" DECIMAL(1,0) DEFAULT 1,
    "summaryonly" DECIMAL(1,0) DEFAULT 0,
    "canedit" DECIMAL(1,0) DEFAULT 1,
    "contactgroupfunctions" DECIMAL(1,0) DEFAULT 0,
    "usersaveas" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "isstoredprocedure" DECIMAL(1,0) DEFAULT 0,
    "searchformula" TEXT DEFAULT '',
    "pagesize" INTEGER DEFAULT 0,
    "actionfeatureid" INTEGER DEFAULT 0,
    "code" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumncriteria" (
    "id" SERIAL NOT NULL,
    "customreportid" INTEGER NOT NULL,
    "datasource" VARCHAR(255) NOT NULL,
    "datafield" VARCHAR(255) NOT NULL,
    "inputname" VARCHAR(100) NOT NULL,
    "inputtype" VARCHAR(50) NOT NULL,
    "datatype" VARCHAR(50) NOT NULL,
    "defaultvalue" VARCHAR(50) NOT NULL DEFAULT '',
    "maxlength" INTEGER NOT NULL DEFAULT 100,
    "sortorder" INTEGER NOT NULL,
    "storedprocedure" VARCHAR(255) DEFAULT '',
    "optionlist" TEXT DEFAULT '',
    "arithmaticoperator" VARCHAR(20) DEFAULT '=',
    "valuelist" TEXT,
    "required" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumncriteria_dev_28863" (
    "id" SERIAL NOT NULL,
    "customreportid" INTEGER NOT NULL,
    "datasource" VARCHAR(255) NOT NULL,
    "datafield" VARCHAR(255) NOT NULL,
    "inputname" VARCHAR(100) NOT NULL,
    "inputtype" VARCHAR(50) NOT NULL,
    "datatype" VARCHAR(50) NOT NULL,
    "defaultvalue" VARCHAR(50) NOT NULL,
    "maxlength" INTEGER NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "storedprocedure" VARCHAR(255),
    "optionlist" TEXT,
    "arithmaticoperator" VARCHAR(20),
    "valuelist" TEXT,
    "required" DECIMAL(1,0) NOT NULL
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumncriteriaparameters" (
    "id" SERIAL NOT NULL,
    "criteriaid" INTEGER,
    "name" VARCHAR(255),
    "datatype" VARCHAR(255),
    "reference" TEXT,
    "sortorder" INTEGER,
    "reporttype" VARCHAR(255),
    "storedprocedure" VARCHAR(255),
    "referencetype" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumndisplay" (
    "id" SERIAL NOT NULL,
    "customreportid" INTEGER NOT NULL,
    "datasource" VARCHAR(255) NOT NULL,
    "datafield" VARCHAR(255) NOT NULL DEFAULT '',
    "header" VARCHAR(100) NOT NULL DEFAULT '',
    "format" VARCHAR(50) NOT NULL DEFAULT '',
    "datatype" VARCHAR(50) NOT NULL,
    "maxlength" INTEGER NOT NULL DEFAULT 0,
    "showgroup" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "showtotal" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "showaverage" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "showmin" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "showmax" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "sortorder" INTEGER NOT NULL,
    "align" VARCHAR(50) NOT NULL DEFAULT '',
    "formula" TEXT NOT NULL DEFAULT '',
    "showcount" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "pagelinkheader" TEXT NOT NULL DEFAULT '',
    "pagelinkurl" TEXT NOT NULL DEFAULT '',
    "pagelinkquerystring" TEXT NOT NULL DEFAULT '',
    "linkid" INTEGER,
    "isshowinexportonly" DECIMAL(1,0) DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumndisplay_05212025" (
    "id" SERIAL NOT NULL,
    "customreportid" INTEGER NOT NULL,
    "datasource" VARCHAR(255) NOT NULL,
    "datafield" VARCHAR(255) NOT NULL,
    "header" VARCHAR(100) NOT NULL,
    "format" VARCHAR(50) NOT NULL,
    "datatype" VARCHAR(50) NOT NULL,
    "maxlength" INTEGER NOT NULL,
    "showgroup" DECIMAL(1,0) NOT NULL,
    "showtotal" DECIMAL(1,0) NOT NULL,
    "showaverage" DECIMAL(1,0) NOT NULL,
    "showmin" DECIMAL(1,0) NOT NULL,
    "showmax" DECIMAL(1,0) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "align" VARCHAR(50) NOT NULL,
    "formula" TEXT NOT NULL,
    "showcount" DECIMAL(1,0) NOT NULL,
    "pagelinkheader" TEXT NOT NULL,
    "pagelinkurl" TEXT NOT NULL,
    "pagelinkquerystring" TEXT NOT NULL,
    "linkid" INTEGER,
    "isshowinexportonly" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumndisplay_05232025" (
    "id" SERIAL NOT NULL,
    "customreportid" INTEGER NOT NULL,
    "datasource" VARCHAR(255) NOT NULL,
    "datafield" VARCHAR(255) NOT NULL,
    "header" VARCHAR(100) NOT NULL,
    "format" VARCHAR(50) NOT NULL,
    "datatype" VARCHAR(50) NOT NULL,
    "maxlength" INTEGER NOT NULL,
    "showgroup" DECIMAL(1,0) NOT NULL,
    "showtotal" DECIMAL(1,0) NOT NULL,
    "showaverage" DECIMAL(1,0) NOT NULL,
    "showmin" DECIMAL(1,0) NOT NULL,
    "showmax" DECIMAL(1,0) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "align" VARCHAR(50) NOT NULL,
    "formula" TEXT NOT NULL,
    "showcount" DECIMAL(1,0) NOT NULL,
    "pagelinkheader" TEXT NOT NULL,
    "pagelinkurl" TEXT NOT NULL,
    "pagelinkquerystring" TEXT NOT NULL,
    "linkid" INTEGER,
    "isshowinexportonly" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumndisplay_05302025" (
    "id" SERIAL NOT NULL,
    "customreportid" INTEGER NOT NULL,
    "datasource" VARCHAR(255) NOT NULL,
    "datafield" VARCHAR(255) NOT NULL,
    "header" VARCHAR(100) NOT NULL,
    "format" VARCHAR(50) NOT NULL,
    "datatype" VARCHAR(50) NOT NULL,
    "maxlength" INTEGER NOT NULL,
    "showgroup" DECIMAL(1,0) NOT NULL,
    "showtotal" DECIMAL(1,0) NOT NULL,
    "showaverage" DECIMAL(1,0) NOT NULL,
    "showmin" DECIMAL(1,0) NOT NULL,
    "showmax" DECIMAL(1,0) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "align" VARCHAR(50) NOT NULL,
    "formula" TEXT NOT NULL,
    "showcount" DECIMAL(1,0) NOT NULL,
    "pagelinkheader" TEXT NOT NULL,
    "pagelinkurl" TEXT NOT NULL,
    "pagelinkquerystring" TEXT NOT NULL,
    "linkid" INTEGER,
    "isshowinexportonly" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumndisplay_06192025" (
    "id" SERIAL NOT NULL,
    "customreportid" INTEGER NOT NULL,
    "datasource" VARCHAR(255) NOT NULL,
    "datafield" VARCHAR(255) NOT NULL,
    "header" VARCHAR(100) NOT NULL,
    "format" VARCHAR(50) NOT NULL,
    "datatype" VARCHAR(50) NOT NULL,
    "maxlength" INTEGER NOT NULL,
    "showgroup" DECIMAL(1,0) NOT NULL,
    "showtotal" DECIMAL(1,0) NOT NULL,
    "showaverage" DECIMAL(1,0) NOT NULL,
    "showmin" DECIMAL(1,0) NOT NULL,
    "showmax" DECIMAL(1,0) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "align" VARCHAR(50) NOT NULL,
    "formula" TEXT NOT NULL,
    "showcount" DECIMAL(1,0) NOT NULL,
    "pagelinkheader" TEXT NOT NULL,
    "pagelinkurl" TEXT NOT NULL,
    "pagelinkquerystring" TEXT NOT NULL,
    "linkid" INTEGER,
    "isshowinexportonly" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblcustomreportcolumnsort" (
    "id" SERIAL NOT NULL,
    "customreportid" INTEGER,
    "columnname" VARCHAR(550),
    "direction" VARCHAR(50),
    "sortorder" INTEGER,
    "columndisplayid" INTEGER
);

-- CreateTable
CREATE TABLE "tblcustomreportcriteriasps" (
    "id" SERIAL NOT NULL,
    "reporttype" VARCHAR(255),
    "criteriasp" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "tblcustomreportdatasources" (
    "id" SERIAL NOT NULL,
    "datasource" VARCHAR(255) NOT NULL,
    "reporttype" VARCHAR(255) NOT NULL DEFAULT '',
    "isprimary" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "primarykey" VARCHAR(255) DEFAULT '',
    "secondarykey" VARCHAR(255) DEFAULT '',
    "isstoredprocedure" DECIMAL(1,0),
    "issa" DECIMAL(1,0) DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblcustomreportpagelinks" (
    "id" SERIAL NOT NULL,
    "reporttype" VARCHAR(255),
    "pageheader" VARCHAR(255),
    "url" VARCHAR(255),
    "pagequerystring" VARCHAR(255),
    "reportquerystring" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "tbldashboards" (
    "id" SERIAL NOT NULL,
    "dashboardname" VARCHAR(500) NOT NULL,
    "url" VARCHAR(250),
    "isdefault" DECIMAL(1,0) DEFAULT 0,
    "isactive" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk__tbldashb__3214ec073de0701b" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbldashboards_dev_28712" (
    "id" SERIAL NOT NULL,
    "dashboardname" VARCHAR(500) NOT NULL,
    "url" VARCHAR(250),
    "isdefault" DECIMAL(1,0),
    "isactive" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tbldedupesearchqueries" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100),
    "description" VARCHAR(255),
    "spname" VARCHAR(255) NOT NULL,
    "isactive" DECIMAL(1,0) NOT NULL,
    "createdby" INTEGER NOT NULL,
    "createdon" DATE NOT NULL,
    "lastmodifiedby" INTEGER,
    "lastmodifiedon" DATE
);

-- CreateTable
CREATE TABLE "tbldeletedcontracts" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER NOT NULL,
    "gsdeletedcontractsid" INTEGER,
    "net" DOUBLE PRECISION,
    "barter" DOUBLE PRECISION,
    "gross" DOUBLE PRECISION,
    "mnth" INTEGER,
    "yr" INTEGER,
    "reason" VARCHAR(70),
    "pubid" INTEGER,
    "adsize" INTEGER,
    "columninches" DECIMAL(18,2),
    "columns" DECIMAL(18,2),
    "adsection" INTEGER,
    "adnotes" VARCHAR(5000),
    "dateadded" TIMESTAMP(6),
    "datedeleted" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "deletedby" INTEGER,
    "deletenote" VARCHAR(1000) DEFAULT '',
    "webadpositionid" INTEGER,
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "cardrate" DECIMAL(19,4) DEFAULT 0,
    "ratecardid" INTEGER DEFAULT -1,
    "adagencydiscount" DECIMAL(1,0) DEFAULT 0,
    "adagencypercentage" DECIMAL(18,6) DEFAULT 0,
    "cpm" DECIMAL(18,2) DEFAULT 0,
    "impressions" INTEGER DEFAULT 0,
    "qty" DECIMAL(18,4) DEFAULT 0,
    "price" DECIMAL(18,4) DEFAULT 0,
    "addataid" INTEGER,
    "jobjacketid" INTEGER,
    "jsondata" TEXT
);

-- CreateTable
CREATE TABLE "tbldemagazines" (
    "id" SERIAL NOT NULL,
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "name" VARCHAR(50) NOT NULL DEFAULT '',
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "productid" BIGINT,
    "issuenumber" BIGINT,
    "issueyear" BIGINT,

    CONSTRAINT "pk_tbldemagazines_1472216495" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbldepartment" (
    "departmentid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "siteid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tbldepartment_834102012" PRIMARY KEY ("departmentid")
);

-- CreateTable
CREATE TABLE "tbldigitalads" (
    "id" SERIAL NOT NULL,
    "digitaladstype" VARCHAR(20) NOT NULL,
    "apiurl" TEXT NOT NULL,
    "apiauthorizationkey" TEXT NOT NULL,

    CONSTRAINT "pk_tbldigitalads_508073096" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbldigitaladsadcellerantadvertiser" (
    "advertiserid" INTEGER NOT NULL,
    "name" TEXT,
    "digitaladssetupid" INTEGER,

    CONSTRAINT "pk_tbldigitaladsadcellerantadvertiser_108071671" PRIMARY KEY ("advertiserid")
);

-- CreateTable
CREATE TABLE "tbldigitaladsadcellerantjsonresponse" (
    "id" INTEGER NOT NULL,
    "jsonresponse" TEXT,

    CONSTRAINT "pk_tbldigitaladsadcellerantjsonresponse_41311457" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbldigitaladsadcellerantorder" (
    "id" SERIAL NOT NULL,
    "advertiserid" INTEGER NOT NULL,
    "owneremail" VARCHAR(100),
    "orderid" INTEGER NOT NULL,
    "status" VARCHAR(20),
    "name" VARCHAR(500),
    "budget" DECIMAL(18,2) NOT NULL,
    "productkey" VARCHAR(100),
    "startdate" TIMESTAMP(6) NOT NULL,
    "enddate" TIMESTAMP(6) NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedon" TIMESTAMP(6),
    "proposalproductid" INTEGER,
    "orderdetailsid" INTEGER,
    "digitaladssetupid" INTEGER,
    "cpm" DECIMAL(18,2),
    "impressions" DECIMAL(18,2),
    "billingtype" VARCHAR(100),
    "adsproductid" INTEGER,

    CONSTRAINT "pk_tbldigitaladsadcellerantorder_140071785" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbldigitaladsadcellerantproduct" (
    "productid" INTEGER NOT NULL,
    "name" TEXT,
    "digitaladssetupid" INTEGER,
    "jsonresponse" TEXT,

    CONSTRAINT "pk_tbldigitaladsadcellerantproduct_185311970" PRIMARY KEY ("productid")
);

-- CreateTable
CREATE TABLE "tbldigitaladsadvertiser" (
    "customerid" INTEGER NOT NULL,
    "advertiserid" INTEGER NOT NULL,
    "digitaltype" VARCHAR(20),
    "lastsyncdate" TIMESTAMP(6),

    CONSTRAINT "pk_tbldigitaladsadvertiser_172071899" PRIMARY KEY ("customerid")
);

-- CreateTable
CREATE TABLE "tbldigitaladsorder" (
    "orderid" INTEGER NOT NULL,
    "adcellerantorderid" INTEGER NOT NULL,
    "digitaltype" VARCHAR(20),

    CONSTRAINT "pk_tbldigitaladsorder_204072013" PRIMARY KEY ("orderid")
);

-- CreateTable
CREATE TABLE "tbldigitaladssetup" (
    "id" SERIAL NOT NULL,
    "digitaladstype" VARCHAR(20) NOT NULL,
    "isenabled" DECIMAL(1,0) NOT NULL,
    "authorizationid" VARCHAR(100) NOT NULL,
    "productid" INTEGER,
    "ratecardid" VARCHAR(100),
    "lastsyncdate" TIMESTAMP(6),
    "notificationreps" TEXT,
    "isimportordersonmapping" DECIMAL(1,0),
    "division" VARCHAR(100) NOT NULL,
    "authstatus" DECIMAL(1,0) NOT NULL,
    "isdivisionauthorizationenabled" DECIMAL(1,0) NOT NULL,
    "templateid" INTEGER,
    "pacurrency" VARCHAR(20),
    "panetworkcode" VARCHAR(15),
    "patimezone" VARCHAR(20),
    "admanagerauthfile" TEXT,
    "invoicetemplateid" INTEGER,
    "enableautosync" DECIMAL(1,0),
    "gamaccount" INTEGER,
    "gamuserid" BIGINT,

    CONSTRAINT "pk_tbldigitaladssetup_236072127" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbldistribution" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER,
    "magazineid" INTEGER,
    "issueid" INTEGER,
    "issueyear" INTEGER,
    "qtyshipped" INTEGER,
    "shiptypeid" INTEGER,
    "notes" VARCHAR(500),
    "displaytype" INTEGER DEFAULT 0,
    "stopnumber" INTEGER DEFAULT 0,
    "accttype" INTEGER DEFAULT 0,
    "qtyreturned" INTEGER DEFAULT 0,
    "drops" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "pk_tbldistribution_1807345503" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbldocmanager" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL,
    "siteid" INTEGER NOT NULL,
    "name" VARCHAR(75) NOT NULL,
    "notes" VARCHAR(255) NOT NULL,
    "ownerid" INTEGER NOT NULL,
    "filename" VARCHAR(75),

    CONSTRAINT "pk_tbldocmanager_850102069" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbleadetails" (
    "id" SERIAL NOT NULL,
    "text" TEXT,
    "title" VARCHAR(500),
    "thumbnail" TEXT,
    "url" VARCHAR(500),
    "name" VARCHAR(200),
    "amount" VARCHAR(50),
    "parentid" INTEGER,
    "moduleid" INTEGER,

    CONSTRAINT "pk__tbleadet__3214ec075cc18ae6" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbleamkmcountscache" (
    "id" SERIAL NOT NULL,
    "key" TEXT,
    "modulename" TEXT,
    "countvalue" INTEGER,
    "dateadded" TIMESTAMP(6),

    CONSTRAINT "pk__tbleamkm__3214ec07cb5a48b9" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbleamodules" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "parentid" INTEGER,
    "key" VARCHAR(200),
    "countquery" TEXT,
    "column1" INTEGER,
    "column2" INTEGER,
    "column3" INTEGER,
    "column4" INTEGER,
    "sortorder" INTEGER NOT NULL DEFAULT 0,
    "pricing" TEXT,
    "mmpricing" TEXT,

    CONSTRAINT "pk__tbleamod__3214ec0798255ded" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbleamodulesummary" (
    "id" SERIAL NOT NULL,
    "moduleid" INTEGER,
    "date" VARCHAR(100),
    "count" DECIMAL(10,4),

    CONSTRAINT "pk__tbleamod__3214ec073ae40a53" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblellapsedtimecalculate" (
    "id" SERIAL NOT NULL,
    "seconds" BIGINT,
    "createdate" VARCHAR(100),
    "enddate" VARCHAR(100),
    "domain" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblemailverificationhistory" (
    "id" SERIAL NOT NULL,
    "guid" VARCHAR(50),
    "totalemails" INTEGER,
    "processedemails" INTEGER,
    "loggedinuser" INTEGER,
    "initiatedon" TIMESTAMP(6) NOT NULL,
    "reason" VARCHAR(500),
    "pendingemailscount" INTEGER,
    "completeddate" TIMESTAMP(6),

    CONSTRAINT "pk__tblemail__3214ec271dfdb06e" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblemailverificationprogress" (
    "id" SERIAL NOT NULL,
    "emailid" VARCHAR(500),
    "syncstatus" DECIMAL(1,0) DEFAULT 0,
    "datecreated" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),

    CONSTRAINT "pk__tblemail__3214ec2721ce4152" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblemailverificationstatus" (
    "id" SERIAL NOT NULL,
    "guid" VARCHAR(50),
    "emailid" VARCHAR(500),
    "statuscode" INTEGER,
    "reason" TEXT,
    "dateverified" TIMESTAMP(6),
    "datecreated" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "ismanualupdate" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblemailverificationstatuscodes" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(15) NOT NULL,
    "displaycode" VARCHAR(50) NOT NULL,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblemailverificationstatus_id_1322643955" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblemailverificationstatuswithoutverification" (
    "id" SERIAL NOT NULL,
    "guid" VARCHAR(50),
    "emailid" VARCHAR(500),
    "statuscode" INTEGER,
    "reason" TEXT,
    "dateverified" TIMESTAMP(6),
    "datecreated" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "tblemployee2pub" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "pubid" INTEGER,
    "roleid" INTEGER
);

-- CreateTable
CREATE TABLE "tblemployeesecurity" (
    "id" SERIAL NOT NULL,
    "employeeid" INTEGER,
    "canviewemployeeid" INTEGER,
    "canviewonly" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "roleid" INTEGER,

    CONSTRAINT "pk__tblemployeesecur__4b5804c5" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblesignhistory" (
    "id" SERIAL NOT NULL,
    "mappingid" INTEGER,
    "tablename" VARCHAR(50),
    "rsstatus" VARCHAR(50),
    "rsid" VARCHAR(50),
    "statusupdatedat" VARCHAR(50),
    "actualstatus" VARCHAR(100),
    "ismultiplesigner" DECIMAL(1,0) DEFAULT 0,
    "rskey" VARCHAR(1000) DEFAULT '',
    "repid" INTEGER DEFAULT 0,
    "sendrequestid" VARCHAR(1000),
    "isrsnew" DECIMAL(1,0),
    "mgrstatus" VARCHAR(30),
    "filename" VARCHAR(500),

    CONSTRAINT "pk__tblesign__3214ec071cb4867a" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblfile" (
    "id" SERIAL NOT NULL,
    "path" VARCHAR(1000) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblfile_1477632357" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblforecasting" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER NOT NULL,
    "revenue" DECIMAL(19,4) NOT NULL,
    "pages" DECIMAL(18,2) NOT NULL,
    "probability" DECIMAL(18,2) NOT NULL,
    "zoneid" INTEGER NOT NULL DEFAULT -1,
    "issueid" INTEGER NOT NULL,
    "issueyear" INTEGER NOT NULL,
    "gspubsectionsid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblforecasting_1595920807" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblformbank" (
    "id" SERIAL NOT NULL,
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "name" VARCHAR(50) NOT NULL,
    "sortorder" INTEGER NOT NULL DEFAULT 999,
    "bgcolor" VARCHAR(25),

    CONSTRAINT "pk_tblformbank_898102240" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblformbuildercontrolmapping" (
    "id" SERIAL NOT NULL,
    "mappingtype" VARCHAR(50) NOT NULL,
    "displayname" VARCHAR(50) NOT NULL,
    "tablename" VARCHAR(50) NOT NULL,
    "fieldname" VARCHAR(50) NOT NULL,
    "dataformat" VARCHAR(50) NOT NULL,
    "varpnp" VARCHAR(50) NOT NULL
);

-- CreateTable
CREATE TABLE "tblformbuilderforms" (
    "frmid" UUID NOT NULL,
    "frmname" VARCHAR(50) NOT NULL,
    "frmdatatype" CHAR(3) NOT NULL,
    "frmdefinitionxml" XML NOT NULL,
    "frmlink" VARCHAR(255) NOT NULL,
    "dateadded" TIMESTAMP(6) NOT NULL,
    "isdeleted" DECIMAL(1,0) NOT NULL,
    "analytics" TEXT
);

-- CreateTable
CREATE TABLE "tblformpages" (
    "id" INTEGER,
    "formid" INTEGER,
    "pageid" INTEGER,
    "ratecardid" INTEGER,
    "pubsectionid" INTEGER,
    "specpositionid" VARCHAR(50),
    "editorial" INTEGER
);

-- CreateTable
CREATE TABLE "tblforms" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "formname" VARCHAR(75),
    "mnth" INTEGER NOT NULL,
    "yr" INTEGER NOT NULL,
    "gspubsectionsid" INTEGER,
    "formsizeid" INTEGER NOT NULL,
    "formsize" INTEGER,
    "paperweightid" INTEGER NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "printerid" INTEGER,
    "printrun" INTEGER,
    "printover" INTEGER,
    "editpages" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "blackplates" INTEGER NOT NULL DEFAULT 0,
    "colorplates" INTEGER NOT NULL DEFAULT 0,
    "blackplates2" INTEGER NOT NULL DEFAULT 0,
    "colorplates2" INTEGER NOT NULL DEFAULT 0,
    "sortorder" INTEGER,
    "overrider" DOUBLE PRECISION,
    "overridemr" DOUBLE PRECISION,
    "credits" DOUBLE PRECISION,
    "iscover" DECIMAL(1,0),
    "parentid" SMALLINT,
    "ispreprinted" DECIMAL(1,0),
    "tblmagfrequencyid" INTEGER,

    CONSTRAINT "pk_tblforms_914102297" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblformtoissue" (
    "id" SERIAL NOT NULL,
    "issueid" INTEGER,
    "formid" INTEGER,
    "startpage" INTEGER
);

-- CreateTable
CREATE TABLE "tblglcharges" (
    "id" SERIAL NOT NULL,
    "charge" VARCHAR(100) DEFAULT '',
    "customfieldid" INTEGER DEFAULT -1,
    "surchargeid" INTEGER DEFAULT -1,
    "sortorder" INTEGER DEFAULT 10,
    "type" VARCHAR(30),

    CONSTRAINT "pk_tblglcharges_903062353" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblglcodes" (
    "id" SERIAL NOT NULL,
    "pubid" INTEGER DEFAULT -1,
    "ratecardid" INTEGER DEFAULT -1,
    "chargeid" INTEGER DEFAULT -1,
    "coderevenue" VARCHAR(100) DEFAULT '',
    "codereceivable" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblglcodes_999062695" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblglobalresource" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200) NOT NULL,
    "value" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "tblgoaltype" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(100),

    CONSTRAINT "pk_tblgoaltype_777873938" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblgroup" (
    "groupid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "siteid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblgroup_930102354" PRIMARY KEY ("groupid")
);

-- CreateTable
CREATE TABLE "tblgroupbuy" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(1000),
    "producttype" INTEGER,
    "isactive" DECIMAL(1,0),
    "createdby" INTEGER,
    "createdon" TIMESTAMP(6),
    "modifiedby" INTEGER,
    "modifiedon" TIMESTAMP(6),

    CONSTRAINT "pk__tblgroup__3214ec2751b25e9e" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblgroupbuylineitems" (
    "id" SERIAL NOT NULL,
    "groupbuyid" INTEGER,
    "productid" INTEGER,
    "ratecardid" INTEGER,

    CONSTRAINT "pk__tblgroup__3214ec275582ef82" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblgscustomers" (
    "gscustomersid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "siteid" INTEGER,
    "companyid" INTEGER,
    "adagencyid" INTEGER,
    "repid" INTEGER,
    "priority" VARCHAR(20) DEFAULT '',
    "appointmentsetter" DECIMAL(1,0) DEFAULT 0,
    "directorycontact" DECIMAL(1,0) DEFAULT 0,
    "budgetplandate" TIMESTAMP(6),
    "acctbillto" INTEGER,
    "acctquickbooks" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblgscustomers_1442104178" PRIMARY KEY ("gscustomersid")
);

-- CreateTable
CREATE TABLE "tblgsemployees" (
    "gsemployeesid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "siteid" INTEGER,
    "personid" INTEGER,
    "salesterritory" VARCHAR(100) DEFAULT '',
    "hiredate" TIMESTAMP(6),
    "acctqbsalesrep" VARCHAR(100) DEFAULT '',
    "goalcalls" INTEGER DEFAULT 0,
    "goalsales" INTEGER DEFAULT 0,

    CONSTRAINT "pk_tblgsemployees_946102411" PRIMARY KEY ("gsemployeesid")
);

-- CreateTable
CREATE TABLE "tblhelp" (
    "id" SERIAL NOT NULL,
    "pagename" VARCHAR(255) DEFAULT '',
    "helptext" TEXT DEFAULT ''
);

-- CreateTable
CREATE TABLE "tblhighchartdashboardconf" (
    "id" SERIAL NOT NULL,
    "componentid" INTEGER,
    "charttypeid" SMALLINT,
    "yaxisminvalue" INTEGER,
    "yaxistext" VARCHAR(150),
    "isexportenabled" DECIMAL(1,0) DEFAULT 0,
    "creditstext" VARCHAR(150),
    "titlealign" VARCHAR(10),
    "tooltipid" INTEGER,
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "legendalign" VARCHAR(50),
    "legendverticalalign" VARCHAR(50),
    "legendx" INTEGER,
    "legendy" INTEGER,
    "legendpadding" INTEGER,

    CONSTRAINT "pk__tblhighc__3214ec274d57bdd5" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhighcharttooltips" (
    "tooltipid" SERIAL NOT NULL,
    "headerformat" TEXT,
    "pointformat" TEXT,
    "footerformat" TEXT,
    "shared" DECIMAL(1,0) DEFAULT 1,
    "usehtml" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk__tblhighc__aa99e89951284eb9" PRIMARY KEY ("tooltipid")
);

-- CreateTable
CREATE TABLE "tblhighcharttype" (
    "id" SMALLSERIAL NOT NULL,
    "charttype" VARCHAR(50) NOT NULL,

    CONSTRAINT "pk__tblhighc__3214ec2754f8df9d" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagecomponent" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(100) DEFAULT '',
    "summary" VARCHAR(500) DEFAULT '',
    "description" TEXT DEFAULT '',
    "pageurl" VARCHAR(255) DEFAULT '',
    "datasource" VARCHAR(255) DEFAULT '',
    "datapagesize" INTEGER DEFAULT -1,
    "imageurl" VARCHAR(255) DEFAULT '',
    "category" VARCHAR(50) DEFAULT '',
    "height" INTEGER DEFAULT -1,
    "sortorder" INTEGER DEFAULT -1,
    "columnlist" TEXT DEFAULT '',
    "parameterlist" TEXT DEFAULT '',
    "widgettype" VARCHAR(10) NOT NULL DEFAULT '',
    "sortcolumn" VARCHAR(50) NOT NULL DEFAULT '',
    "template" TEXT NOT NULL DEFAULT '',
    "detailsurl" VARCHAR(255),
    "detailstitle" VARCHAR(255),
    "sitetype" VARCHAR(20) DEFAULT '',
    "referencecode" VARCHAR(255),

    CONSTRAINT "pk_tblhomepagecomponent_887778320" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagecomponent2emailrep" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER,
    "summaryemailfrequencyid" INTEGER,
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "lastrundate" TIMESTAMP(6),
    "issent" DECIMAL(1,0),
    "faileddate" TIMESTAMP(6),
    "roleid" INTEGER,

    CONSTRAINT "pk__tmp_ms_x__3214ec2734020026" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagecomponent2portal" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "portalindex" INTEGER,
    "componentid" INTEGER
);

-- CreateTable
CREATE TABLE "tblhomepagecomponent2user" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "componentid" INTEGER,
    "columnindex" INTEGER,
    "position" INTEGER,
    "closeable" DECIMAL(1,0) DEFAULT 1,
    "draggable" DECIMAL(1,0) DEFAULT 1,
    "collapsible" DECIMAL(1,0) DEFAULT 1,
    "collapsed" DECIMAL(1,0),
    "portalindex" INTEGER,

    CONSTRAINT "pk_tblhomepagecomponents_1079779004" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagecomponentcolumns" (
    "id" SERIAL NOT NULL,
    "componentid" INTEGER,
    "datacolumnname" VARCHAR(50) DEFAULT '',
    "datacolumntype" VARCHAR(50) DEFAULT '',
    "header" VARCHAR(100) DEFAULT '',
    "width" INTEGER DEFAULT 100,
    "align" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER DEFAULT 1,
    "ischartcolumn" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "isxcolumn" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "isycolumn" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "issortable" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblhomepagecomponentcolumns_1159779289" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagecomponentcontrolparameters" (
    "id" SERIAL NOT NULL,
    "componentcontrolid" INTEGER NOT NULL,
    "name" VARCHAR(100),
    "parametertype" VARCHAR(100),
    "reference" VARCHAR(100),
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblhomepagecomponentcontrolparameters_690973688" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagecomponentcontrols" (
    "id" SERIAL NOT NULL,
    "componentid" INTEGER NOT NULL,
    "controlid" VARCHAR(100) NOT NULL,
    "controltype" VARCHAR(100),
    "datasource" VARCHAR(100),
    "hdncontrolid" VARCHAR(100),
    "loaddefault" DECIMAL(1,0),
    "emptytext" VARCHAR(250),

    CONSTRAINT "pk_tblhomepagecomponentcontrols_722973802" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagecomponentparameters" (
    "id" SERIAL NOT NULL,
    "componentid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "type" VARCHAR(100) DEFAULT '',
    "value" TEXT DEFAULT '',

    CONSTRAINT "pk_tblhomepagecomponentparameters_1255779631" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepageemailnotification2rep" (
    "id" SERIAL NOT NULL,
    "emailnotificationid" INTEGER NOT NULL,
    "repid" INTEGER NOT NULL,
    "roleid" INTEGER,

    CONSTRAINT "pk__tblhomep__3214ec2765ce65e4" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepageemailnotifications" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER,
    "fromname" VARCHAR(100) DEFAULT '',
    "subject" VARCHAR(500) DEFAULT '',
    "description" VARCHAR(500),
    "message" TEXT,
    "datecreated" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "datedue" TIMESTAMP(6),
    "link" TEXT,
    "issent" INTEGER DEFAULT 0,
    "orderid" INTEGER,
    "pickupfromdesc" TEXT,
    "designernumber" INTEGER,
    "stageid" INTEGER,
    "groupid" INTEGER,
    "loggedinrepid" INTEGER,

    CONSTRAINT "pk__tblhomep__3214ec27699ef6c8" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagegoal" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "goaltypeid" INTEGER,
    "gscustomersid" INTEGER,
    "zoneid" INTEGER,
    "issueid" INTEGER,
    "goal" DECIMAL(18,2),
    "notes" TEXT,

    CONSTRAINT "pk_tblhomepagegoal_1319779859" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagegoaltype" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(100),

    CONSTRAINT "pk_tblhomepagegoaltype_1351779973" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepageinbox" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER DEFAULT -1,
    "departmentid" INTEGER DEFAULT -1,
    "fromrepid" INTEGER DEFAULT -1,
    "fromname" VARCHAR(100) DEFAULT '',
    "subject" VARCHAR(500) DEFAULT '',
    "description" VARCHAR(500),
    "message" TEXT,
    "link" VARCHAR(1000) DEFAULT '',
    "inboxtypeid" INTEGER DEFAULT 1,
    "categoryid" INTEGER,
    "datecreated" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "datedue" TIMESTAMP(6),
    "dateviewed" TIMESTAMP(6),
    "datedone" TIMESTAMP(6),
    "viewed" DECIMAL(1,0) DEFAULT 0,
    "done" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblhomepagetask_1383780087" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepageinboxcategory" (
    "id" SERIAL NOT NULL,
    "category" VARCHAR(200) DEFAULT '',
    "Group" VARCHAR(100) DEFAULT '',
    "inboxtypeid" INTEGER DEFAULT -1,
    "defaulttype" VARCHAR(10),
    "subgroup" VARCHAR(100),
    "producttypeid" INTEGER,

    CONSTRAINT "pk_tblhomepageinboxcategory_1575780771" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepageinboxcategory2rep" (
    "id" SERIAL NOT NULL,
    "inboxcategoryid" INTEGER,
    "repid" INTEGER,
    "roleid" INTEGER,

    CONSTRAINT "pk_tblhomepageinboxcategory2rep_1655781056" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepageinboxcategory_03202025" (
    "id" SERIAL NOT NULL,
    "category" VARCHAR(200),
    "Group" VARCHAR(100),
    "inboxtypeid" INTEGER,
    "defaulttype" VARCHAR(10),
    "subgroup" VARCHAR(100),
    "producttypeid" INTEGER
);

-- CreateTable
CREATE TABLE "tblhomepageinboxtype" (
    "id" SERIAL NOT NULL,
    "inboxtype" VARCHAR(50) DEFAULT '',

    CONSTRAINT "pk_tblhomepageinboxtype_1687781170" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepageportal" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "portalindex" INTEGER,
    "title" VARCHAR(50),
    "columns" INTEGER,
    "column1width" INTEGER,
    "column2width" INTEGER,
    "column3width" INTEGER,
    "sortorder" INTEGER,
    "closeable" DECIMAL(1,0) DEFAULT 0,
    "ishome" DECIMAL(1,0) DEFAULT 0,
    "isconfigurabelwidgets" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblhomepageportal_1735781341" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblhomepagesitetasks" (
    "id" SERIAL NOT NULL,
    "sitetask" VARCHAR(100),
    "storedprocedure" VARCHAR(500),
    "lastrundate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "frequency" VARCHAR(25),
    "parameter1" INTEGER DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblimportcirculationfile" (
    "id" SERIAL NOT NULL,
    "importdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "finishdate" TIMESTAMP(6),
    "importfile" VARCHAR(255) NOT NULL DEFAULT '',
    "importname" VARCHAR(255) DEFAULT '',
    "notes" VARCHAR(1000) NOT NULL DEFAULT '',
    "importedcount" INTEGER DEFAULT 0,
    "errorcount" INTEGER DEFAULT 0,
    "duplicatecount" INTEGER DEFAULT 0,
    "gsemployeesid" INTEGER,
    "gsemployeesinitials" VARCHAR(50) DEFAULT '',
    "importedcountsubscriptions" INTEGER DEFAULT 0,
    "lastlinenumber" INTEGER DEFAULT 0,
    "subscribercount" INTEGER DEFAULT 0,
    "subscriptioncount" INTEGER DEFAULT 0,
    "complistcount" INTEGER DEFAULT 0,

    CONSTRAINT "pk_tblimportcirculationfile_1155587255" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimportcontractsfile" (
    "id" SERIAL NOT NULL,
    "importdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "importfile" VARCHAR(255) NOT NULL DEFAULT '',
    "notes" VARCHAR(1000) NOT NULL DEFAULT '',
    "importedcount" INTEGER NOT NULL DEFAULT 0,
    "errorcount" INTEGER NOT NULL DEFAULT 0,
    "gsemployeesid" INTEGER,
    "insertduplicates" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblimportcontractsfile_1395588110" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimportfile" (
    "id" SERIAL NOT NULL,
    "importdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "importfile" VARCHAR(255) NOT NULL DEFAULT '',
    "gscontacttypeid" INTEGER NOT NULL DEFAULT -1,
    "notes" VARCHAR(1000) NOT NULL DEFAULT '',
    "importedcount" INTEGER NOT NULL DEFAULT 0,
    "errorcount" INTEGER NOT NULL DEFAULT 0,
    "gsemployeesid" INTEGER,
    "insertduplicates" DECIMAL(1,0) DEFAULT 0,
    "trimlength" DECIMAL(1,0) DEFAULT 0,
    "defaultrep" INTEGER,
    "defaultcategory" INTEGER,

    CONSTRAINT "pk_tblimportfile_1523588566" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimportfilecirculation" (
    "id" SERIAL NOT NULL,
    "importdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "finishdate" TIMESTAMP(6),
    "importfile" VARCHAR(255) NOT NULL DEFAULT '',
    "importname" VARCHAR(255) DEFAULT '',
    "columnnames" TEXT DEFAULT '',
    "notes" TEXT NOT NULL DEFAULT '',
    "gsemployeesid" INTEGER,
    "subscribertotal" INTEGER DEFAULT 0,
    "subscriptiontotal" INTEGER DEFAULT 0,
    "subscribercount" INTEGER DEFAULT 0,
    "subscriptioncount" INTEGER DEFAULT 0,
    "complistcount" INTEGER DEFAULT 0,
    "importfileuploaded" INTEGER DEFAULT 0,
    "importdatasaved" INTEGER DEFAULT 0,
    "columnsmapped" INTEGER DEFAULT 0,
    "columnschecked" INTEGER DEFAULT 0,
    "subscribertypeverified" INTEGER DEFAULT 0,
    "subscribersourceverified" INTEGER DEFAULT 0,
    "magazineverified" INTEGER DEFAULT 0,
    "startissueverified" INTEGER DEFAULT 0,
    "endissueverified" INTEGER DEFAULT 0,
    "subscriptiontypeverified" INTEGER DEFAULT 0,
    "subscriptionsourceverified" INTEGER DEFAULT 0,
    "billingseriesverified" INTEGER DEFAULT 0,
    "renewalseriesverified" INTEGER DEFAULT 0,
    "subscribersmapped" INTEGER DEFAULT -1,
    "subscribertypesmapped" INTEGER DEFAULT 0,
    "magazinesmapped" INTEGER DEFAULT 0,
    "startissuesmapped" INTEGER DEFAULT 0,
    "endissuesmapped" INTEGER DEFAULT 0,
    "subscriptiontypesmapped" INTEGER DEFAULT 0,
    "subscriptionsourcesmapped" INTEGER DEFAULT 0,
    "billingseriesmapped" INTEGER DEFAULT 0,
    "renewalseriesmapped" INTEGER DEFAULT 0,
    "subscribersonly" INTEGER DEFAULT 0,
    "undone" INTEGER DEFAULT 0,
    "error" INTEGER DEFAULT 0,

    CONSTRAINT "pk_tblimportfilecirculation_592109250" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimportfilecontacts" (
    "id" SERIAL NOT NULL,
    "importdate" TIMESTAMP(6) NOT NULL,
    "finishdate" TIMESTAMP(6),
    "importfile" VARCHAR(255) NOT NULL DEFAULT '',
    "importname" VARCHAR(255) DEFAULT '',
    "contacttypeid" INTEGER,
    "columnnames" TEXT DEFAULT '',
    "notes" TEXT NOT NULL DEFAULT '',
    "gsemployeesid" INTEGER,
    "importduplicates" INTEGER DEFAULT -1,
    "contacttotal" INTEGER DEFAULT 0,
    "notestotal" INTEGER DEFAULT 0,
    "contactcount" INTEGER DEFAULT 0,
    "notescount" INTEGER DEFAULT 0,
    "importfileuploaded" INTEGER DEFAULT 0,
    "importdatasaved" INTEGER DEFAULT 0,
    "columnsmapped" INTEGER DEFAULT 0,
    "columnschecked" INTEGER DEFAULT 0,
    "categoriesverified" INTEGER DEFAULT 0,
    "repsverified" INTEGER DEFAULT 0,
    "contacttypesverified" INTEGER DEFAULT 0,
    "prioritiesverified" INTEGER DEFAULT 0,
    "groupsverified" INTEGER DEFAULT 0,
    "contactsmapped" INTEGER DEFAULT -1,
    "agenciesmapped" INTEGER DEFAULT -1,
    "categoriesmapped" INTEGER DEFAULT 0,
    "repsmapped" INTEGER DEFAULT 0,
    "prioritiesmapped" INTEGER DEFAULT 0,
    "groupsmapped" INTEGER DEFAULT 0,
    "contactsonly" INTEGER DEFAULT 0,
    "notesonly" INTEGER DEFAULT 0,
    "agenciesonly" INTEGER DEFAULT 0,
    "subcontactsonly" INTEGER DEFAULT 0,
    "undone" INTEGER DEFAULT 0,
    "error" INTEGER DEFAULT 0,
    "status" INTEGER,
    "favoriteid" INTEGER,

    CONSTRAINT "pk_tblimportfilecontact_1244635577" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimportfilecontracts" (
    "id" SERIAL NOT NULL,
    "importdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "finishdate" TIMESTAMP(6),
    "importfile" VARCHAR(255) NOT NULL DEFAULT '',
    "importname" VARCHAR(255) DEFAULT '',
    "contracttypeid" INTEGER,
    "columnnames" TEXT DEFAULT '',
    "notes" TEXT NOT NULL DEFAULT '',
    "gsemployeesid" INTEGER,
    "contracttotal" INTEGER DEFAULT 0,
    "contractcount" INTEGER DEFAULT 0,
    "importfileuploaded" INTEGER DEFAULT 0,
    "importdatasaved" INTEGER DEFAULT 0,
    "columnsmapped" INTEGER DEFAULT 0,
    "columnschecked" INTEGER DEFAULT 0,
    "rep1verified" INTEGER DEFAULT 0,
    "rep2verified" INTEGER DEFAULT 0,
    "rep3verified" INTEGER,
    "zonesverified" INTEGER DEFAULT 0,
    "ratecardsverified" INTEGER DEFAULT 0,
    "issuesverified" INTEGER DEFAULT 0,
    "yearsverified" INTEGER DEFAULT 0,
    "adsizesverified" INTEGER DEFAULT 0,
    "adcolorsverified" INTEGER DEFAULT 0,
    "frequenciesverified" INTEGER DEFAULT -1,
    "positionsverified" INTEGER DEFAULT -1,
    "sectionsverified" INTEGER DEFAULT -1,
    "contactsmapped" INTEGER DEFAULT -1,
    "repsmapped" INTEGER DEFAULT 0,
    "undone" INTEGER DEFAULT 0,
    "filetoolarge" INTEGER DEFAULT 0,
    "error" INTEGER DEFAULT -1,
    "status" INTEGER,
    "ordertype" VARCHAR(20),
    "favoriteid" INTEGER,
    "zipfilename" VARCHAR(200),
    "calculationstatus" INTEGER,
    "issuetype" INTEGER,
    "isinvoice" DECIMAL(1,0),
    "invoicetemplateid" INTEGER,

    CONSTRAINT "pk_tblimportfilecontract_489156888" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimportmapping" (
    "id" SERIAL NOT NULL,
    "importid" INTEGER,
    "importcolumnname" VARCHAR(100),
    "columnposition" INTEGER,
    "tablename" VARCHAR(50),
    "columnname" VARCHAR(50),
    "circulationimport" DECIMAL(1,0) DEFAULT 0,
    "contractimport" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblimporttemplateagency" (
    "Company Name" VARCHAR(90),
    "prefix" VARCHAR(50),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "suffix" VARCHAR(50),
    "title" VARCHAR(50),
    "Contact Type" VARCHAR(50),
    "rep" VARCHAR(100),
    "category" VARCHAR(100),
    "Contact Group" TEXT,
    "priority" VARCHAR(50),
    "attn" VARCHAR(50),
    "address1" VARCHAR(50),
    "address2" VARCHAR(50),
    "city" VARCHAR(50),
    "state" VARCHAR(50),
    "zip" VARCHAR(50),
    "county" VARCHAR(50),
    "country" VARCHAR(255),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "phone3" VARCHAR(50),
    "fax" VARCHAR(50),
    "email" VARCHAR(70),
    "email2" VARCHAR(70),
    "Web Site" VARCHAR(255),
    "Home Address 1" VARCHAR(50),
    "Home Address 2" VARCHAR(50),
    "Home City" VARCHAR(50),
    "Home State" VARCHAR(50),
    "Home Zip" VARCHAR(50),
    "Home Phone" VARCHAR(50),
    "Home Fax" VARCHAR(50),
    "notes" TEXT
);

-- CreateTable
CREATE TABLE "tblimporttemplatecontact" (
    "Company Name" VARCHAR(90),
    "prefix" VARCHAR(50),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "suffix" VARCHAR(50),
    "title" VARCHAR(50),
    "Contact Type" VARCHAR(50),
    "rep" VARCHAR(100),
    "category" VARCHAR(100),
    "Contact Group" TEXT,
    "priority" VARCHAR(50),
    "attn" VARCHAR(50),
    "address1" VARCHAR(50),
    "address2" VARCHAR(50),
    "city" VARCHAR(50),
    "state" VARCHAR(50),
    "zip" VARCHAR(50),
    "county" VARCHAR(50),
    "country" VARCHAR(255),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "phone3" VARCHAR(50),
    "fax" VARCHAR(50),
    "email" VARCHAR(70),
    "email2" VARCHAR(70),
    "Web Site" VARCHAR(255),
    "Home Address 1" VARCHAR(50),
    "Home Address 2" VARCHAR(50),
    "Home City" VARCHAR(50),
    "Home State" VARCHAR(50),
    "Home Zip" VARCHAR(50),
    "Home Phone" VARCHAR(50),
    "Home Fax" VARCHAR(50),
    "notes" TEXT,
    "Ad Agency" VARCHAR(90),
    "Ad Agency First Name" VARCHAR(50),
    "Ad Agency Last Name" VARCHAR(50),
    "Ad Agency Address 1" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblimporttemplatecontract" (
    "Customer ID" INTEGER,
    "Company Name" VARCHAR(255),
    "First Name" VARCHAR(255),
    "Last Name" VARCHAR(255),
    "Address 1" VARCHAR(255),
    "zone" VARCHAR(50),
    "Rate Card" VARCHAR(50),
    "issue" VARCHAR(50),
    "year" VARCHAR(50),
    "Ad Size" VARCHAR(50),
    "Ad Color" VARCHAR(50),
    "frequency" VARCHAR(50),
    "position" VARCHAR(50),
    "section" VARCHAR(50),
    "net" VARCHAR(50),
    "gross" VARCHAR(50),
    "barter" VARCHAR(50),
    "Rate Card Price" VARCHAR(50),
    "discounts" VARCHAR(50),
    "Production Charge" VARCHAR(50),
    "Ad Agency Discount" VARCHAR(50),
    "Ad Agency Percentage" VARCHAR(50),
    "Rep 1" VARCHAR(50),
    "Date Added" VARCHAR(50),
    "Ad Name" VARCHAR(50),
    "Ad Notes" VARCHAR(1000),
    "Production Notes" TEXT
);

-- CreateTable
CREATE TABLE "tblimporttemplatenotes" (
    "mmcontactid" INTEGER,
    "Company Name" VARCHAR(100),
    "First Name" VARCHAR(100),
    "Last Name" VARCHAR(100),
    "address1" VARCHAR(100),
    "notes" TEXT,
    "rep" VARCHAR(100),
    "Date Added" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblimporttemplatesubcontact" (
    "Parent Company Name" VARCHAR(90),
    "Parent First Name" VARCHAR(50),
    "Parent Last Name" VARCHAR(50),
    "Parent Address1" VARCHAR(50),
    "Company Name" VARCHAR(90),
    "prefix" VARCHAR(50),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "suffix" VARCHAR(50),
    "title" VARCHAR(50),
    "Contact Type" VARCHAR(50),
    "Contact Group" TEXT,
    "attn" VARCHAR(50),
    "address1" VARCHAR(50),
    "address2" VARCHAR(50),
    "city" VARCHAR(50),
    "state" VARCHAR(50),
    "zip" VARCHAR(50),
    "county" VARCHAR(50),
    "country" VARCHAR(255),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(50),
    "phone3" VARCHAR(50),
    "fax" VARCHAR(50),
    "email" VARCHAR(70),
    "email2" VARCHAR(70),
    "Web Site" VARCHAR(255),
    "Home Address 1" VARCHAR(50),
    "Home Address 2" VARCHAR(50),
    "Home City" VARCHAR(40),
    "Home State" VARCHAR(50),
    "Home Zip" VARCHAR(50),
    "Home Phone" VARCHAR(50),
    "Home Fax" VARCHAR(50),
    "notes" TEXT,
    "Parent Customer ID" INTEGER
);

-- CreateTable
CREATE TABLE "tblimporttemplatesubscriber" (
    "Subscriber ID" VARCHAR(100),
    "Company Name" VARCHAR(100),
    "prefix" VARCHAR(100),
    "First Name" VARCHAR(100),
    "Last Name" VARCHAR(100),
    "suffix" VARCHAR(100),
    "department" VARCHAR(100),
    "title" VARCHAR(100),
    "Job Description" VARCHAR(100),
    "attn" VARCHAR(100),
    "address1" VARCHAR(100),
    "address2" VARCHAR(100),
    "city" VARCHAR(100),
    "state" VARCHAR(100),
    "zip" VARCHAR(100),
    "county" VARCHAR(100),
    "country" VARCHAR(100),
    "phone" VARCHAR(100),
    "phone2" VARCHAR(100),
    "phone3" VARCHAR(100),
    "fax" VARCHAR(100),
    "fax2" VARCHAR(100),
    "email" VARCHAR(100),
    "email2" VARCHAR(100),
    "Web Site" VARCHAR(100),
    "Originating List" VARCHAR(100),
    "Subscriber Type" VARCHAR(100),
    "Subscriber Since" TIMESTAMP(6),
    "notes" VARCHAR(8000)
);

-- CreateTable
CREATE TABLE "tblimporttemplatesubscription" (
    "magazine" VARCHAR(50),
    "Start Issue" VARCHAR(100),
    "Start Year" VARCHAR(10),
    "End Issue" VARCHAR(100),
    "End Year" VARCHAR(10),
    "source" VARCHAR(100),
    "type" VARCHAR(100),
    "copies" VARCHAR(10),
    "price" VARCHAR(10),
    "Amount Paid" VARCHAR(10),
    "Payment Method" VARCHAR(100),
    "Start Date" VARCHAR(20),
    "Payment Date" VARCHAR(20),
    "Verified Date" VARCHAR(20),
    "Qualified Date" VARCHAR(20),
    "Cancelled Date" VARCHAR(20),
    "Billing Series" VARCHAR(100),
    "Renewal Series" VARCHAR(100),
    "Subscription Notes" VARCHAR(1000),
    "Shipping Attn" VARCHAR(100),
    "Shipping Address1" VARCHAR(100),
    "Shipping Address2" VARCHAR(100),
    "Shipping City" VARCHAR(100),
    "Shipping State" VARCHAR(100),
    "Shipping Zip" VARCHAR(100),
    "Shipping County" VARCHAR(100),
    "Shipping Country" VARCHAR(100),
    "Billing Attn" VARCHAR(100),
    "Billing Address1" VARCHAR(100),
    "Billing Address2" VARCHAR(100),
    "Billing City" VARCHAR(100),
    "Billing State" VARCHAR(100),
    "Billing Zip" VARCHAR(100),
    "Billing County" VARCHAR(100),
    "Billing Country" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblimporttoolcolumnmapping" (
    "id" SERIAL NOT NULL,
    "tablename" VARCHAR(50) NOT NULL,
    "importtype" VARCHAR(50) NOT NULL,
    "columnname" VARCHAR(50) NOT NULL,
    "mappingkey" VARCHAR(50) NOT NULL,
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "isrequired" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "isvalidationrequired" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "mastersparameter" VARCHAR(200),
    "isvalue" DECIMAL(1,0) DEFAULT 0,
    "updatequery" TEXT,
    "sortorder" INTEGER,
    "columndependency" VARCHAR(50),
    "displaysortorder" INTEGER,

    CONSTRAINT "pk_tblimporttoolcolumnmapping_1630121048" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimporttoolcolumnmappingfavorite" (
    "favoriteid" SERIAL NOT NULL,
    "favoritename" VARCHAR(100),
    "importedbasecolumns" VARCHAR(1000),
    "basecolumns" VARCHAR(1000),
    "importedcustomfieldscolumns" VARCHAR(1000),
    "customfieldscolumns" VARCHAR(1000),
    "isactive" DECIMAL(1,0) DEFAULT 1
);

-- CreateTable
CREATE TABLE "tblimporttoolcolumnmappingfavourite" (
    "favouriteid" SERIAL NOT NULL,
    "favouritename" VARCHAR(100),
    "importedbasecolumns" VARCHAR(1000),
    "basecolumns" VARCHAR(1000),
    "importedcustomfieldscolumns" VARCHAR(1000),
    "customfieldscolumns" VARCHAR(1000),
    "isactive" DECIMAL(1,0) DEFAULT 1
);

-- CreateTable
CREATE TABLE "tblimporttooldetails" (
    "id" SERIAL NOT NULL,
    "importdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "finishdate" TIMESTAMP(6),
    "importfile" VARCHAR(255) NOT NULL DEFAULT '',
    "importname" VARCHAR(255) DEFAULT '',
    "columnnames" TEXT DEFAULT '',
    "notes" TEXT NOT NULL DEFAULT '',
    "gsemployeesid" INTEGER,
    "undone" INTEGER DEFAULT 0,
    "errorcode" INTEGER DEFAULT -1,
    "errormessage" VARCHAR(500),
    "status" INTEGER,
    "importtype" VARCHAR(20),
    "favoriteid" INTEGER,
    "zipfilename" VARCHAR(200),
    "calculationstatus" INTEGER,
    "issuetype" INTEGER,
    "isinvoice" DECIMAL(1,0) DEFAULT 0,
    "invoicetemplateid" INTEGER DEFAULT 0,
    "importduplicates" INTEGER DEFAULT 0,

    CONSTRAINT "pk_tblimporttooldetails_1930646121" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimporttoolmappingcolumnssave" (
    "id" SERIAL NOT NULL,
    "importid" INTEGER,
    "importedbasecolumns" TEXT,
    "basecolumns" TEXT,
    "importedcustomfieldscolumns" TEXT,
    "customfieldscolumns" TEXT,
    "modifiedfilecolumns" TEXT,
    "modifiedcustomfilecolumns" TEXT,
    "favouriteimportedbasecolumns" TEXT
);

-- CreateTable
CREATE TABLE "tblimporttoolnoteshistory" (
    "id" SERIAL NOT NULL,
    "importid" INTEGER,
    "notesdescription" TEXT,
    "importtoolstatus" INTEGER
);

-- CreateTable
CREATE TABLE "tblimporttoolstaticcolumns" (
    "id" SERIAL NOT NULL,
    "importtype" VARCHAR(20) NOT NULL,
    "staticcolums" TEXT NOT NULL,

    CONSTRAINT "pk_tblimporttoolstaticcolumns_1710121333" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblimporttoolunmatcheddata" (
    "id" SERIAL NOT NULL,
    "unmatacheddata" TEXT,
    "dependencydata" VARCHAR(100),
    "mastertablename" VARCHAR(50),
    "importfilecolumn" VARCHAR(100),
    "isvalue" DECIMAL(1,0),
    "updatecol" VARCHAR(100),
    "columnid" INTEGER,
    "importid" INTEGER,
    "sortorder" INTEGER,
    "columndependency" VARCHAR(200),
    "displaycolumn" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblimporttooluploadedimages" (
    "id" SERIAL NOT NULL,
    "importid" INTEGER NOT NULL,
    "imagename" VARCHAR(200),

    CONSTRAINT "pk__tblimpor__3214ec27047dd58d" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblindesigntemplates" (
    "id" SERIAL NOT NULL,
    "templatename" VARCHAR(100) NOT NULL,
    "templatepath" VARCHAR(1000) NOT NULL,
    "xsltname" VARCHAR(100) NOT NULL,
    "xsltpath" VARCHAR(1000) NOT NULL,
    "iscolumninch" DECIMAL(1,0),
    "isnew" DECIMAL(1,0) DEFAULT 0,
    "headerimgpath" TEXT,
    "classsource" INTEGER DEFAULT 0,

    CONSTRAINT "pk_tblindesigntemplates_1096547140" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblinterestgroups" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk__tblinter__3214ec07259ed236" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblinvoice" (
    "invoiceid" SERIAL NOT NULL,
    "invoicenumber" VARCHAR(100) DEFAULT '',
    "gscustomersid" INTEGER,
    "total" DECIMAL(18,4) DEFAULT 0,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "invoicedate" TIMESTAMP(6),
    "duedate" TIMESTAMP(6),
    "updatedbyuserid" INTEGER,
    "upperhtml" TEXT DEFAULT '',
    "lowerhtml" TEXT DEFAULT '',
    "locked" DECIMAL(1,0) DEFAULT 0,
    "lockdate" TIMESTAMP(6),
    "bartertotal" DECIMAL(19,4) DEFAULT 0,
    "quickbooksinvoiceid" VARCHAR(50),
    "editsequence" VARCHAR(16),
    "coverdate" VARCHAR(100),
    "showtotal" DECIMAL(1,0) DEFAULT 1,
    "billtoid" INTEGER,
    "totaltext" TEXT DEFAULT 'Total:',
    "asyncid" INTEGER,
    "templateid" INTEGER,
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "lastemailsentdate" TIMESTAMP(6),

    CONSTRAINT "pk_tblinvoice_1_626869350" PRIMARY KEY ("invoiceid")
);

-- CreateTable
CREATE TABLE "tblinvoice2rep" (
    "id" SERIAL NOT NULL,
    "invoiceid" INTEGER,
    "lineitemid" INTEGER,
    "gsemployeesid" INTEGER
);

-- CreateTable
CREATE TABLE "tblinvoice2zone" (
    "id" SERIAL NOT NULL,
    "invoiceid" INTEGER,
    "zoneid" INTEGER,

    CONSTRAINT "pk_tblinvoice2zone_581681220" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblinvoiceconsolidated" (
    "cinvoiceid" SERIAL NOT NULL,
    "invoicenumber" VARCHAR(100) DEFAULT '',
    "gscustomersid" INTEGER,
    "total" DECIMAL(18,4) DEFAULT 0,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "invoicedate" TIMESTAMP(6),
    "duedate" TIMESTAMP(6),
    "updatedbyuserid" INTEGER,
    "upperhtml" TEXT DEFAULT '',
    "lowerhtml" TEXT DEFAULT '',
    "locked" DECIMAL(1,0) DEFAULT 0,
    "lockdate" TIMESTAMP(6),
    "bartertotal" DECIMAL(19,4) DEFAULT 0,
    "coverdate" VARCHAR(100),
    "showtotal" DECIMAL(1,0) DEFAULT 1,
    "billtoid" INTEGER,
    "totaltext" TEXT DEFAULT 'Total:',
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblinvoiceconsolidated_2126786784" PRIMARY KEY ("cinvoiceid")
);

-- CreateTable
CREATE TABLE "tblinvoicedefinition" (
    "invoicedefinitionid" SERIAL NOT NULL,
    "description" VARCHAR(1000) DEFAULT '',
    "isdefault" DECIMAL(1,0) DEFAULT 0,
    "upperhtml" TEXT,
    "lowerhtml" TEXT,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "updatedbyid" INTEGER,
    "showtotal" DECIMAL(1,0) DEFAULT 1,
    "totaltext" TEXT DEFAULT 'Total:',
    "saeditonly" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "active" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "thumbnailimage" TEXT,

    CONSTRAINT "pk_tblinvoice_613681334" PRIMARY KEY ("invoicedefinitionid")
);

-- CreateTable
CREATE TABLE "tblinvoicedeleted" (
    "invoiceid" INTEGER,
    "invoicenumber" VARCHAR(100),
    "gscustomersid" INTEGER,
    "total" DECIMAL(19,4) DEFAULT 0,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "invoicedate" TIMESTAMP(6),
    "duedate" TIMESTAMP(6),
    "updatedbyuserid" INTEGER,
    "upperhtml" TEXT,
    "lowerhtml" TEXT,
    "locked" DECIMAL(1,0),
    "lockdate" TIMESTAMP(6),
    "deletedate" TIMESTAMP(6),
    "deletedbyuserid" INTEGER,
    "deletereason" VARCHAR(1000),
    "bartertotal" DECIMAL(19,4) DEFAULT 0,
    "billtoid" INTEGER DEFAULT -1,
    "asyncid" INTEGER,
    "quickbooksinvoiceid" VARCHAR(50),
    "editsequence" VARCHAR(16)
);

-- CreateTable
CREATE TABLE "tblinvoicedisplayfields" (
    "fieldid" SERIAL NOT NULL,
    "lineitemtypeid" INTEGER,
    "header" VARCHAR(100),
    "fieldname" VARCHAR(500),
    "format" VARCHAR(100),
    "replace" VARCHAR(100),
    "sortorder" INTEGER,
    "subproducttypeid" INTEGER,
    "description" TEXT,

    CONSTRAINT "pk_tblinvoicedisplayfields_1985546257" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblinvoicedisplayfields_07302025" (
    "fieldid" SERIAL NOT NULL,
    "lineitemtypeid" INTEGER,
    "header" VARCHAR(100),
    "fieldname" VARCHAR(500),
    "format" VARCHAR(100),
    "replace" VARCHAR(100),
    "sortorder" INTEGER,
    "subproducttypeid" INTEGER,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblinvoicedisplayfields_backup_dev33377" (
    "fieldid" SERIAL NOT NULL,
    "lineitemtypeid" INTEGER,
    "header" VARCHAR(100),
    "fieldname" VARCHAR(500),
    "format" VARCHAR(100),
    "replace" VARCHAR(100),
    "sortorder" INTEGER,
    "subproducttypeid" INTEGER,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblinvoicedisplayfields_dev_33019" (
    "fieldid" SERIAL NOT NULL,
    "lineitemtypeid" INTEGER,
    "header" VARCHAR(100),
    "fieldname" VARCHAR(500),
    "format" VARCHAR(100),
    "replace" VARCHAR(100),
    "sortorder" INTEGER,
    "subproducttypeid" INTEGER,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblinvoiceextension" (
    "invoiceid" INTEGER NOT NULL,
    "sourceinvoiceid" INTEGER,
    "multicurrencyid" INTEGER,
    "exchangerate" DECIMAL(18,6),

    CONSTRAINT "pk_tblinvoiceextension_2137982893" PRIMARY KEY ("invoiceid")
);

-- CreateTable
CREATE TABLE "tblinvoicelineitem" (
    "id" SERIAL NOT NULL,
    "invoiceid" INTEGER,
    "gscontractsid" INTEGER,
    "sortorder" INTEGER,
    "createdate" TIMESTAMP(6),
    "invoicedefinitionid" INTEGER,
    "lineitemtype" VARCHAR(50) DEFAULT '',
    "amount" DECIMAL(19,4),
    "description" VARCHAR(1000) DEFAULT '',
    "gscontractsinstallmentid" INTEGER,
    "zoneid" INTEGER DEFAULT -1,
    "barteramount" DECIMAL(19,4),
    "quickbooksinvoicelineitemid" VARCHAR(50),
    "editsequence" VARCHAR(16),
    "lineitemtypeid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "showamount" DECIMAL(1,0) DEFAULT 1,
    "displaydetails" DECIMAL(1,0) DEFAULT 1,
    "displaysubtotal" DECIMAL(1,0) DEFAULT 0,
    "groupbyproduct" DECIMAL(1,0) DEFAULT 0,
    "subproducttypeid" INTEGER,
    "cinvoiceid" INTEGER,
    "toinvoiceid" INTEGER,
    "groupbyissue" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblinvoicelineitem_1_709681676" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblinvoicelineitemdefinition" (
    "id" SERIAL NOT NULL,
    "invoiceid" INTEGER,
    "invoicedefinitionid" INTEGER,
    "lineitemtypeid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(500) DEFAULT '',
    "amount" DECIMAL(19,4),
    "showamount" DECIMAL(1,0) DEFAULT 1,
    "sortorder" INTEGER,
    "displaydetails" DECIMAL(1,0) DEFAULT 1,
    "displaysubtotal" DECIMAL(1,0) DEFAULT 0,
    "groupbyproduct" DECIMAL(1,0) DEFAULT 0,
    "subproducttypeid" INTEGER,
    "tmplid" INTEGER,
    "displaysummaries" DECIMAL(1,0) DEFAULT 1,
    "totaltext" VARCHAR(500) DEFAULT 'Total',
    "cinvoiceid" INTEGER,
    "groupbyissue" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblinvoicelineitemdefinition_972686663" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblinvoicelineitemdeleted" (
    "id" INTEGER,
    "invoiceid" INTEGER,
    "gscontractsid" INTEGER,
    "createdate" TIMESTAMP(6),
    "deletedate" TIMESTAMP(6),
    "deletedbyuserid" INTEGER,
    "amount" DECIMAL(19,4),
    "description" VARCHAR(1000),
    "cinvoiceid" INTEGER,
    "toinvoiceid" INTEGER
);

-- CreateTable
CREATE TABLE "tblinvoicelineitemdetail" (
    "invoiceid" INTEGER NOT NULL,
    "lineitemdetail" TEXT NOT NULL,

    CONSTRAINT "pk_tblinvoicelineitemdetail_980458817" PRIMARY KEY ("invoiceid")
);

-- CreateTable
CREATE TABLE "tblinvoicelineitemdisplay" (
    "displayid" SERIAL NOT NULL,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "description" VARCHAR(1000) DEFAULT '',
    "addtototal" DECIMAL(1,0) DEFAULT 0,
    "showtotal" DECIMAL(1,0) DEFAULT 0,
    "collapseonblank" DECIMAL(1,0) DEFAULT 0,
    "subtractfromtotal" DECIMAL(1,0) DEFAULT 0,
    "invoicedefinitionid" INTEGER,
    "invoiceid" INTEGER,
    "lineitemdefinitionid" INTEGER,
    "showmin" DECIMAL(1,0) DEFAULT 0,
    "showmax" DECIMAL(1,0) DEFAULT 0,
    "cinvoiceid" INTEGER,
    "hidecolumn" DECIMAL(1,0) DEFAULT 0,
    "blankcolumn" DECIMAL(1,0) DEFAULT 0,
    "istaxable" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblinvoiceinsertiondisplayfields_805682018" PRIMARY KEY ("displayid")
);

-- CreateTable
CREATE TABLE "tblinvoicelineitemdisplay_07302025" (
    "displayid" SERIAL NOT NULL,
    "fieldtype" VARCHAR(100),
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "header" VARCHAR(100),
    "sortorder" INTEGER,
    "description" VARCHAR(1000),
    "addtototal" DECIMAL(1,0),
    "showtotal" DECIMAL(1,0),
    "collapseonblank" DECIMAL(1,0),
    "subtractfromtotal" DECIMAL(1,0),
    "invoicedefinitionid" INTEGER,
    "invoiceid" INTEGER,
    "lineitemdefinitionid" INTEGER,
    "showmin" DECIMAL(1,0),
    "showmax" DECIMAL(1,0),
    "cinvoiceid" INTEGER,
    "hidecolumn" DECIMAL(1,0),
    "blankcolumn" DECIMAL(1,0),
    "istaxable" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblinvoicelineitemtype" (
    "lineitemtypeid" SERIAL NOT NULL,
    "type" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblinvoicelineitemtype_1300251737" PRIMARY KEY ("lineitemtypeid")
);

-- CreateTable
CREATE TABLE "tblinvoicepayment" (
    "id" SERIAL NOT NULL,
    "invoiceid" INTEGER,
    "paymentdate" TIMESTAMP(6),
    "amountpaid" DECIMAL(18,4) DEFAULT 0,
    "checknumber" VARCHAR(100) DEFAULT '',
    "paymentmethod" VARCHAR(100) DEFAULT '',
    "enteredbyuserid" INTEGER,
    "gscustomersid" INTEGER,
    "lineitemid" INTEGER,
    "memo" VARCHAR(2000) DEFAULT '',
    "originpaymentid" INTEGER,
    "paymentnumber" VARCHAR(100) DEFAULT '',
    "quickbookspaymentid" VARCHAR(50),
    "editsequence" VARCHAR(16),
    "isrefund" DECIMAL(1,0) DEFAULT 0,
    "createdate" TIMESTAMP(6),

    CONSTRAINT "pk_tblinvoicepayment_1316251794" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblinvoicepayment2contract" (
    "id" SERIAL NOT NULL,
    "invoicepaymentid" INTEGER NOT NULL,
    "contractid" INTEGER NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,
    "barter" DECIMAL(18,2) NOT NULL,
    "prepayrequestid" INTEGER,

    CONSTRAINT "pk_tblinvoicepayment2contract_942118597" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblinvoicepayment2subscription" (
    "id" SERIAL NOT NULL,
    "paymentid" INTEGER NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,

    CONSTRAINT "pk_tblinvoicepayment2subscription_473976965" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblinvoicepayment2zone" (
    "id" SERIAL NOT NULL,
    "invoicepaymentid" INTEGER,
    "zoneid" INTEGER
);

-- CreateTable
CREATE TABLE "tblinvoicepaymentdeleted" (
    "id" INTEGER,
    "invoiceid" INTEGER,
    "paymentdate" TIMESTAMP(6),
    "amountpaid" DECIMAL(19,4),
    "checknumber" VARCHAR(100),
    "paymentmethod" VARCHAR(100),
    "enteredbyuserid" INTEGER,
    "deletedate" TIMESTAMP(6),
    "deletedbyuserid" INTEGER,
    "gscustomersid" INTEGER,
    "lineitemid" INTEGER,
    "memo" VARCHAR(2000),
    "originpaymentid" INTEGER,
    "voiddate" TIMESTAMP(6),
    "paymentnumber" VARCHAR(100) DEFAULT '',
    "isrefund" DECIMAL(1,0) DEFAULT 0,
    "quickbookspaymentid" VARCHAR(50),
    "editsequence" VARCHAR(16),
    "subscriptionid" INTEGER
);

-- CreateTable
CREATE TABLE "tblinvoicepaymentextension" (
    "id" SERIAL NOT NULL,
    "paymentid" INTEGER NOT NULL,
    "pgtransactionid" VARCHAR(200),
    "paidbycustomerid" INTEGER,
    "number" VARCHAR(20),
    "refundpaymentid" INTEGER,
    "refundstatus" VARCHAR(50) DEFAULT 'None',
    "refundmessage" TEXT,
    "refunddate" TIMESTAMP(6),
    "gatewaymerchantid" INTEGER,
    "multicurrencyid" INTEGER,
    "exchangerate" DECIMAL(18,6),
    "paymentstatus" INTEGER,
    "surchargeamount" DECIMAL(18,6),
    "processingfee" DECIMAL(18,6),
    "transactionrefid" BIGINT,

    CONSTRAINT "pk_tblinvoicepaymentextension_1600932975" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblissue" (
    "issueid" SERIAL NOT NULL,
    "issuesetid" INTEGER,
    "issuename" VARCHAR(100) DEFAULT '',
    "issueabbrev" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "defaultreportingmonth" INTEGER DEFAULT 1,
    "defaultreportingday" INTEGER DEFAULT 1,

    CONSTRAINT "pk_tblissue_1374784105" PRIMARY KEY ("issueid")
);

-- CreateTable
CREATE TABLE "tblissueset" (
    "issuesetid" SERIAL NOT NULL,
    "issueset" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblissueset_962102468" PRIMARY KEY ("issuesetid")
);

-- CreateTable
CREATE TABLE "tbljob" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "type" VARCHAR(30) DEFAULT '',
    "createdbyid" INTEGER,
    "createdate" TIMESTAMP(6),
    "letterid" INTEGER,
    "mailinglistid" INTEGER,
    "emailattachment" TEXT DEFAULT '',
    "updatedbyid" INTEGER DEFAULT 0,
    "updatedate" TIMESTAMP(6),
    "fromemail" VARCHAR(100) DEFAULT '',
    "fromname" VARCHAR(100) DEFAULT '',
    "emailsubject" VARCHAR(1000) DEFAULT '',
    "sentcount" INTEGER DEFAULT 0,
    "exceptioncount" INTEGER DEFAULT 0,
    "queuecount" INTEGER DEFAULT 0,
    "cleanupdate" TIMESTAMP(6),
    "cc" VARCHAR(2000) DEFAULT '',
    "bcc" VARCHAR(100) DEFAULT '',
    "mmaccountid" VARCHAR(255),
    "jobuniqueid" UUID,

    CONSTRAINT "pk_tbljob_1661301028" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbljobclickupqueue" (
    "recordid" SERIAL NOT NULL,
    "name" TEXT,
    "description" TEXT,
    "markdowndescription" TEXT,
    "duedate" BIGINT,
    "startdate" BIGINT,
    "customfields" TEXT,
    "createdtime" TIMESTAMP(6) NOT NULL,
    "status" VARCHAR(20) NOT NULL DEFAULT 'Pending',
    "batchid" VARCHAR(50) NOT NULL,

    CONSTRAINT "pk_tbljobclickupqueue_1380460242" PRIMARY KEY ("recordid")
);

-- CreateTable
CREATE TABLE "tbljobdeleted" (
    "id" SERIAL NOT NULL,
    "jobid" INTEGER,
    "deletedbyid" INTEGER,
    "deletedate" TIMESTAMP(6),
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "type" VARCHAR(30) DEFAULT '',
    "createdbyid" INTEGER,
    "createdate" TIMESTAMP(6),
    "letterid" INTEGER,
    "mailinglistid" INTEGER,
    "emailattachment" TEXT DEFAULT '',
    "updatedbyid" INTEGER DEFAULT 0,
    "updatedate" TIMESTAMP(6),
    "fromemail" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tbljobdeleted_1090871003" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbljobdone" (
    "id" SERIAL NOT NULL,
    "jobid" INTEGER,
    "fax" VARCHAR(100) DEFAULT '',
    "email" VARCHAR(100) DEFAULT '',
    "fromemail" VARCHAR(100) DEFAULT '',
    "createdate" TIMESTAMP(6),
    "queuedate" TIMESTAMP(6),
    "gscustomersid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "confirmid" VARCHAR(100) DEFAULT '',
    "filepath" VARCHAR(255) DEFAULT '',
    "invoicenumber" VARCHAR(100) DEFAULT '',
    "emailsubject" VARCHAR(100) DEFAULT '',
    "emailattachment" TEXT DEFAULT '',
    "queueid" INTEGER,
    "invoiceid" INTEGER,
    "proposalid" INTEGER,

    CONSTRAINT "pk_tbljobsent_2061302453" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbljobexception" (
    "id" SERIAL NOT NULL,
    "jobid" INTEGER,
    "description" VARCHAR(5000) DEFAULT '',
    "fax" VARCHAR(100) DEFAULT '',
    "email" VARCHAR(100) DEFAULT '',
    "fromemail" VARCHAR(100) DEFAULT '',
    "createdate" TIMESTAMP(6),
    "gscustomersid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "invoicenumber" VARCHAR(100) DEFAULT '',
    "emailsubject" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tbljobexceptions_1901301883" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbljobfunction" (
    "jobfunctionid" SERIAL NOT NULL,
    "jobfunction" VARCHAR(500),

    CONSTRAINT "pk_tbljobfunction_2138698917" PRIMARY KEY ("jobfunctionid")
);

-- CreateTable
CREATE TABLE "tbljobfunction2employee" (
    "id" SERIAL NOT NULL,
    "jobfunctionid" INTEGER,
    "gsemployeesid" INTEGER
);

-- CreateTable
CREATE TABLE "tbljobqueue" (
    "id" SERIAL NOT NULL,
    "jobid" INTEGER,
    "fax" VARCHAR(100) DEFAULT '',
    "email" VARCHAR(100) DEFAULT '',
    "fromemail" VARCHAR(100) DEFAULT '',
    "createdate" TIMESTAMP(6),
    "gscustomersid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "invoicenumber" VARCHAR(100) DEFAULT '',
    "emailsubject" VARCHAR(100) DEFAULT '',
    "invoiceid" INTEGER,
    "contractid" INTEGER,
    "ccemail" VARCHAR(2000),
    "bccemail" VARCHAR(100),
    "proposalid" INTEGER,
    "payload" TEXT,

    CONSTRAINT "pk_tbljobqueue_1757301370" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbllabelmst" (
    "labelid" SERIAL NOT NULL,
    "subproducttypeid" INTEGER NOT NULL,
    "labelcode" VARCHAR(150),
    "labelvalue" VARCHAR(500),
    "labelpluralvalue" VARCHAR(500),

    CONSTRAINT "pk_tbllabelmst_160159766" PRIMARY KEY ("labelid")
);

-- CreateTable
CREATE TABLE "tbllabelmst_backup_dev33377" (
    "labelid" SERIAL NOT NULL,
    "subproducttypeid" INTEGER NOT NULL,
    "labelcode" VARCHAR(150),
    "labelvalue" VARCHAR(500),
    "labelpluralvalue" VARCHAR(500)
);

-- CreateTable
CREATE TABLE "tbllinktypes" (
    "id" SERIAL NOT NULL,
    "type" VARCHAR(50),
    "name" VARCHAR(50),
    "starttag" VARCHAR(500),
    "endtag" VARCHAR(50),
    "numberformat" VARCHAR(500),

    CONSTRAINT "pk__tbllinkt__3214ec277f592dbd" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbllogins" (
    "id" SERIAL NOT NULL,
    "userid" VARCHAR(255),
    "guid" VARCHAR(255),
    "datecreated" TIMESTAMP(6),
    "datemodified" TIMESTAMP(6),
    "ip" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblloginsended" (
    "id" SERIAL NOT NULL,
    "userid" VARCHAR(255),
    "datesessionended" TIMESTAMP(6),
    "yourguid" VARCHAR(255),
    "theirguid" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "tblmagazineissue" (
    "id" SERIAL NOT NULL,
    "magazineid" INTEGER,
    "issueid" INTEGER,
    "issueyear" INTEGER,
    "issuemonth" INTEGER DEFAULT 0,
    "issueday" INTEGER DEFAULT 0,
    "volume" INTEGER DEFAULT 0,
    "number" INTEGER DEFAULT 0,
    "toprinterdate" TIMESTAMP(6),
    "proofdate" TIMESTAMP(6),
    "fromprinterdate" TIMESTAMP(6),
    "contentduedate" TIMESTAMP(6),
    "onsaledate" TIMESTAMP(6),
    "pagesperpound" INTEGER DEFAULT 0,
    "costunder1pound" DECIMAL(19,4) DEFAULT 0,
    "costover1pound" DECIMAL(19,4) DEFAULT 0,
    "printquantity" INTEGER DEFAULT 0,
    "reservationdate" TIMESTAMP(6),
    "mailinglistclosedate" TIMESTAMP(6),
    "accountingclosedate" TIMESTAMP(6),

    CONSTRAINT "pk_tblmagazineissue_978102525" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmagazines" (
    "id" SERIAL NOT NULL,
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "name" VARCHAR(50) NOT NULL DEFAULT '',
    "costoverlb" DOUBLE PRECISION,
    "costunderlb" DOUBLE PRECISION,
    "pagesoverlb" DOUBLE PRECISION,
    "issuesetid" INTEGER,
    "scheduleenddate" VARCHAR(100) DEFAULT '<font color=red>Not Defined</font>',
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "allowcomps" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk_tblmagazines_994102582" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmagfrequency" (
    "id" SERIAL NOT NULL,
    "issuename" VARCHAR(100) NOT NULL,
    "issuemonth" INTEGER NOT NULL,
    "pgsatlb" INTEGER,
    "costbelowlb" DOUBLE PRECISION,
    "costabovelb" DOUBLE PRECISION,
    "issueset" INTEGER DEFAULT 1,
    "sortorder" INTEGER NOT NULL,
    "issueid" INTEGER,
    "issueyear" INTEGER,
    "issuedate" TIMESTAMP(6),
    "issueabbrev" VARCHAR(100),
    "oldissuedate" TIMESTAMP(6),

    CONSTRAINT "pk_tblmagfrequency_1069403029" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmagfrequencyissueset" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "recurrencetype" VARCHAR(255) NOT NULL,

    CONSTRAINT "pk_tblmagfrequencyissueset_23775242" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmainmenu" (
    "id" SERIAL NOT NULL,
    "description" VARCHAR(100),
    "parent_id" INTEGER,
    "caption" VARCHAR(100),

    CONSTRAINT "pk_tblmainmenu_1010102639" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmasterlist" (
    "id" INTEGER NOT NULL,
    "name" VARCHAR(100),
    "ischeckduplicate" DECIMAL(1,0),
    "getspname" VARCHAR(100),
    "savespname" VARCHAR(100),
    "deletespname" VARCHAR(100),
    "type" VARCHAR(50),
    "maxlength" INTEGER,
    "iscolorapplicable" DECIMAL(1,0),
    "isdescriptionapplicable" DECIMAL(1,0),

    CONSTRAINT "pk_tblmasterlist_2124742822" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmastertemplates" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "jsontext" TEXT NOT NULL,
    "thumbnailimage" TEXT NOT NULL,
    "category" INTEGER DEFAULT -1,

    CONSTRAINT "pk__tblmaste__3214ec075f1746b4" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmenu" (
    "menuid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "siteid" INTEGER DEFAULT 0,
    "name" VARCHAR(100) DEFAULT '',
    "url" VARCHAR(255) DEFAULT '',
    "isadmin" DECIMAL(1,0) DEFAULT 0,
    "sortorder" INTEGER DEFAULT 0,
    "parentid" INTEGER DEFAULT 0,
    "isvisible" DECIMAL(1,0) DEFAULT 1,
    "imagepath" VARCHAR(255) DEFAULT '',
    "itemwidth" INTEGER DEFAULT 0,

    CONSTRAINT "pk_tblmenu_1026102696" PRIMARY KEY ("menuid")
);

-- CreateTable
CREATE TABLE "tblmkmdataonetimesyncstatus" (
    "id" SERIAL NOT NULL,
    "synctype" VARCHAR(100),
    "issync" DECIMAL(1,0),
    "syndate" TIMESTAMP(6),
    "maxnumber" INTEGER
);

-- CreateTable
CREATE TABLE "tblmkmworkflows" (
    "id" INTEGER NOT NULL,
    "workflow" TEXT,

    CONSTRAINT "pk_tblmkmworkflows_1516076687" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmonths" (
    "intmonth" INTEGER,
    "monthname" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "tblmulticurrencies" (
    "currencyid" SERIAL NOT NULL,
    "code" VARCHAR(3) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "culture" VARCHAR(50),
    "style" VARCHAR(50),
    "countries" TEXT,
    "currencyformat" VARCHAR(20),

    CONSTRAINT "pk_tblmulticurrencies_1475028536" PRIMARY KEY ("currencyid")
);

-- CreateTable
CREATE TABLE "tblmulticurrencies_dev_30152" (
    "currencyid" SERIAL NOT NULL,
    "code" VARCHAR(3) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "culture" VARCHAR(50),
    "style" VARCHAR(50),
    "countries" TEXT
);

-- CreateTable
CREATE TABLE "tblmulticurrency2production" (
    "id" SERIAL NOT NULL,
    "multicurrencyid" INTEGER NOT NULL,
    "orderid" INTEGER,
    "insertionid" INTEGER,
    "paymentplanid" INTEGER,
    "exchangerate" DECIMAL(18,6) NOT NULL,

    CONSTRAINT "pk_tblmulticurrency2production_1507028650" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblmulticurrencyautoexchangerate" (
    "currencyid" INTEGER NOT NULL,
    "exchangerate" DECIMAL(18,6) NOT NULL,
    "updatedon" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "pk_tblmulticurrencyautoexchangerate_1539028764" PRIMARY KEY ("currencyid")
);

-- CreateTable
CREATE TABLE "tblmulticurrencyexchangeratehistory" (
    "exchangerateid" SERIAL NOT NULL,
    "exchangerate" DECIMAL(18,6) NOT NULL,
    "startdate" TIMESTAMP(6) NOT NULL,
    "enddate" TIMESTAMP(6),
    "multicurrencyid" INTEGER NOT NULL,
    "createdby" INTEGER NOT NULL,
    "updatedon" TIMESTAMP(6),

    CONSTRAINT "pk_tblmulticurrencyexchangeratehistory_1571028878" PRIMARY KEY ("exchangerateid")
);

-- CreateTable
CREATE TABLE "tblmulticurrencysetup" (
    "multicurrencyid" SERIAL NOT NULL,
    "currencyid" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0) NOT NULL,
    "isautoupdate" DECIMAL(1,0) NOT NULL,
    "exchangerate" DECIMAL(18,6),
    "paymentgatewayid" INTEGER,
    "isenabled" DECIMAL(1,0) NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL,
    "createdby" INTEGER NOT NULL,
    "updateddate" TIMESTAMP(6),
    "updatedby" INTEGER,

    CONSTRAINT "pk_tblmulticurrencysetup_1603028992" PRIMARY KEY ("multicurrencyid")
);

-- CreateTable
CREATE TABLE "tblnavbar" (
    "description" VARCHAR(100) DEFAULT '',
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100) DEFAULT '',
    "url" VARCHAR(255) DEFAULT '',
    "admin" DECIMAL(1,0) DEFAULT 0,
    "sortorder" INTEGER DEFAULT -1,
    "imagepath" VARCHAR(255) DEFAULT '',
    "newwindow" DECIMAL(1,0) DEFAULT 0,
    "visible" DECIMAL(1,0) DEFAULT 1,
    "icon" VARCHAR(100) DEFAULT '',
    "tooltip" VARCHAR(500) DEFAULT '',
    "navbartypeid" INTEGER DEFAULT 0,
    "accesslevel" VARCHAR(30) DEFAULT 'All',
    "movelevel" VARCHAR(30) DEFAULT 'All',
    "urlsource" VARCHAR(20) DEFAULT 'TMM',

    CONSTRAINT "pk_tblnavbar_914154352" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblnavbar2department" (
    "id" SERIAL NOT NULL,
    "navbarid" INTEGER,
    "departmentid" INTEGER
);

-- CreateTable
CREATE TABLE "tblnavbar2user" (
    "id" SERIAL NOT NULL,
    "navbarid" INTEGER,
    "gsemployeesid" INTEGER
);

-- CreateTable
CREATE TABLE "tblnavbar2user_beforeproposednavupdate" (
    "id" SERIAL NOT NULL,
    "navbarid" INTEGER,
    "gsemployeesid" INTEGER
);

-- CreateTable
CREATE TABLE "tblnavbar_backup_30089" (
    "description" VARCHAR(100),
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100),
    "url" VARCHAR(255),
    "admin" DECIMAL(1,0),
    "sortorder" INTEGER,
    "imagepath" VARCHAR(255),
    "newwindow" DECIMAL(1,0),
    "visible" DECIMAL(1,0),
    "icon" VARCHAR(100),
    "tooltip" VARCHAR(500),
    "navbartypeid" INTEGER,
    "accesslevel" VARCHAR(30),
    "movelevel" VARCHAR(30),
    "urlsource" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "tblnavbar_beforeproposednavupdate" (
    "description" VARCHAR(100),
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100),
    "url" VARCHAR(255),
    "admin" DECIMAL(1,0),
    "sortorder" INTEGER,
    "imagepath" VARCHAR(255),
    "newwindow" DECIMAL(1,0),
    "visible" DECIMAL(1,0),
    "icon" VARCHAR(100),
    "tooltip" VARCHAR(500),
    "navbartypeid" INTEGER,
    "accesslevel" VARCHAR(30),
    "movelevel" VARCHAR(30),
    "urlsource" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "tblnavbar_beforeresetid" (
    "description" VARCHAR(100),
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100),
    "url" VARCHAR(255),
    "admin" DECIMAL(1,0),
    "sortorder" INTEGER,
    "imagepath" VARCHAR(255),
    "newwindow" DECIMAL(1,0),
    "visible" DECIMAL(1,0),
    "icon" VARCHAR(100),
    "tooltip" VARCHAR(500),
    "navbartypeid" INTEGER,
    "accesslevel" VARCHAR(30),
    "movelevel" VARCHAR(30),
    "urlsource" VARCHAR(20),
    "new_id" INTEGER,
    "new_parentid" INTEGER
);

-- CreateTable
CREATE TABLE "tblnavbar_dev31731" (
    "description" VARCHAR(100),
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100),
    "url" VARCHAR(255),
    "admin" DECIMAL(1,0),
    "sortorder" INTEGER,
    "imagepath" VARCHAR(255),
    "newwindow" DECIMAL(1,0),
    "visible" DECIMAL(1,0),
    "icon" VARCHAR(100),
    "tooltip" VARCHAR(500),
    "navbartypeid" INTEGER,
    "accesslevel" VARCHAR(30),
    "movelevel" VARCHAR(30),
    "urlsource" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "tblnavbar_dev_29132" (
    "description" VARCHAR(100),
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100),
    "url" VARCHAR(255),
    "admin" DECIMAL(1,0),
    "sortorder" INTEGER,
    "imagepath" VARCHAR(255),
    "newwindow" DECIMAL(1,0),
    "visible" DECIMAL(1,0),
    "icon" VARCHAR(100),
    "tooltip" VARCHAR(500),
    "navbartypeid" INTEGER,
    "accesslevel" VARCHAR(30),
    "movelevel" VARCHAR(30),
    "urlsource" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "tblnavbar_dev_29966" (
    "description" VARCHAR(100),
    "id" SERIAL NOT NULL,
    "parent_id" INTEGER,
    "caption" VARCHAR(100),
    "url" VARCHAR(255),
    "admin" DECIMAL(1,0),
    "sortorder" INTEGER,
    "imagepath" VARCHAR(255),
    "newwindow" DECIMAL(1,0),
    "visible" DECIMAL(1,0),
    "icon" VARCHAR(100),
    "tooltip" VARCHAR(500),
    "navbartypeid" INTEGER,
    "accesslevel" VARCHAR(30),
    "movelevel" VARCHAR(30),
    "urlsource" VARCHAR(20)
);

-- CreateTable
CREATE TABLE "tblnavbarclicklog" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER,
    "url" TEXT,
    "clickdate" TIMESTAMP(6),
    "machinename" VARCHAR(50),
    "fromcustomerportal" INTEGER
);

-- CreateTable
CREATE TABLE "tblopenaiconfig" (
    "id" SERIAL NOT NULL,
    "pagename" VARCHAR(100),
    "prompt" VARCHAR(100),
    "promptquery" TEXT,
    "category" VARCHAR(200),
    "parentid" INTEGER,
    "temperature" DOUBLE PRECISION,
    "icon" VARCHAR(200),
    "styles" TEXT,
    "templateprompt" TEXT
);

-- CreateTable
CREATE TABLE "tblopportunity2businessunit" (
    "businessunitid" INTEGER,
    "oppid" INTEGER
);

-- CreateTable
CREATE TABLE "tblopportunity2product" (
    "productid" INTEGER,
    "oppid" INTEGER
);

-- CreateTable
CREATE TABLE "tblopportunity2usercolumnview" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER,
    "nameofview" VARCHAR(100),
    "columnsvisiblecriteria" TEXT,
    "dbquerycolumns" TEXT,
    "isdefault" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblopportunityhistory" (
    "id" SERIAL NOT NULL,
    "opportunityid" INTEGER,
    "opportunityfield" VARCHAR(100),
    "oldvalue" TEXT,
    "newvalue" TEXT,
    "updatedby" VARCHAR(250),
    "updatedon" TIMESTAMP(6),

    CONSTRAINT "pk__tbloppor__3214ec0713ea364f" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblopportunitylossreason" (
    "id" SERIAL NOT NULL,
    "lossreason" VARCHAR(250),
    "bysystem" DECIMAL(1,0),
    "sortorder" INTEGER,

    CONSTRAINT "pk__tbloppor__3214ec0717bac733" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblopportunitysql" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(200),
    "createdate" TIMESTAMP(6),
    "includeids" TEXT,
    "wheresql" TEXT,
    "isdefault" DECIMAL(1,0),
    "createdbyid" INTEGER,
    "listtype" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblopportunitystagemapping" (
    "id" SERIAL NOT NULL,
    "opportunityid" INTEGER NOT NULL,
    "stageid" INTEGER NOT NULL,
    "previousstageid" INTEGER,
    "userid" INTEGER,
    "date" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "pk__tbloppor__3214ec07e6291aa6" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblopportunitytypes" (
    "id" SERIAL NOT NULL,
    "opptype" VARCHAR(150),

    CONSTRAINT "pk__tbloppor__3214ec071b8b5817" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblorderadunittargetmapping" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER DEFAULT -1,
    "adunitid" BIGINT NOT NULL,
    "proposalinsertionid" INTEGER DEFAULT -1,
    "isincluded" DECIMAL(1,0) NOT NULL,

    CONSTRAINT "pk__tblorder__3214ec07866ef606" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblordercolormapping" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER NOT NULL,
    "colorid" INTEGER NOT NULL,
    "proposalinsertionid" INTEGER DEFAULT -1,

    CONSTRAINT "pk__tblorder__3214ec078f5a02cc" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblorderpositionmapping" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER NOT NULL,
    "positionid" INTEGER NOT NULL,
    "proposalinsertionid" INTEGER DEFAULT -1,

    CONSTRAINT "pk__tblorder__3214ec076a239c1c" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblorderupdatecolumns" (
    "id" INTEGER NOT NULL,
    "fieldname" VARCHAR(1000) NOT NULL,
    "inputtype" VARCHAR(100) NOT NULL,
    "datatype" VARCHAR(100) NOT NULL,
    "hasdbscript" DECIMAL(1,0),
    "inputvalue" VARCHAR(1000),
    "getscript" VARCHAR(1000),
    "updatescript" VARCHAR(1000),
    "parentid" INTEGER,
    "updatetable" VARCHAR(100),
    "updatecolumn" VARCHAR(100),
    "parameters" VARCHAR(500),
    "displaymessage" TEXT,
    "producttype" INTEGER,

    CONSTRAINT "pk__tblorder__3214ec0702bfaa4d" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaadunitparentmapping" (
    "id" INTEGER NOT NULL,
    "adunitparentid" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "tblpaadunitparentmst" (
    "id" SERIAL NOT NULL,
    "parentid" VARCHAR(500) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "adunitcode" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk__tblpaadu__3214ec076c75d040" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaadunits" (
    "id" SERIAL NOT NULL,
    "adunitid" VARCHAR(500),
    "parentid" VARCHAR(500),
    "parentpath" INTEGER,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "status" SMALLINT NOT NULL DEFAULT 0,
    "adunitcode" VARCHAR(100) NOT NULL,
    "adunitsizes" INTEGER,
    "smartsizemode" SMALLINT NOT NULL DEFAULT 1,

    CONSTRAINT "pk__tblpaadu__3214ec070c94cfde" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaadunitsizemapping" (
    "id" INTEGER NOT NULL,
    "adunitsizeid" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "tblpaadunitsizemst" (
    "id" SERIAL NOT NULL,
    "width" INTEGER NOT NULL,
    "height" INTEGER NOT NULL,
    "isaspectratio" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "environmenttype" SMALLINT NOT NULL DEFAULT 0,
    "fulldisplaystring" VARCHAR(200) NOT NULL,
    "isaudio" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk__tblpaadu__3214ec07b7a6bba6" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaadunitsmartsizemodeenum" (
    "id" SERIAL NOT NULL,
    "enumerationid" SMALLINT NOT NULL,
    "enumeration" VARCHAR(50) NOT NULL,
    "description" TEXT,

    CONSTRAINT "pk__tblpaadu__8cc0b7425fe52a3f" PRIMARY KEY ("enumerationid")
);

-- CreateTable
CREATE TABLE "tblpaappliedlabelmst" (
    "id" SERIAL NOT NULL,
    "labelid" BIGINT NOT NULL,
    "isnegated" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk__tblpaapp__3214ec07a622e8f1" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpabillingconfig" (
    "id" SERIAL NOT NULL,
    "containerid" INTEGER,
    "billtype" VARCHAR(200),
    "billvalue" VARCHAR(200),
    "billingdataoptions" VARCHAR(200),
    "lineitembilling" VARCHAR(200),
    "billingday" VARCHAR(10),
    "finalbill" VARCHAR(200),
    "enddatetime" VARCHAR(10),
    "exceedgoal" VARCHAR(200),
    "billingmethod" VARCHAR(50),
    "billingavailability" VARCHAR(50),
    "isdefault" INTEGER,
    "campaignid" INTEGER,

    CONSTRAINT "pk__tblpabil__3214ec0704a86558" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpacosttypeenum" (
    "id" SERIAL NOT NULL,
    "enumerationid" SMALLINT NOT NULL,
    "enumeration" VARCHAR(50) NOT NULL,
    "description" TEXT,

    CONSTRAINT "pk__tblpacos__8cc0b7425b53b7db" PRIMARY KEY ("enumerationid")
);

-- CreateTable
CREATE TABLE "tblpacreatives" (
    "id" SERIAL NOT NULL,
    "advertiserid" BIGINT,
    "creativeid" BIGINT,
    "name" TEXT,
    "expectedwidth" INTEGER,
    "expectedheight" INTEGER,
    "expectedisaspectratio" DECIMAL(1,0),
    "previewurl" TEXT,
    "lastmodifieddate" TIMESTAMP(6),
    "destinationurl" TEXT,
    "destinationurltype" VARCHAR(1000),
    "overridesize" DECIMAL(1,0),
    "assetid" BIGINT,
    "filename" TEXT,
    "filesize" BIGINT,
    "asseturl" TEXT,
    "creativewidth" INTEGER,
    "creativeheight" INTEGER,
    "creativeisaspectratio" DECIMAL(1,0),
    "imagedensity" VARCHAR(1000),
    "digitaladstype" VARCHAR(15) NOT NULL DEFAULT 'GoogleAd',
    "base64imagedata" TEXT,
    "htmltext" TEXT,

    CONSTRAINT "pk__tblpacre__3214ec078db246f6" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpacustomfielddatalineitem" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER
);

-- CreateTable
CREATE TABLE "tblpacustomfielddataorder" (
    "id" SERIAL NOT NULL,
    "containerid" INTEGER
);

-- CreateTable
CREATE TABLE "tblpadetailsmapping" (
    "id" SERIAL NOT NULL,
    "mmid" INTEGER,
    "paid" BIGINT,
    "Table" VARCHAR(200),
    "type" VARCHAR(200),
    "createddate" TIMESTAMP(6),
    "updateddate" TIMESTAMP(6),
    "digitaladstype" VARCHAR(20) NOT NULL DEFAULT 'GoogleAd',

    CONSTRAINT "pk__tblpadet__3214ec27f2252ac1" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpadetailssynchistory" (
    "id" SERIAL NOT NULL,
    "newjson" TEXT,
    "oldjson" TEXT,
    "createddate" TIMESTAMP(6),
    "errortext" TEXT,
    "status" VARCHAR(200),
    "enddate" TIMESTAMP(6),
    "backgroundruntime" BIGINT,
    "actiontype" VARCHAR(50),
    "ordertype" VARCHAR(50),
    "orderid" BIGINT,
    "page" VARCHAR(200),

    CONSTRAINT "pk__tblpadet__3214ec07b3773179" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaenvironmenttypeenum" (
    "id" SERIAL NOT NULL,
    "enumerationid" SMALLINT NOT NULL,
    "enumeration" VARCHAR(50) NOT NULL,
    "description" TEXT,

    CONSTRAINT "pk__tblpaenv__8cc0b742e48f2af4" PRIMARY KEY ("enumerationid")
);

-- CreateTable
CREATE TABLE "tblpagetype2usercolumnview" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER,
    "nameofview" VARCHAR(100),
    "columnsvisiblecriteria" TEXT,
    "dbquerycolumns" TEXT,
    "isdefault" DECIMAL(1,0),
    "pagetype" INTEGER DEFAULT 1,
    "fieldids" TEXT,
    "customfieldids" TEXT,
    "standardviewid" INTEGER,
    "viewtype" INTEGER,
    "createdby" INTEGER,
    "producttype" INTEGER,

    CONSTRAINT "pk_tblpagetype2usercolumnview_521977136" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpagetype2usercolumnview_backup_dev33377" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER,
    "nameofview" VARCHAR(100),
    "columnsvisiblecriteria" TEXT,
    "dbquerycolumns" TEXT,
    "isdefault" DECIMAL(1,0),
    "pagetype" INTEGER,
    "fieldids" TEXT,
    "customfieldids" TEXT,
    "standardviewid" INTEGER,
    "viewtype" INTEGER,
    "createdby" INTEGER,
    "producttype" INTEGER
);

-- CreateTable
CREATE TABLE "tblpainventorystatusenum" (
    "id" SERIAL NOT NULL,
    "enumerationid" SMALLINT NOT NULL,
    "enumeration" VARCHAR(50) NOT NULL,
    "description" TEXT,

    CONSTRAINT "pk__tblpainv__8cc0b74268359bd3" PRIMARY KEY ("enumerationid")
);

-- CreateTable
CREATE TABLE "tblpalineitemimpressionshistory" (
    "lineitemid" INTEGER NOT NULL,
    "impressionsactual" INTEGER NOT NULL,
    "qtyactual" INTEGER NOT NULL,
    "createddate" TIMESTAMP(6) DEFAULT clock_timestamp()
);

-- CreateTable
CREATE TABLE "tblpalineitemtypeenum" (
    "id" SERIAL NOT NULL,
    "enumerationid" SMALLINT NOT NULL,
    "enumeration" VARCHAR(50) NOT NULL,
    "description" TEXT,

    CONSTRAINT "pk__tblpalin__8cc0b742d00b709c" PRIMARY KEY ("enumerationid")
);

-- CreateTable
CREATE TABLE "tblpanativeadformat" (
    "id" SERIAL NOT NULL,
    "nativeadid" BIGINT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "pk__tblpanat__3214ec076e0762ef" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaordercontainer" (
    "containerid" SERIAL NOT NULL,
    "programmaticorderid" BIGINT,
    "ordername" VARCHAR(255) NOT NULL,
    "startdatetime" TIMESTAMP(6),
    "enddatetime" TIMESTAMP(6),
    "unlimitedenddatetime" DECIMAL(1,0) DEFAULT 0,
    "programmaticorderstatus" SMALLINT NOT NULL,
    "isarchived" DECIMAL(1,0) DEFAULT 0,
    "purchaseordernumber" VARCHAR(63),
    "totalimpressionsdelivered" BIGINT,
    "totalclicksdelivered" BIGINT,
    "totalviewableimpressionsdelivered" BIGINT,
    "lastmodifiedbyapp" VARCHAR(1000),
    "isprogrammatic" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "lastmodifieddatetime" TIMESTAMP(6),
    "creatorid" BIGINT,
    "salespersonid" BIGINT,
    "secondarysalespersonids" VARCHAR(5000),
    "primarytrafficker" INTEGER NOT NULL,
    "secondarytraffickers" VARCHAR(5000),
    "notes" VARCHAR(5000),
    "currencycode" VARCHAR(10),
    "advertiserid" BIGINT,
    "advertisercontactids" VARCHAR(1000),
    "agencyid" BIGINT,
    "agencycontactids" VARCHAR(1000),
    "totalbudget" DOUBLE PRECISION,
    "customerid" INTEGER,
    "proposalid" INTEGER,
    "lastsyncdate" TIMESTAMP(6),
    "billingcontact" INTEGER,

    CONSTRAINT "pk__tblpaord__037960bbc813dad8" PRIMARY KEY ("containerid")
);

-- CreateTable
CREATE TABLE "tblpaorderstatusenum" (
    "id" SERIAL NOT NULL,
    "enumerationid" SMALLINT NOT NULL,
    "orderstatus" VARCHAR(50) NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "pk__tblpaord__8cc0b742f6b19efb" PRIMARY KEY ("enumerationid")
);

-- CreateTable
CREATE TABLE "tblpappinstallmentimpressions" (
    "id" SERIAL NOT NULL,
    "lineitemid" INTEGER,
    "price" DECIMAL(18,2),
    "impressions" INTEGER,
    "qty" INTEGER,
    "date" TIMESTAMP(6),
    "installmentid" INTEGER,
    "imprate" DECIMAL(18,2),
    "qtyrate" DECIMAL(18,2),

    CONSTRAINT "pk__tblpappi__3214ec078acb7303" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblparent2customer" (
    "id" SERIAL NOT NULL,
    "parentid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,

    CONSTRAINT "pk_parent2customer_1593316986" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentgateway" (
    "id" INTEGER NOT NULL,
    "gatewayname" VARCHAR(30) NOT NULL,
    "gatewaytype" VARCHAR(20) NOT NULL,
    "apiurl" VARCHAR(100) NOT NULL,
    "actionurl" VARCHAR(100) NOT NULL,
    "responseurl" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_tblpaymentgateway_1635029106" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentgateway2customer" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "stripecustomerid" TEXT NOT NULL,
    "gatewaymerchantid" INTEGER NOT NULL,
    "cardconnectecomind" VARCHAR(10),

    CONSTRAINT "pk_tblpaymentgateway2customer_244456195" PRIMARY KEY ("customerid","gatewaymerchantid")
);

-- CreateTable
CREATE TABLE "tblpaymentgateway2refmapping" (
    "gatewaymerchantid" INTEGER NOT NULL,
    "multicurrencyid" INTEGER,
    "ratecardids" TEXT,
    "chargebriteplanids" TEXT,

    CONSTRAINT "pk_tblpaymentgateway2refmapping_1667029220" PRIMARY KEY ("gatewaymerchantid")
);

-- CreateTable
CREATE TABLE "tblpaymentgatewayconnect" (
    "id" SERIAL NOT NULL,
    "gatewayid" INTEGER NOT NULL,
    "loginid" TEXT NOT NULL,
    "passwordkey" TEXT NOT NULL,
    "clientid" VARCHAR(200) NOT NULL,

    CONSTRAINT "pk_tblpaymentgatewayconnect_1460460527" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentgatewaymerchant" (
    "id" SERIAL NOT NULL,
    "gatewayid" INTEGER NOT NULL,
    "merchantid" VARCHAR(100),
    "loginid" TEXT NOT NULL,
    "passwordkey" TEXT NOT NULL,
    "isdefault" DECIMAL(1,0) NOT NULL,
    "iscvvrequired" DECIMAL(1,0) NOT NULL,
    "status" DECIMAL(1,0) NOT NULL,
    "webhooksecretkey" VARCHAR(500),
    "webhookeventid" VARCHAR(500),
    "gatewaydescription" VARCHAR(100),
    "paymenttype" INTEGER,
    "processingfee" DECIMAL(18,6),
    "isprocessingfeepercentage" DECIMAL(1,0),
    "verificationkey" TEXT,
    "accountid" TEXT,
    "accountname" TEXT,

    CONSTRAINT "pk_tblpaymentgatewaymerchant_1699029334" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentgatewaymerchant_enkeychange" (
    "id" SERIAL NOT NULL,
    "gatewayid" INTEGER NOT NULL,
    "merchantid" VARCHAR(100),
    "loginid" TEXT NOT NULL,
    "passwordkey" TEXT NOT NULL,
    "isdefault" DECIMAL(1,0) NOT NULL,
    "iscvvrequired" DECIMAL(1,0) NOT NULL,
    "status" DECIMAL(1,0) NOT NULL,
    "webhooksecretkey" VARCHAR(500),
    "webhookeventid" VARCHAR(500),
    "gatewaydescription" VARCHAR(100),
    "paymenttype" INTEGER,
    "processingfee" DECIMAL(18,6),
    "isprocessingfeepercentage" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblpaymentgatewaypaymentslog" (
    "id" SERIAL NOT NULL,
    "loginuserid" INTEGER,
    "customerid" INTEGER,
    "transactionrefid" BIGINT,
    "invoicepaymentid" TEXT,
    "paymentgatewaytype" VARCHAR(20),
    "paymentamount" DECIMAL(18,2),
    "initiateddate" TIMESTAMP(6),
    "paymentstatus" VARCHAR(20),
    "ispaymentwithprofile" DECIMAL(1,0),
    "paymentsource" VARCHAR(10),
    "paymentrequest" TEXT,
    "paymentresponse" TEXT,
    "updatedate" TIMESTAMP(6),
    "transactiondata" TEXT,
    "customerip" VARCHAR(50),
    "requesttype" VARCHAR(50),
    "gatewaymerchantid" INTEGER,

    CONSTRAINT "pk_tblpaymentgatewaypaymentslog_1962646235" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentgatewaytransaction" (
    "id" SERIAL NOT NULL,
    "transactionrefid" BIGINT NOT NULL,
    "carddetails" VARCHAR(150),
    "pgtransactionid" VARCHAR(50),
    "authcode" VARCHAR(20),
    "response" VARCHAR(20),
    "customerid" INTEGER,
    "paymentto" TEXT,
    "transactionamount" DECIMAL(18,2),
    "transactiondate" TIMESTAMP(6),
    "paymentstatus" INTEGER,
    "paymentrequesttype" INTEGER,
    "profilestatus" VARCHAR(50),
    "errormessage" TEXT,
    "gatewaytype" VARCHAR(50),
    "paymentsource" INTEGER,

    CONSTRAINT "pk_tblpaymentgatewaytransaction_436456879" PRIMARY KEY ("id","transactionrefid")
);

-- CreateTable
CREATE TABLE "tblpaymentmethods" (
    "id" SERIAL NOT NULL,
    "paymentmethod" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblpaymentplan" (
    "id" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "proposalid" INTEGER NOT NULL,
    "templateid" INTEGER,
    "actualtotal" DECIMAL(19,4),
    "installmenttotal" DECIMAL(19,4) DEFAULT 0,
    "number" VARCHAR(100),
    "calculationreftemplateid" INTEGER,
    "status" VARCHAR(20),
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedby" INTEGER NOT NULL,
    "updatedon" TIMESTAMP(6) NOT NULL,
    "containerid" INTEGER,
    "campaignid" INTEGER,

    CONSTRAINT "pk_tblpaymentplan_1927886135" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentplan2item" (
    "id" SERIAL NOT NULL,
    "paymentplanid" INTEGER NOT NULL,
    "orderid" INTEGER,
    "invoiceid" INTEGER,
    "ordermappedon" TIMESTAMP(6) NOT NULL,
    "ordermappedby" INTEGER,

    CONSTRAINT "pk_tblpaymentplan2item_1959886249" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentplan2payment" (
    "id" SERIAL NOT NULL,
    "paymentplanid" INTEGER NOT NULL,
    "installmentid" INTEGER,
    "paymentid" INTEGER NOT NULL,
    "amount" DECIMAL(19,4) NOT NULL,

    CONSTRAINT "pk_tblpaymentplan2payment_1991886363" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentplaninstallment" (
    "id" SERIAL NOT NULL,
    "paymentplanid" INTEGER NOT NULL,
    "number" VARCHAR(100),
    "billtoid" INTEGER,
    "amount" DECIMAL(18,6) NOT NULL,
    "installmentdate" TIMESTAMP(6),
    "duedate" TIMESTAMP(6),
    "upperhtml" TEXT,
    "lowerhtml" TEXT,
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isshowpaymentplan" DECIMAL(1,0) DEFAULT 0,
    "createdby" INTEGER,
    "createdon" TIMESTAMP(6),
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "impressions" INTEGER,
    "clicks" INTEGER,

    CONSTRAINT "pk_tblpaymentplaninstallment_1427028365" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentplaninstallmentdefinition" (
    "id" SERIAL NOT NULL,
    "description" VARCHAR(1000),
    "isdefault" DECIMAL(1,0),
    "upperhtml" TEXT,
    "lowerhtml" TEXT,
    "showtotal" DECIMAL(1,0),
    "totaltext" TEXT,
    "saeditonly" DECIMAL(1,0) DEFAULT 0,
    "active" DECIMAL(1,0) DEFAULT 1,
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "thumbnailimage" TEXT,
    "isshowpaymentplan" DECIMAL(1,0) DEFAULT 0,
    "createdby" INTEGER,
    "createdon" TIMESTAMP(6),
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),

    CONSTRAINT "pk_tblpaymentplaninstallmentdefinition_2055886591" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpaymentplanlineitemdefinition" (
    "lineitemdefinitionid" BIGSERIAL NOT NULL,
    "paymentplanid" INTEGER,
    "definitionid" INTEGER,

    CONSTRAINT "pk_tblpaymentplanlineitemdefinition_982502779" PRIMARY KEY ("lineitemdefinitionid")
);

-- CreateTable
CREATE TABLE "tblpaymentplanlineitemdisplay" (
    "id" BIGSERIAL NOT NULL,
    "lineitemdefinitionid" BIGINT,
    "customfieldid" INTEGER,
    "header" VARCHAR(100) NOT NULL,
    "sortorder" INTEGER,
    "iscollapseonblank" DECIMAL(1,0),
    "ishide" DECIMAL(1,0) DEFAULT 0,
    "isblank" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblpaymentplanlineitemdisplay_1014502893" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblperson2company" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "personid" INTEGER NOT NULL,
    "companyid" INTEGER NOT NULL,
    "iscontact" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblperson2company_1042102753" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblperson2department" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "personid" INTEGER NOT NULL,
    "departmentid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblperson2department_1474104292" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblperson2group" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "personid" INTEGER NOT NULL,
    "groupid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblperson2group_1490104349" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblperson2rsvpevent" (
    "id" SERIAL NOT NULL,
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "confirmdate" TIMESTAMP(6),
    "personid" INTEGER NOT NULL,
    "rsvpeventid" INTEGER NOT NULL,
    "confirmed" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "guests" INTEGER NOT NULL DEFAULT 0,
    "reminder" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "comments" VARCHAR(300) NOT NULL DEFAULT '',

    CONSTRAINT "pk_tblperson2rsvpevent_1506104406" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpgadapproval" (
    "id" SERIAL NOT NULL,
    "company" VARCHAR(90),
    "contractid" INTEGER,
    "isadapproved" INTEGER,
    "userid" INTEGER,
    "createddate" TIMESTAMP(6),
    "remarks" VARCHAR(500),
    "ismodified" DECIMAL(1,0),
    "modifieduserid" INTEGER,
    "modifieddate" TIMESTAMP(6),
    "modifiedremarks" VARCHAR(500),

    CONSTRAINT "pk__tblpgada__3214ec277238ba10" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplan" (
    "planid" SERIAL NOT NULL,
    "code" VARCHAR(50) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(1000),
    "productid" INTEGER NOT NULL,
    "pricingmodelid" INTEGER NOT NULL DEFAULT 0,
    "Limit" DECIMAL(18,4),
    "setupfee" DECIMAL(18,2),
    "istrial" DECIMAL(1,0) DEFAULT 0,
    "trialperiod" INTEGER,
    "trialperiodunit" INTEGER,
    "billingperiod" INTEGER,
    "billingperiodunit" INTEGER,
    "billingcycles" INTEGER,
    "endaction" INTEGER,
    "isautocollection" DECIMAL(1,0) DEFAULT 0,
    "isapplytax" DECIMAL(1,0) DEFAULT 0,
    "invoicetemplateid" INTEGER,
    "accountingcode" VARCHAR(50),
    "giftable" DECIMAL(1,0) DEFAULT 0,
    "giftexpiry" INTEGER,
    "giftexpiryunit" INTEGER,
    "isautoclaim" DECIMAL(1,0) DEFAULT 0,
    "giftclaimurl" VARCHAR(500),
    "canchangeshippingaddress" DECIMAL(1,0) DEFAULT 0,
    "status" VARCHAR(20) DEFAULT 'Active',
    "archivedby" INTEGER,
    "archivedon" TIMESTAMP(6),
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "contacttypeid" INTEGER,
    "ispayimmediately" DECIMAL(1,0) DEFAULT 0,
    "isrefundonpause" DECIMAL(1,0) DEFAULT 0,
    "isrefundoncancel" DECIMAL(1,0) DEFAULT 0,
    "noofallowedsubscriptions" INTEGER,
    "displayname" VARCHAR(50),
    "imageurl" TEXT,
    "issendinvoiceemail" DECIMAL(1,0) DEFAULT 0,
    "isapplyautomatictaxes" DECIMAL(1,0) DEFAULT 0,
    "forcecanceloption" VARCHAR(100) DEFAULT 'Immediately',
    "minimumunit" DECIMAL(18,4),
    "ratecardid" INTEGER,
    "invoiceduedays" INTEGER,
    "iscomp" DECIMAL(1,0),
    "isrequestor" DECIMAL(1,0),
    "maxsubscriptioncopiesallowed" INTEGER,
    "billingmode" INTEGER DEFAULT 0,
    "usagecalculationmethod" INTEGER DEFAULT 0,
    "zeroskipflag" DECIMAL(1,0) DEFAULT 0,
    "isusereponcustomeraccount" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblplan_1632933089" PRIMARY KEY ("planid")
);

-- CreateTable
CREATE TABLE "tblplan2addon" (
    "id" SERIAL NOT NULL,
    "planid" INTEGER NOT NULL,
    "addonid" INTEGER NOT NULL,
    "addoneventtypeid" INTEGER NOT NULL,
    "quantitylimit" DECIMAL(18,4),
    "Group" VARCHAR(100),

    CONSTRAINT "pk_tblplan2addon_1664933203" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplan2orderaddon" (
    "id" SERIAL NOT NULL,
    "planid" INTEGER NOT NULL,
    "adjustmentid" INTEGER NOT NULL,
    "cbmoclassifiedstyleid" INTEGER,
    "Group" VARCHAR(100),

    CONSTRAINT "pk_tblplan2orderaddon_254884225" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplanaddon" (
    "addonid" SERIAL NOT NULL,
    "code" VARCHAR(50) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(1000),
    "quantitylimit" DECIMAL(18,4),
    "productid" INTEGER NOT NULL,
    "pricingmodelid" INTEGER NOT NULL DEFAULT 0,
    "isrecurring" DECIMAL(1,0) DEFAULT 0,
    "accountingcode" VARCHAR(50),
    "status" VARCHAR(20) DEFAULT 'Active',
    "archivedby" INTEGER,
    "archivedon" TIMESTAMP(6),
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "imageurl" TEXT,
    "billingmode" INTEGER DEFAULT 0,
    "usagecalculationmethod" INTEGER DEFAULT 0,
    "zeroskipflag" DECIMAL(1,0) DEFAULT 0,
    "minquantity" DECIMAL(18,4),

    CONSTRAINT "pk_tblplanaddon_1696933317" PRIMARY KEY ("addonid")
);

-- CreateTable
CREATE TABLE "tblplanaddoneventtype" (
    "addoneventtypeid" SERIAL NOT NULL,
    "code" VARCHAR(20) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0) DEFAULT 0,
    "isrecurring" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblplanaddoneventtype_1728933431" PRIMARY KEY ("addoneventtypeid")
);

-- CreateTable
CREATE TABLE "tblplanaddongroup" (
    "addongroupid" SERIAL NOT NULL,
    "name" VARCHAR(100),

    CONSTRAINT "pk_tblplanaddongroup_1526504717" PRIMARY KEY ("addongroupid")
);

-- CreateTable
CREATE TABLE "tblplanaddongroup2addon" (
    "id" SERIAL NOT NULL,
    "addongroupid" INTEGER,
    "addonid" INTEGER,

    CONSTRAINT "pk_tblplanaddongroup2addon_1574504888" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplanbillingcycle" (
    "id" SERIAL NOT NULL,
    "planid" INTEGER NOT NULL,
    "isbillingcyclestart" DECIMAL(1,0) DEFAULT 0,
    "startsonperiod" INTEGER NOT NULL,
    "startonperiodunitid" INTEGER NOT NULL,
    "startsonintervalid" INTEGER NOT NULL,
    "isbillingcycleclose" DECIMAL(1,0) DEFAULT 0,
    "closeonperiod" INTEGER,
    "closeonperiodunitid" INTEGER,
    "alignment" VARCHAR(20),
    "billingtype" VARCHAR(20),
    "isalignment" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblplanbillingcycle_553977250" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplancoupon" (
    "couponid" SERIAL NOT NULL,
    "adjustmentid" INTEGER NOT NULL,
    "code" VARCHAR(50) NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "durationtype" VARCHAR(20) NOT NULL,
    "duration" INTEGER,
    "validtill" TIMESTAMP(6),
    "maxredemptions" INTEGER DEFAULT 1,
    "redemptions" INTEGER,
    "applyon" VARCHAR(50),
    "planapplyon" VARCHAR(50),
    "addonapplyon" VARCHAR(50),
    "status" VARCHAR(20) DEFAULT 'Active',
    "archivedby" INTEGER,
    "archivedon" TIMESTAMP(6),
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),

    CONSTRAINT "pk_tblplancoupon_1760933545" PRIMARY KEY ("couponid")
);

-- CreateTable
CREATE TABLE "tblplancouponaddon" (
    "id" SERIAL NOT NULL,
    "couponid" INTEGER NOT NULL,
    "addonid" INTEGER NOT NULL,
    "isautodiscount" DECIMAL(1,0),
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblplancouponaddon_1792933659" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplancouponaddoninactive" (
    "id" SERIAL NOT NULL,
    "couponid" INTEGER NOT NULL,
    "addonid" INTEGER NOT NULL,
    "isautodiscount" DECIMAL(1,0),
    "sortorder" INTEGER
);

-- CreateTable
CREATE TABLE "tblplancouponcustomer" (
    "id" SERIAL NOT NULL,
    "couponid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "maxredemptions" INTEGER,
    "redemptions" INTEGER,

    CONSTRAINT "pk_tblplancouponcustomer_1824933773" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplancouponplan" (
    "id" SERIAL NOT NULL,
    "couponid" INTEGER NOT NULL,
    "planid" INTEGER NOT NULL,
    "isautodiscount" DECIMAL(1,0),
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblplancouponplan_1856933887" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplancouponplaninactive" (
    "id" SERIAL NOT NULL,
    "couponid" INTEGER NOT NULL,
    "planid" INTEGER NOT NULL,
    "isautodiscount" DECIMAL(1,0),
    "sortorder" INTEGER
);

-- CreateTable
CREATE TABLE "tblplancustomerportalsettings" (
    "planid" INTEGER NOT NULL,
    "canupdateendaction" DECIMAL(1,0) NOT NULL,
    "cancancel" DECIMAL(1,0) NOT NULL,
    "canremovecancel" DECIMAL(1,0) NOT NULL,
    "canreactivate" DECIMAL(1,0) NOT NULL,
    "canrenew" DECIMAL(1,0) NOT NULL,

    CONSTRAINT "pk_tblplancustomerportalsettings_2087938760" PRIMARY KEY ("planid")
);

-- CreateTable
CREATE TABLE "tblplanfeature" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(1000) NOT NULL,
    "status" SMALLINT NOT NULL,
    "planid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblplanfeature_1888934001" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplanfreecredits" (
    "creditid" SERIAL NOT NULL,
    "planid" INTEGER NOT NULL,
    "creditamount" DECIMAL(18,4) NOT NULL,
    "credittypeid" INTEGER NOT NULL,
    "expirationdate" TIMESTAMP(6),
    "isenabled" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk__tblplanf__ed5ed09bc8aa30c7" PRIMARY KEY ("creditid")
);

-- CreateTable
CREATE TABLE "tblplanfulfilmentpoint" (
    "fulfilmentid" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "date" TIMESTAMP(6) NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedon" TIMESTAMP(6),

    CONSTRAINT "pk_tblplanfulfilmentpoint_585977364" PRIMARY KEY ("fulfilmentid")
);

-- CreateTable
CREATE TABLE "tblplanfulfilmentpointproduct" (
    "id" SERIAL NOT NULL,
    "fulfilmentid" INTEGER NOT NULL,
    "productid" INTEGER,

    CONSTRAINT "pk_tblplanfulfilmentpointproduct_617977478" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplanperiodunit" (
    "periodunitid" SERIAL NOT NULL,
    "code" VARCHAR(20) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblplanperiodunit_1920934115" PRIMARY KEY ("periodunitid")
);

-- CreateTable
CREATE TABLE "tblplanpricingmodel" (
    "pricingmodelid" SERIAL NOT NULL,
    "code" VARCHAR(20) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblplanpricingmodel_1952934229" PRIMARY KEY ("pricingmodelid")
);

-- CreateTable
CREATE TABLE "tblplanpricingmodellineitem" (
    "id" SERIAL NOT NULL,
    "planid" INTEGER,
    "addonid" INTEGER,
    "pricingmodelid" INTEGER NOT NULL,
    "price" DECIMAL(18,2) NOT NULL,
    "freequantity" DECIMAL(18,4),
    "startunit" DECIMAL(18,2),
    "endunit" DECIMAL(18,2),

    CONSTRAINT "pk_tblplanpricingmodellineitem_1984934343" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansplitreps" (
    "id" SERIAL NOT NULL,
    "planid" INTEGER NOT NULL,
    "userid" INTEGER NOT NULL,
    "percentage" DECIMAL(18,2) NOT NULL,
    "isprimary" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblplansplitreps_649977592" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriber2tags" (
    "subscriberid" INTEGER NOT NULL,
    "tagid" VARCHAR(24) NOT NULL,
    "tagname" TEXT NOT NULL,

    CONSTRAINT "pk_tblplansubscriber2tags_2012078454" PRIMARY KEY ("subscriberid","tagid")
);

-- CreateTable
CREATE TABLE "tblplansubscription" (
    "subscriptionid" SERIAL NOT NULL,
    "number" VARCHAR(100),
    "planid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "quantity" DECIMAL(18,4) NOT NULL DEFAULT 1,
    "price" DECIMAL(18,2),
    "freequantity" DECIMAL(18,4),
    "setupfee" DECIMAL(18,2),
    "startdate" TIMESTAMP(6) NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "trialstartdate" TIMESTAMP(6),
    "trialenddate" TIMESTAMP(6),
    "nextbillingat" TIMESTAMP(6),
    "remainingbillingcycles" INTEGER,
    "billingcycles" INTEGER,
    "endaction" INTEGER NOT NULL,
    "invoiceoption" VARCHAR(50),
    "source" VARCHAR(20),
    "isautocollection" DECIMAL(1,0),
    "addressid" INTEGER,
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "isagreed" DECIMAL(1,0),
    "checkoutformid" VARCHAR(50),
    "currentbillingcycleamount" DECIMAL(18,2),
    "startdateselected" TIMESTAMP(6),
    "originalstartdate" TIMESTAMP(6),
    "ispayimmediately" DECIMAL(1,0),
    "enddate" TIMESTAMP(6),
    "renewaldate" TIMESTAMP(6),
    "iscomp" DECIMAL(1,0) DEFAULT 0,
    "addresstype" INTEGER DEFAULT 1,
    "nextrenewalamount" DECIMAL(18,2),
    "nextbillingamount" DECIMAL(18,2),
    "totaltermamount" DECIMAL(18,2),
    "billingperiod" INTEGER,
    "billingperiodunit" INTEGER,

    CONSTRAINT "pk_tblplansubscription_2016934457" PRIMARY KEY ("subscriptionid")
);

-- CreateTable
CREATE TABLE "tblplansubscription_dev_30574" (
    "subscriptionid" SERIAL NOT NULL,
    "number" VARCHAR(100),
    "planid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "price" DECIMAL(18,2),
    "freequantity" INTEGER,
    "setupfee" DECIMAL(18,2),
    "startdate" TIMESTAMP(6) NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "trialstartdate" TIMESTAMP(6),
    "trialenddate" TIMESTAMP(6),
    "nextbillingat" TIMESTAMP(6),
    "remainingbillingcycles" INTEGER,
    "billingcycles" INTEGER,
    "endaction" INTEGER NOT NULL,
    "invoiceoption" VARCHAR(50),
    "source" VARCHAR(20),
    "isautocollection" DECIMAL(1,0),
    "addressid" INTEGER,
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "isagreed" DECIMAL(1,0),
    "checkoutformid" VARCHAR(50),
    "currentbillingcycleamount" DECIMAL(18,2),
    "startdateselected" TIMESTAMP(6),
    "originalstartdate" TIMESTAMP(6),
    "ispayimmediately" DECIMAL(1,0),
    "enddate" TIMESTAMP(6),
    "renewaldate" TIMESTAMP(6),
    "iscomp" DECIMAL(1,0),
    "addresstype" INTEGER,
    "nextrenewalamount" DECIMAL(18,2),
    "nextbillingamount" DECIMAL(18,2),
    "totaltermamount" DECIMAL(18,2)
);

-- CreateTable
CREATE TABLE "tblplansubscriptionaddon" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "addonid" INTEGER NOT NULL,
    "quantity" DECIMAL(18,4),
    "price" DECIMAL(18,2),
    "freequantity" DECIMAL(18,4),

    CONSTRAINT "pk_tblplansubscriptionaddon_2048934571" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionautopayment" (
    "subscriptionid" INTEGER NOT NULL,
    "paymentmethod" VARCHAR(50),

    CONSTRAINT "pk_tblplansubscriptionautopayment_1048599024" PRIMARY KEY ("subscriptionid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionbillingadjustments" (
    "id" BIGSERIAL NOT NULL,
    "subscriptionid" INTEGER,
    "itemtype" VARCHAR(100),
    "itemid" INTEGER,
    "adjustmentid" INTEGER,
    "amount" DECIMAL(18,2),
    "billingtermid" INTEGER,
    "uniqueid" UUID,

    CONSTRAINT "pk_tblplansubscriptionbillingadjustments_646501582" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionbillingamount" (
    "id" BIGSERIAL NOT NULL,
    "uniqueid" UUID NOT NULL,
    "subscriptionid" INTEGER,
    "itemname" VARCHAR(1000),
    "itemtype" VARCHAR(100),
    "itemid" INTEGER,
    "description" VARCHAR(1000),
    "amount" DECIMAL(18,2),
    "actualamount" DECIMAL(18,2),
    "discount" DECIMAL(18,2),
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "rowtype" VARCHAR(10),
    "sortorder" INTEGER,
    "billingperiod" VARCHAR(100),
    "isrecurring" DECIMAL(1,0),
    "status" VARCHAR(50),
    "price" DECIMAL(18,2),
    "quantity" DECIMAL(18,4),
    "freequantity" DECIMAL(18,4),
    "createdon" TIMESTAMP(6),

    CONSTRAINT "pk_tblplansubscriptionbillingamount_614501468" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionbillingterm" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "billingstartdate" TIMESTAMP(6) NOT NULL,
    "billingenddate" TIMESTAMP(6) NOT NULL,
    "amount" DECIMAL(18,2),
    "status" VARCHAR(50),
    "paymentgatewaystatus" VARCHAR(1000),
    "orderstatus" VARCHAR(1000),
    "invoicestatus" VARCHAR(1000),
    "invoicepaymentstatus" VARCHAR(1000),
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedon" TIMESTAMP(6),
    "processlog" TEXT,
    "chargegatewayamount" DECIMAL(18,2),

    CONSTRAINT "pk_tblplansubscriptionbillingterm_2112934799" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionbillingtermdeleted" (
    "id" INTEGER NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "billingstartdate" TIMESTAMP(6) NOT NULL,
    "billingenddate" TIMESTAMP(6) NOT NULL,
    "amount" DECIMAL(18,2),
    "status" VARCHAR(50),
    "paymentgatewaystatus" VARCHAR(1000),
    "orderstatus" VARCHAR(1000),
    "invoicestatus" VARCHAR(1000),
    "invoicepaymentstatus" VARCHAR(1000),
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedon" TIMESTAMP(6),
    "processlog" TEXT,
    "chargegatewayamount" DECIMAL(18,2),
    "deletedate" TIMESTAMP(6),
    "deletedbyuserid" INTEGER,
    "deletereason" VARCHAR(1000)
);

-- CreateTable
CREATE TABLE "tblplansubscriptionbillingtermpayment" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "billingtermid" INTEGER NOT NULL,
    "paymentid" INTEGER NOT NULL,
    "amount" DECIMAL(18,2) NOT NULL,

    CONSTRAINT "pk_tblplansubscriptionbillingtermpayment_2144934913" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioncancel" (
    "cancelledid" SERIAL NOT NULL,
    "reasonid" INTEGER NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "canceloption" VARCHAR(100),
    "cancelledby" INTEGER NOT NULL,
    "cancelinitiateddate" TIMESTAMP(6) NOT NULL,
    "cancelleddate" TIMESTAMP(6),
    "source" VARCHAR(20),
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "noofbillingcycle" INTEGER,
    "reactivatefrom" TIMESTAMP(6),
    "reactivatedate" TIMESTAMP(6),
    "tobecancelled" TIMESTAMP(6),
    "status" VARCHAR(50),
    "billingtermid" INTEGER,
    "proratedamount" DECIMAL(18,2),
    "refundstatus" VARCHAR(50),
    "refundpaymentid" INTEGER,
    "refundamount" DECIMAL(18,2),
    "chargetype" VARCHAR(20),

    CONSTRAINT "pk_tblplansubscriptioncancel_29451379" PRIMARY KEY ("cancelledid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioncancelreason" (
    "cancelreasonid" SERIAL NOT NULL,
    "code" VARCHAR(100) NOT NULL,
    "name" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_tblplansubscriptioncancelreason_61451493" PRIMARY KEY ("cancelreasonid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioncheckout" (
    "id" SERIAL NOT NULL,
    "subscriberid" INTEGER,
    "json" TEXT,
    "createddate" TIMESTAMP(6),
    "source" VARCHAR(20),
    "gifteremail" VARCHAR(200),
    "paymentinfo" TEXT,
    "errormessage" TEXT,
    "status" VARCHAR(50),
    "refid" VARCHAR(100),
    "ischeckoutasguest" DECIMAL(1,0),
    "portaltype" VARCHAR(20) DEFAULT 'Subscription',
    "checkoutguid" UUID,
    "batchid" INTEGER,
    "paymenttransactionrefid" BIGINT,

    CONSTRAINT "pk_tblplansubscriptioncheckout_93451607" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioncheckout2subscription" (
    "id" SERIAL NOT NULL,
    "checkoutid" INTEGER NOT NULL,
    "subscriptionid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblplansubscriptioncheckout2subscription_792598112" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioncoupon" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "couponid" INTEGER NOT NULL,
    "maxnoofbillingcycles" INTEGER,
    "noofbillingcyclesapplied" INTEGER,

    CONSTRAINT "pk_tblplansubscriptioncoupon_125451721" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioncouponcustomer" (
    "id" SERIAL NOT NULL,
    "transactionid" INTEGER NOT NULL,
    "couponid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "redemptions" INTEGER NOT NULL,
    "transtype" VARCHAR(20) DEFAULT 'Subscription',

    CONSTRAINT "pk_tblplansubscriptioncouponcustomer_681977706" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioncreditadjustments" (
    "creditadjustmentid" SERIAL NOT NULL,
    "creditid" INTEGER NOT NULL,
    "billingtermid" INTEGER,
    "adjustedcredit" DECIMAL(18,4) NOT NULL,
    "credittypeid" INTEGER NOT NULL,
    "reason" VARCHAR(255),
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "expirationdate" TIMESTAMP(6),

    CONSTRAINT "pk__tblplans__b966f7ebabde21ee" PRIMARY KEY ("creditadjustmentid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioncredits" (
    "creditid" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "creditbalance" DECIMAL(18,4) NOT NULL,
    "expirationdate" TIMESTAMP(6),
    "isenabled" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk__tblplans__ed5ed09b51211a73" PRIMARY KEY ("creditid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptiondeleted" (
    "subscriptionid" INTEGER NOT NULL,
    "number" VARCHAR(100),
    "planid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "reason" TEXT,
    "deletedon" TIMESTAMP(6),

    CONSTRAINT "pk_tblplansubscriptiondeleted_1689981297" PRIMARY KEY ("subscriptionid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionextendedbillingdates" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "billingtermid" INTEGER,
    "fromdate" TIMESTAMP(6) NOT NULL,
    "todate" TIMESTAMP(6) NOT NULL,
    "isextended" DECIMAL(1,0) NOT NULL,
    "extendedon" TIMESTAMP(6) NOT NULL,
    "extensiontype" VARCHAR(20),
    "chargetype" VARCHAR(20) DEFAULT 'None',

    CONSTRAINT "pk_tblplansubscriptionextendedbillingdates_666693673" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionextensionpayment" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "billingtermid" INTEGER NOT NULL,
    "paymenttype" VARCHAR(10) NOT NULL,
    "proratedamount" DECIMAL(18,2),
    "ischargeimmediately" DECIMAL(1,0),
    "status" VARCHAR(50),
    "orderstatus" VARCHAR(1000),
    "invoicestatus" VARCHAR(1000),
    "invoicepaymentstatus" VARCHAR(1000),
    "creditpaymentid" INTEGER,
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedon" TIMESTAMP(6),
    "processlog" TEXT,

    CONSTRAINT "pk_tblplansubscriptionextensionpayment_970694756" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptiongift" (
    "subscriptionid" INTEGER NOT NULL,
    "isgifted" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "giftedby" INTEGER,
    "isrenewtogiftor" DECIMAL(1,0),

    CONSTRAINT "pk_tblplansubscriptiongift_subscriptionid_1745649512" PRIMARY KEY ("subscriptionid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioninbetween" (
    "id" SERIAL NOT NULL,
    "sourceid" INTEGER NOT NULL,
    "inbetweenid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblplansubscriptioninbetween_1772793623" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptioninbetweendeleted" (
    "id" INTEGER NOT NULL,
    "sourceid" INTEGER NOT NULL,
    "inbetweenid" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "tblplansubscriptioninfo" (
    "subscriptionid" INTEGER NOT NULL,
    "sourceid" INTEGER,
    "isrequestor" DECIMAL(1,0),
    "entryform" VARCHAR(500),
    "message" TEXT,

    CONSTRAINT "pk_tblplansubscriptioninfo_subscriptionid_1464600506" PRIMARY KEY ("subscriptionid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionorder" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "planid" INTEGER NOT NULL,
    "addonid" INTEGER,
    "orderid" INTEGER NOT NULL,
    "invoiceid" INTEGER,
    "billingtermid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblplansubscriptionorder_189451949" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionpause" (
    "pauseid" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "pauseoption" VARCHAR(100),
    "pausedby" INTEGER NOT NULL,
    "pauseinitiateddate" TIMESTAMP(6) NOT NULL,
    "tobepaused" TIMESTAMP(6),
    "pauseddate" TIMESTAMP(6),
    "source" VARCHAR(20),
    "resumedby" INTEGER,
    "toberesumedon" TIMESTAMP(6),
    "status" VARCHAR(50),
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "billingtermid" INTEGER,
    "proratedamount" DECIMAL(18,2),
    "refundstatus" VARCHAR(50),
    "refundpaymentid" INTEGER,
    "refundamount" DECIMAL(18,2),
    "chargetype" VARCHAR(20),

    CONSTRAINT "pk_tblplansubscriptionpause_1750505515" PRIMARY KEY ("pauseid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionqueue" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "type" VARCHAR(50),
    "status" VARCHAR(20),
    "processlog" TEXT,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedon" TIMESTAMP(6),
    "referenceid" INTEGER,

    CONSTRAINT "pk_tblplansubscriptionqueue_221452063" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionrenewed" (
    "id" SERIAL NOT NULL,
    "sourceid" INTEGER NOT NULL,
    "renewedid" INTEGER NOT NULL,
    "reneweddate" TIMESTAMP(6) NOT NULL,
    "renewaltype" VARCHAR(20),

    CONSTRAINT "pk_tblplansubscriptionrenewed_253452177" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionsetuphistory" (
    "id" SERIAL NOT NULL,
    "clientid" INTEGER NOT NULL,
    "message" TEXT,
    "createdon" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "pk_tblplansubscriptionsetuphistory_1721981411" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionsource" (
    "sourceid" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0),

    CONSTRAINT "pk_tblplansubscriptionsource_1496600620" PRIMARY KEY ("sourceid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionsplitreps" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "userid" INTEGER NOT NULL,
    "percentage" DECIMAL(18,2) NOT NULL,
    "isprimary" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblplansubscriptionsplitreps_713977820" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptiontaxes" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "taxid" INTEGER,
    "taxgroupid" INTEGER,

    CONSTRAINT "pk_tblplansubscriptiontaxes_1753981525" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplansubscriptiontermendaction" (
    "termendactionid" SERIAL NOT NULL,
    "code" VARCHAR(20) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "isdefault" DECIMAL(1,0),
    "sortorder" INTEGER NOT NULL,

    CONSTRAINT "pk_tblplansubscriptiontermendaction_285452291" PRIMARY KEY ("termendactionid")
);

-- CreateTable
CREATE TABLE "tblplansubscriptionusage" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER NOT NULL,
    "entityid" INTEGER NOT NULL,
    "entitytype" INTEGER NOT NULL,
    "usage" DECIMAL(18,4) NOT NULL,
    "note" VARCHAR(3000),
    "usagedate" TIMESTAMP(6) NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "createdby" INTEGER NOT NULL,
    "updatedon" TIMESTAMP(6),
    "source" VARCHAR(20) NOT NULL,

    CONSTRAINT "pk_tblplansubscriptionusage_1127935340" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblplantaxes" (
    "id" SERIAL NOT NULL,
    "planid" INTEGER NOT NULL,
    "taxid" INTEGER,
    "taxgroupid" INTEGER,

    CONSTRAINT "pk_tblplantaxes_1785981639" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpreflightdoctype" (
    "doctypeid" SERIAL NOT NULL,
    "doctypename" VARCHAR(100) NOT NULL,
    "templatetablename" VARCHAR(50),
    "sortorder" INTEGER,
    "isimport" DECIMAL(1,0),

    CONSTRAINT "pk_tblpreflightdoctype_1728269462" PRIMARY KEY ("doctypeid")
);

-- CreateTable
CREATE TABLE "tblpreflightfield" (
    "preflightfieldid" SERIAL NOT NULL,
    "doctypeid" INTEGER NOT NULL,
    "displayname" VARCHAR(50) NOT NULL,
    "columnname" VARCHAR(50) NOT NULL,
    "relevantcolumns" TEXT,
    "datatype" VARCHAR(50) NOT NULL,
    "regexformat" VARCHAR(1000),
    "regexdesc" VARCHAR(1000),
    "masterdatatype" VARCHAR(1000),
    "maxlength" INTEGER NOT NULL,
    "ismandatory" DECIMAL(1,0) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "ismultiple" INTEGER,

    CONSTRAINT "pk_tblpreflightfield_preflightfieldid_1760269576" PRIMARY KEY ("preflightfieldid")
);

-- CreateTable
CREATE TABLE "tblpreflightfile" (
    "preflightfileid" SERIAL NOT NULL,
    "doctypeid" INTEGER NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "filepath" VARCHAR(500) NOT NULL,
    "filetype" VARCHAR(100) NOT NULL,
    "filename" VARCHAR(100) NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "tablename" VARCHAR(100),
    "createdate" TIMESTAMP(6),
    "createdby" INTEGER,
    "updatedate" TIMESTAMP(6),
    "updatedby" INTEGER,
    "datasummary" TEXT,
    "datastatus" TEXT,
    "mastertablename" VARCHAR(100),

    CONSTRAINT "pk_tblpreflightfile_preflightfileid_1792269690" PRIMARY KEY ("preflightfileid")
);

-- CreateTable
CREATE TABLE "tblpreflightfilefieldmapping" (
    "preflightmapid" SERIAL NOT NULL,
    "preflightfileid" INTEGER NOT NULL,
    "preflightfieldid" INTEGER,
    "filecolumnname" VARCHAR(500),
    "iscustom" DECIMAL(1,0) DEFAULT 0,
    "locations" TEXT,
    "createdate" TIMESTAMP(6),
    "createdby" INTEGER,

    CONSTRAINT "pk_tblpreflightfilefieldmapping_tblpreflightfile_preflightfilei" PRIMARY KEY ("preflightmapid","preflightfileid")
);

-- CreateTable
CREATE TABLE "tblpreflightfilehistory" (
    "id" SERIAL NOT NULL,
    "fileid" INTEGER NOT NULL,
    "action" VARCHAR(1000) NOT NULL,
    "actionby" INTEGER NOT NULL,
    "username" VARCHAR(100) NOT NULL,
    "updateddate" TIMESTAMP(6) NOT NULL,
    "description" VARCHAR(1000) NOT NULL,
    "source" VARCHAR(100) NOT NULL,

    CONSTRAINT "pk_tblpreflightfilehistory_id_1897318069" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpreflightmediakit" (
    "preflightmediafileid" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "category" VARCHAR(50),
    "filepath" VARCHAR(500),
    "filetype" VARCHAR(20),
    "filename" VARCHAR(100) NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "createdate" TIMESTAMP(6),
    "createdby" INTEGER,
    "updateddate" TIMESTAMP(6),
    "updatedby" INTEGER,
    "tablemapjson" TEXT,

    CONSTRAINT "pk_tblpreflightmediakit_preflightmediafileid_1929318183" PRIMARY KEY ("preflightmediafileid")
);

-- CreateTable
CREATE TABLE "tblpreflightsummaryfield" (
    "summaryid" SERIAL NOT NULL,
    "summarytype" VARCHAR(100),
    "summaryquery" TEXT,

    CONSTRAINT "pk_tblpreflightsummaryfield_summaryid_1977318354" PRIMARY KEY ("summaryid")
);

-- CreateTable
CREATE TABLE "tblpreflighttemplatecontactdata" (
    "id" SERIAL NOT NULL,
    "Company Name" VARCHAR(90),
    "prefix" VARCHAR(100),
    "Full Name" VARCHAR(100),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "suffix" VARCHAR(50),
    "email" VARCHAR(70),
    "Alternate Email" VARCHAR(70),
    "phone" VARCHAR(50),
    "Mobile Phone" VARCHAR(50),
    "Website URL" VARCHAR(255),
    "Partner Reps" TEXT,
    "PartnerRep First Name" TEXT,
    "PartnerRep Last Name" TEXT,
    "SalesRep Full Name" VARCHAR(50),
    "SalesRep First Name" VARCHAR(50),
    "SalesRep Last Name" VARCHAR(50),
    "category" VARCHAR(100),
    "priority" VARCHAR(50),
    "Contact Type" VARCHAR(100),
    "Job Title" VARCHAR(70),
    "Full Address" VARCHAR(70),
    "Address Line 1" VARCHAR(50),
    "Address Line 2" VARCHAR(50),
    "city" VARCHAR(50),
    "State/Region" VARCHAR(50),
    "Zip Code" VARCHAR(50),
    "county" VARCHAR(50),
    "country" VARCHAR(255),
    "fax" VARCHAR(50),
    "notes" VARCHAR(1000),
    "Phone 3" VARCHAR(50),
    "Phone 4" VARCHAR(50),
    "Contact Group" VARCHAR(100),
    "attn" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblpreflighttemplatenotedata" (
    "id" SERIAL NOT NULL,
    "SalesRep Full Name" VARCHAR(200),
    "SalesRep First Name" VARCHAR(100),
    "SalesRep Last Name" VARCHAR(100),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "Company Name" VARCHAR(90),
    "subject" VARCHAR(4000),
    "description" VARCHAR(4000),
    "notes" TEXT,
    "Date Added" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblpreflighttemplateopenardata" (
    "id" SERIAL NOT NULL,
    "Company Name" VARCHAR(90),
    "SalesRep Full Name" VARCHAR(200),
    "SalesRep First Name" VARCHAR(100),
    "SalesRep Last Name" VARCHAR(100),
    "Invoice Date" VARCHAR(50),
    "Due Date" VARCHAR(50),
    "total" VARCHAR(50),
    "Amount Paid" VARCHAR(50),
    "description" VARCHAR(50),
    "status" VARCHAR(50),
    "prefix" VARCHAR(100),
    "Full Name" VARCHAR(100),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "suffix" VARCHAR(50),
    "email" VARCHAR(70),
    "Alternate Email" VARCHAR(70),
    "phone" VARCHAR(50),
    "Mobile Phone" VARCHAR(50),
    "Website URL" VARCHAR(255),
    "category" VARCHAR(100),
    "priority" VARCHAR(50),
    "Contact Type" VARCHAR(100),
    "Job Title" VARCHAR(70),
    "Full Address" VARCHAR(70),
    "Address Line 1" VARCHAR(50),
    "Address Line 2" VARCHAR(50),
    "city" VARCHAR(50),
    "State/Region" VARCHAR(50),
    "Zip Code" VARCHAR(50),
    "county" VARCHAR(50),
    "country" VARCHAR(255),
    "fax" VARCHAR(50),
    "notes" VARCHAR(1000),
    "Product Name" VARCHAR(60),
    "Phone 3" VARCHAR(50),
    "Phone 4" VARCHAR(50),
    "attn" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblpreflighttemplateorderdata" (
    "id" SERIAL NOT NULL,
    "Company Name" VARCHAR(90),
    "Commissioned Rep Full Name" VARCHAR(200),
    "Commissioned Rep First Name" VARCHAR(100),
    "Commissioned Rep Last Name" VARCHAR(100),
    "Product Type" VARCHAR(100),
    "Product Name" VARCHAR(60),
    "Issue Date" VARCHAR(50),
    "Issue Name" VARCHAR(100),
    "Issue Year" VARCHAR(10),
    "Rate Card" VARCHAR(100),
    "Ad Size" VARCHAR(100),
    "Ad Position" VARCHAR(100),
    "Ad Section" VARCHAR(100),
    "Ad Color" VARCHAR(100),
    "Ad Frequency" VARCHAR(100),
    "net" VARCHAR(50),
    "Barter Amount" VARCHAR(50),
    "prefix" VARCHAR(100),
    "Full Name" VARCHAR(100),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "suffix" VARCHAR(50),
    "email" VARCHAR(70),
    "Alternate Email" VARCHAR(70),
    "phone" VARCHAR(50),
    "Mobile Phone" VARCHAR(50),
    "Website URL" VARCHAR(255),
    "category" VARCHAR(100),
    "priority" VARCHAR(50),
    "Contact Type" VARCHAR(100),
    "Job Title" VARCHAR(70),
    "Full Address" VARCHAR(70),
    "Address Line 1" VARCHAR(50),
    "Address Line 2" VARCHAR(50),
    "city" VARCHAR(50),
    "State/Region" VARCHAR(50),
    "Zip Code" VARCHAR(50),
    "county" VARCHAR(50),
    "country" VARCHAR(255),
    "fax" VARCHAR(50),
    "notes" VARCHAR(1000),
    "Start Date" VARCHAR(50),
    "End Date" VARCHAR(50),
    "Phone 3" VARCHAR(50),
    "Phone 4" VARCHAR(50),
    "Contact Group" VARCHAR(100),
    "attn" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblpreflighttemplateorumnotedata" (
    "id" SERIAL NOT NULL,
    "rep" VARCHAR(200),
    "SalesRep First Name" VARCHAR(100),
    "SalesRep Last Name" VARCHAR(100),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "Company Name" VARCHAR(90),
    "subject" VARCHAR(4000),
    "description" VARCHAR(4000),
    "notes" TEXT,
    "Date Added" VARCHAR(100),
    "Activity ID" VARCHAR(100),
    "Customer ID" VARCHAR(100),
    "disposition" VARCHAR(100),

    CONSTRAINT "pk_tblpreflighttemplateorumnotedata_1687937335" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpreflighttemplateratesdata" (
    "id" SERIAL NOT NULL,
    "Product Type" VARCHAR(100),
    "Product Name" VARCHAR(60),
    "Rate Card" VARCHAR(100),
    "Rate Type" VARCHAR(100),
    "Ad Size" VARCHAR(100),
    "Ad Position" VARCHAR(100),
    "Ad Section" VARCHAR(100),
    "Ad Color" VARCHAR(100),
    "Ad Frequency" VARCHAR(100),
    "Price/Rate" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblpreflighttemplatesubscriptiondata" (
    "id" SERIAL NOT NULL,
    "Company Name" VARCHAR(90),
    "Product Name" VARCHAR(60),
    "Plan Name" VARCHAR(50),
    "Start Date" VARCHAR(50),
    "End Date" VARCHAR(50),
    "prefix" VARCHAR(100),
    "SalesRep Full Name" VARCHAR(50),
    "SalesRep First Name" VARCHAR(50),
    "SalesRep Last Name" VARCHAR(50),
    "Full Name" VARCHAR(100),
    "First Name" VARCHAR(50),
    "Last Name" VARCHAR(50),
    "suffix" VARCHAR(50),
    "email" VARCHAR(70),
    "Alternate Email" VARCHAR(70),
    "phone" VARCHAR(50),
    "Mobile Phone" VARCHAR(50),
    "Website URL" VARCHAR(255),
    "category" VARCHAR(100),
    "priority" VARCHAR(50),
    "Contact Type" VARCHAR(100),
    "Job Title" VARCHAR(70),
    "Full Address" VARCHAR(70),
    "Address Line 1" VARCHAR(50),
    "Address Line 2" VARCHAR(50),
    "city" VARCHAR(50),
    "State/Region" VARCHAR(50),
    "Zip Code" VARCHAR(50),
    "county" VARCHAR(50),
    "country" VARCHAR(255),
    "fax" VARCHAR(50),
    "notes" VARCHAR(1000),
    "amount" VARCHAR(50),
    "Auto Collection" DECIMAL(1,0) DEFAULT 1,
    "Phone 3" VARCHAR(50),
    "Phone 4" VARCHAR(50),
    "attn" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblpreflighttemplateuserdata" (
    "id" SERIAL NOT NULL,
    "First Name" VARCHAR(50) NOT NULL,
    "Last Name" VARCHAR(50) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "Address Line 1" VARCHAR(100),
    "city" VARCHAR(50),
    "State/Region" VARCHAR(50),
    "Zip Code" VARCHAR(50),
    "Mobile Phone" VARCHAR(50),
    "Business Phone" VARCHAR(50),
    "department" VARCHAR(50) NOT NULL,
    "Job Title" VARCHAR(50),
    "Job Function" VARCHAR(200) NOT NULL,
    "notes" VARCHAR(500),
    "role" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblprepayapplypaymenttrack" (
    "id" SERIAL NOT NULL,
    "transactionrefid" BIGINT NOT NULL,
    "customerid" INTEGER NOT NULL,
    "invoiceid" INTEGER NOT NULL,
    "contractids" TEXT,
    "amountpaid" DECIMAL(18,6),
    "statusid" INTEGER,
    "createdby" INTEGER,
    "createdon" TIMESTAMP(6),

    CONSTRAINT "pk__tblprepa__3214ec2771ad3d62" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblprinters" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "printername" VARCHAR(65) NOT NULL,
    "proofcost" DOUBLE PRECISION NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblprinters_3__51_587149137" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblprintingcosts" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "printersid" INTEGER NOT NULL,
    "formsizeid" INTEGER NOT NULL,
    "paperweightid" INTEGER NOT NULL,
    "makeready_ctp" DOUBLE PRECISION DEFAULT 0,
    "makeready_manufact" DOUBLE PRECISION DEFAULT 0,
    "makeready_paper" DOUBLE PRECISION DEFAULT 0,
    "running_manufact" DOUBLE PRECISION DEFAULT 0,
    "running_paper" DOUBLE PRECISION DEFAULT 0,

    CONSTRAINT "pk_tblprintingcostsnew_1538104520" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblprintingcostsbinding" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "printerid" INTEGER NOT NULL,
    "upto4m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto5m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto6m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto7m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto8m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto9m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto10m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto11m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto12m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto13m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto14m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto15m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto16m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto4r" DOUBLE PRECISION NOT NULL,
    "upto5r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto6r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto7r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto8r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto9r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto10r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto11r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto12r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto13r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto14r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto15r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto16r" DOUBLE PRECISION NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblprintingcostsbinding_1090102924" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblprintingcostsplates" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "printerid" INTEGER NOT NULL,
    "blackplate" DOUBLE PRECISION,
    "colorplate" DOUBLE PRECISION
);

-- CreateTable
CREATE TABLE "tblprintingcostsstitch" (
    "id" INTEGER NOT NULL DEFAULT 0,
    "printerid" INTEGER NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "upto1m" DOUBLE PRECISION NOT NULL,
    "upto2m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto3m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto4m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto5m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto6m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto7m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto8m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto9m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto10m" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto1r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto2r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto3r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto4r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto5r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto6r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto7r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto8r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto9r" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "upto10r" DOUBLE PRECISION NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblprintingformsizes" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "name" VARCHAR(25) NOT NULL DEFAULT '',
    "pages" INTEGER NOT NULL DEFAULT 0,
    "defaultselection" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblprintingformsizes_1106102981" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblprintingpaperweights" (
    "id" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "name" VARCHAR(25) NOT NULL DEFAULT '',
    "defaultselection" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblprintingpaperweights_1122103038" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproductcategory" (
    "productcategoryid" SERIAL NOT NULL,
    "name" VARCHAR(250) NOT NULL,
    "issystem" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblproductcategory_2094174756" PRIMARY KEY ("productcategoryid")
);

-- CreateTable
CREATE TABLE "tblproductfeature" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(1000) NOT NULL,
    "status" SMALLINT NOT NULL,
    "productid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblproductfeature_combinationcolumns_567217321" PRIMARY KEY ("id","productid")
);

-- CreateTable
CREATE TABLE "tblproductioncontractorder" (
    "contractid" INTEGER NOT NULL,
    "orderid" INTEGER NOT NULL,
    "proposalid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblproductioncontractorder_1390172248" PRIMARY KEY ("contractid","proposalid","orderid")
);

-- CreateTable
CREATE TABLE "tblproductioncustomactionslog" (
    "id" SERIAL NOT NULL,
    "customactionsjson" TEXT,
    "processeddate" TIMESTAMP(6),
    "actiontype" VARCHAR(200)
);

-- CreateTable
CREATE TABLE "tblproductionindesignfilesdownloadhistory" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER NOT NULL,
    "downloadeddatetime" TIMESTAMP(6) NOT NULL,
    "downloadedbyrepid" INTEGER NOT NULL,

    CONSTRAINT "pk__tblprodu__3214ec07e2894ad7" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproductionindesignqueue" (
    "id" SERIAL NOT NULL,
    "orderid" INTEGER NOT NULL,
    "userid" INTEGER NOT NULL,
    "productid" INTEGER NOT NULL,
    "status" VARCHAR(10) NOT NULL,
    "createdby" VARCHAR(50) NOT NULL,
    "createddatetime" TIMESTAMP(6) NOT NULL,
    "stageid" INTEGER,

    CONSTRAINT "pk__tblprodu__3214ec07a58bc53c" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproductioninternalapprovalstagehistory" (
    "id" SERIAL NOT NULL,
    "stageid" INTEGER NOT NULL,
    "pagetype" VARCHAR(25) NOT NULL,
    "productionid" INTEGER NOT NULL,
    "date" TIMESTAMP(6) NOT NULL,
    "approverid" INTEGER NOT NULL,
    "approvalstatus" VARCHAR(25),
    "approvalreason" VARCHAR(1000),
    "parentid" INTEGER NOT NULL DEFAULT -1,

    CONSTRAINT "pk_tblproductioninternalapprovalstagehistory_1145315390" PRIMARY KEY ("id","stageid","pagetype","productionid")
);

-- CreateTable
CREATE TABLE "tblproductionorderjobjacketmapping" (
    "id" SERIAL NOT NULL,
    "jobjacketid" INTEGER,
    "orderid" INTEGER,
    "taskid" INTEGER,
    "reforderid" INTEGER,
    "reftaskid" INTEGER,
    "createddate" TIMESTAMP(6),
    "createdby" VARCHAR(100),

    CONSTRAINT "pk__tblprodu__3214ec07c8bd21d9" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproductionordernoteviewed" (
    "ordernoteid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL DEFAULT -1,
    "dateviewed" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "pk_tblproductionordernoteviewed_971410780" PRIMARY KEY ("ordernoteid","customerid")
);

-- CreateTable
CREATE TABLE "tblproductionorderprepayrequest" (
    "id" SERIAL NOT NULL,
    "orderid" INTEGER NOT NULL,
    "prepaypercentage" DECIMAL(18,2) NOT NULL,
    "requesteddate" TIMESTAMP(6) NOT NULL,
    "requestedby" INTEGER NOT NULL,
    "sendemailcriteria" TEXT,

    CONSTRAINT "pk_tblproductionorderprepayrequest_439932889" PRIMARY KEY ("id","orderid")
);

-- CreateTable
CREATE TABLE "tblproductionorderrenewcancel" (
    "orderid" INTEGER NOT NULL,
    "cancelleddate" TIMESTAMP(6) NOT NULL,
    "cancelledby" INTEGER NOT NULL,
    "cancelledreason" VARCHAR(500),

    CONSTRAINT "pk_tblproductionorderrenewcancel_1159935454" PRIMARY KEY ("orderid")
);

-- CreateTable
CREATE TABLE "tblproductionorderrenewed" (
    "id" SERIAL NOT NULL,
    "sourceid" INTEGER NOT NULL,
    "renewedid" INTEGER NOT NULL DEFAULT 0,
    "nextrenewdate" TIMESTAMP(6),
    "nextrenewissueid" INTEGER,
    "endaction" INTEGER NOT NULL,
    "status" VARCHAR(50),
    "statusinfo" VARCHAR(500),
    "customerid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblproductionorderrenewed_id_1063935112" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproductionorderstagehistory" (
    "orderid" INTEGER NOT NULL,
    "stageid" INTEGER NOT NULL,
    "previousstageid" INTEGER,
    "userid" INTEGER,
    "date" TIMESTAMP(6) NOT NULL,
    "action" VARCHAR(50) NOT NULL,
    "taskid" INTEGER,
    "frompage" VARCHAR(50),
    "field" VARCHAR(50),
    "oldvalue" VARCHAR(255),
    "newvalue" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "tblproductionorderstagemapping" (
    "id" SERIAL NOT NULL,
    "orderid" INTEGER NOT NULL,
    "stageid" INTEGER NOT NULL,
    "previousstageid" INTEGER,
    "userid" INTEGER,
    "date" TIMESTAMP(6) NOT NULL,
    "taskid" INTEGER,

    CONSTRAINT "pk_tblproductionorderstagemapping_707025800" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproductionorderstages" (
    "stageid" SERIAL NOT NULL,
    "producttypeid" INTEGER NOT NULL,
    "name" VARCHAR(100),
    "description" VARCHAR(100),
    "cancustomerchange" DECIMAL(1,0) NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "colorcode" VARCHAR(10),
    "pagetype" VARCHAR(20),
    "isrequiredapproval" DECIMAL(1,0),
    "issystem" INTEGER,
    "templateid" INTEGER,
    "isactive" DECIMAL(1,0),

    CONSTRAINT "pk_tblproductionorderstages_51023463" PRIMARY KEY ("stageid")
);

-- CreateTable
CREATE TABLE "tblproductionorderstagesapprovallist" (
    "stageid" INTEGER NOT NULL,
    "userid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblproductionorderstagesapprovallist_1177315504" PRIMARY KEY ("stageid","userid")
);

-- CreateTable
CREATE TABLE "tblproductionordertags" (
    "tagid" SERIAL NOT NULL,
    "name" VARCHAR(200),

    CONSTRAINT "pk__tblprodu__657cf9ac3962d087" PRIMARY KEY ("tagid")
);

-- CreateTable
CREATE TABLE "tblproductionordertagsmapping" (
    "id" SERIAL NOT NULL,
    "orderid" INTEGER,
    "tagid" INTEGER,
    "createdate" TIMESTAMP(6),
    "taskid" INTEGER
);

-- CreateTable
CREATE TABLE "tblproductionordertask" (
    "id" SERIAL NOT NULL,
    "orderid" INTEGER,
    "priority" VARCHAR(20),
    "percentage" INTEGER,
    "assignedto" INTEGER,
    "description" TEXT,
    "projectstartdate" TIMESTAMP(6),
    "projectenddate" TIMESTAMP(6),
    "title" VARCHAR(500),
    "taskid" INTEGER,
    "status" VARCHAR(200),
    "jobjacketid" INTEGER,
    "category" INTEGER,
    "completed" TIMESTAMP(6),
    "assignedby" INTEGER,
    "isprivate" DECIMAL(1,0),
    "taskpriority" INTEGER,
    "parentid" INTEGER,
    "tasktype" INTEGER,

    CONSTRAINT "pk_tblproductionordertask_1093123185" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproductions3files" (
    "id" SERIAL NOT NULL,
    "bucketname" VARCHAR(100),
    "filepath" VARCHAR(500),
    "createdate" TIMESTAMP(6),

    CONSTRAINT "pk__tblprodu__3214ec07a69c7783" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproductiontask" (
    "taskid" SERIAL NOT NULL,
    "customerid" INTEGER NOT NULL,
    "yr" INTEGER NOT NULL,
    "mnth" INTEGER NOT NULL,
    "pubid" INTEGER NOT NULL,
    "dateadded" TIMESTAMP(6),
    "acttime" INTEGER,
    "esttime" INTEGER,
    "designer1" INTEGER,
    "designer2" INTEGER,
    "duedate" TIMESTAMP(6),
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "datemodified" TIMESTAMP(6),
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "stageid" INTEGER,
    "prodnotes" TEXT DEFAULT '',
    "adnumber" INTEGER,
    "adnumberdisplay" VARCHAR(50),
    "gscontractsid" INTEGER,
    "producttype" INTEGER,
    "gstaskid" INTEGER,

    CONSTRAINT "pk_tblproductiontask_1180075490" PRIMARY KEY ("taskid")
);

-- CreateTable
CREATE TABLE "tblproducttype" (
    "id" INTEGER NOT NULL,
    "producttype" VARCHAR(100) DEFAULT '',
    "description" TEXT DEFAULT '',
    "subproducttypeid" SERIAL NOT NULL,
    "subproducttype" VARCHAR(50),
    "isenabled" DECIMAL(1,0) DEFAULT 1,
    "isnew" DECIMAL(1,0) DEFAULT 1,
    "sortorder" INTEGER,
    "isnewjobjacket" DECIMAL(1,0) DEFAULT 0,
    "tasklabel" VARCHAR(100),
    "parentid" INTEGER,
    "iscontactmandatory" DECIMAL(1,0),
    "iscontacteditsection" DECIMAL(1,0),
    "canhaveissues" DECIMAL(1,0),
    "canaddproducts" DECIMAL(1,0),
    "subproducttypecode" VARCHAR(50),

    CONSTRAINT "pk_tblproducttype_868406363" PRIMARY KEY ("subproducttypeid")
);

-- CreateTable
CREATE TABLE "tblproducttype_dev_31735" (
    "id" INTEGER NOT NULL,
    "producttype" VARCHAR(100),
    "description" TEXT,
    "subproducttypeid" SERIAL NOT NULL,
    "subproducttype" VARCHAR(50),
    "isenabled" DECIMAL(1,0),
    "isnew" DECIMAL(1,0),
    "sortorder" INTEGER,
    "isnewjobjacket" DECIMAL(1,0),
    "tasklabel" VARCHAR(100),
    "parentid" INTEGER,
    "iscontactmandatory" DECIMAL(1,0),
    "iscontacteditsection" DECIMAL(1,0),
    "canhaveissues" DECIMAL(1,0),
    "canaddproducts" DECIMAL(1,0),
    "subproducttypecode" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblproducttype_dev_33692" (
    "id" INTEGER NOT NULL,
    "producttype" VARCHAR(100),
    "description" TEXT,
    "subproducttypeid" SERIAL NOT NULL,
    "subproducttype" VARCHAR(50),
    "isenabled" DECIMAL(1,0),
    "isnew" DECIMAL(1,0),
    "sortorder" INTEGER,
    "isnewjobjacket" DECIMAL(1,0),
    "tasklabel" VARCHAR(100),
    "parentid" INTEGER,
    "iscontactmandatory" DECIMAL(1,0),
    "iscontacteditsection" DECIMAL(1,0),
    "canhaveissues" DECIMAL(1,0),
    "canaddproducts" DECIMAL(1,0),
    "subproducttypecode" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblproducttypefield" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "page" VARCHAR(255) NOT NULL,
    "inputtype" VARCHAR(100) NOT NULL,
    "datatype" VARCHAR(100),
    "isdynamic" DECIMAL(1,0),
    "subproducttypeid" INTEGER NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "required" INTEGER,
    "parentcode" VARCHAR(255),
    "position" VARCHAR(50),
    "defaultvalue" TEXT,
    "maxlength" INTEGER,
    "optionlist" TEXT,
    "valuelist" TEXT,
    "apiurl" TEXT,
    "postapiurl" TEXT,
    "isvisible" INTEGER,
    "controlids" TEXT,
    "pluralcontrolids" TEXT,
    "colspan" INTEGER,
    "jsonproperty" VARCHAR(100),
    "css" VARCHAR(100),
    "columns" INTEGER,
    "isplural" DECIMAL(1,0),
    "sectionsortorder" INTEGER,

    CONSTRAINT "pk_tblproducttypefield_1811745757" PRIMARY KEY ("id","code","page","subproducttypeid","inputtype")
);

-- CreateTable
CREATE TABLE "tblproducttypefield_4_20250830050055" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "page" VARCHAR(255) NOT NULL,
    "inputtype" VARCHAR(100) NOT NULL,
    "datatype" VARCHAR(100),
    "isdynamic" DECIMAL(1,0),
    "subproducttypeid" INTEGER NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "required" INTEGER,
    "parentcode" VARCHAR(255),
    "position" VARCHAR(50),
    "defaultvalue" TEXT,
    "maxlength" INTEGER,
    "optionlist" TEXT,
    "valuelist" TEXT,
    "apiurl" TEXT,
    "postapiurl" TEXT,
    "isvisible" INTEGER,
    "controlids" TEXT,
    "pluralcontrolids" TEXT,
    "colspan" INTEGER,
    "jsonproperty" VARCHAR(100),
    "css" VARCHAR(100),
    "columns" INTEGER,
    "isplural" DECIMAL(1,0),
    "sectionsortorder" INTEGER
);

-- CreateTable
CREATE TABLE "tblproducttypefield_6_20250830044951" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "page" VARCHAR(255) NOT NULL,
    "inputtype" VARCHAR(100) NOT NULL,
    "datatype" VARCHAR(100),
    "isdynamic" DECIMAL(1,0),
    "subproducttypeid" INTEGER NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "required" INTEGER,
    "parentcode" VARCHAR(255),
    "position" VARCHAR(50),
    "defaultvalue" TEXT,
    "maxlength" INTEGER,
    "optionlist" TEXT,
    "valuelist" TEXT,
    "apiurl" TEXT,
    "postapiurl" TEXT,
    "isvisible" INTEGER,
    "controlids" TEXT,
    "pluralcontrolids" TEXT,
    "colspan" INTEGER,
    "jsonproperty" VARCHAR(100),
    "css" VARCHAR(100),
    "columns" INTEGER,
    "isplural" DECIMAL(1,0),
    "sectionsortorder" INTEGER
);

-- CreateTable
CREATE TABLE "tblproducttypefield_dev_30627" (
    "id" SERIAL NOT NULL,
    "code" VARCHAR(255) NOT NULL,
    "page" VARCHAR(255) NOT NULL,
    "inputtype" VARCHAR(100) NOT NULL,
    "datatype" VARCHAR(100),
    "isdynamic" DECIMAL(1,0),
    "subproducttypeid" INTEGER NOT NULL,
    "sortorder" INTEGER NOT NULL,
    "required" INTEGER,
    "parentcode" VARCHAR(255),
    "position" VARCHAR(50),
    "defaultvalue" TEXT,
    "maxlength" INTEGER,
    "optionlist" TEXT,
    "valuelist" TEXT,
    "apiurl" TEXT,
    "postapiurl" TEXT,
    "isvisible" INTEGER,
    "controlids" TEXT,
    "pluralcontrolids" TEXT,
    "colspan" INTEGER,
    "jsonproperty" VARCHAR(100),
    "css" VARCHAR(100),
    "columns" INTEGER,
    "isplural" DECIMAL(1,0),
    "sectionsortorder" INTEGER
);

-- CreateTable
CREATE TABLE "tblproducttypefieldlabel" (
    "id" SERIAL NOT NULL,
    "producttypefieldcode" VARCHAR(255) NOT NULL,
    "label" TEXT NOT NULL,
    "plurallabel" TEXT,
    "tooltip" TEXT,
    "subproducttypeid" INTEGER NOT NULL,
    "description" TEXT,

    CONSTRAINT "pk_tblproducttypefieldlabel_1827745814" PRIMARY KEY ("id","producttypefieldcode","subproducttypeid")
);

-- CreateTable
CREATE TABLE "tblproducttypefieldlabel_4_20250830050055" (
    "id" SERIAL NOT NULL,
    "producttypefieldcode" VARCHAR(255) NOT NULL,
    "label" TEXT NOT NULL,
    "plurallabel" TEXT,
    "tooltip" TEXT,
    "subproducttypeid" INTEGER NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblproducttypefieldlabel_6_20250830044951" (
    "id" SERIAL NOT NULL,
    "producttypefieldcode" VARCHAR(255) NOT NULL,
    "label" TEXT NOT NULL,
    "plurallabel" TEXT,
    "tooltip" TEXT,
    "subproducttypeid" INTEGER NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblproducttypefieldlabel_backup_dev33377" (
    "id" SERIAL NOT NULL,
    "producttypefieldcode" VARCHAR(255) NOT NULL,
    "label" TEXT NOT NULL,
    "plurallabel" TEXT,
    "tooltip" TEXT,
    "subproducttypeid" INTEGER NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblproposal" (
    "proposalid" SERIAL NOT NULL,
    "gscustomersid" INTEGER,
    "logourl" VARCHAR(255) DEFAULT '',
    "heading" VARCHAR(100) DEFAULT '',
    "repids" VARCHAR(100) DEFAULT '',
    "repnames" VARCHAR(1000) DEFAULT '',
    "pubids" VARCHAR(1000) DEFAULT '',
    "pubnames" VARCHAR(1000) DEFAULT '',
    "publishercontact" VARCHAR(1000) DEFAULT '',
    "agencycontact" VARCHAR(1000) DEFAULT '',
    "advertisercontact" VARCHAR(1000) DEFAULT '',
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "updatedbyid" INTEGER,
    "iscontract" DECIMAL(1,0) DEFAULT 0,
    "gsactivitiesid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblproposal_1609108823" PRIMARY KEY ("proposalid")
);

-- CreateTable
CREATE TABLE "tblproposalapproval" (
    "approvalid" SERIAL NOT NULL,
    "proposalid" INTEGER NOT NULL,
    "approvedby" INTEGER,
    "approveddate" TIMESTAMP(6),
    "approvername" VARCHAR(100),
    "approversignatureurl" VARCHAR(2000),
    "userapproveddate" TIMESTAMP(6),
    "useripaddress" VARCHAR(100),
    "unapprovedby" INTEGER,
    "unapproveddate" TIMESTAMP(6),
    "replyletterbodytext" TEXT,
    "replylettertemplateid" INTEGER,
    "replysubject" VARCHAR(500),
    "referencenumber" VARCHAR(100),
    "devicename" VARCHAR(100),
    "replyccemails" VARCHAR(2000),
    "cuserid" INTEGER,
    "csignurl" VARCHAR(2000),
    "cname" VARCHAR(100),
    "creferencenumber" VARCHAR(100),
    "csentdate" TIMESTAMP(6),
    "capproveddate" TIMESTAMP(6),
    "cipaddress" VARCHAR(100),
    "cdevicename" VARCHAR(100),
    "pagetype" VARCHAR(20),
    "letterbodytext" TEXT,
    "lettertemplateid" INTEGER,
    "emailsubject" VARCHAR(500),
    "createddate" TIMESTAMP(6),

    CONSTRAINT "pk_tblproposalapproval_37119423" PRIMARY KEY ("approvalid")
);

-- CreateTable
CREATE TABLE "tblproposalhistory" (
    "id" SERIAL NOT NULL,
    "proposalid" INTEGER NOT NULL,
    "action" VARCHAR(1050) NOT NULL,
    "actionby" INTEGER NOT NULL,
    "username" VARCHAR(100),
    "actiondate" TIMESTAMP(6) NOT NULL,
    "description" VARCHAR(1050),
    "source" VARCHAR(50),

    CONSTRAINT "pk_tblproposalhistory_850362344" PRIMARY KEY ("id","proposalid")
);

-- CreateTable
CREATE TABLE "tblproposalinsertion" (
    "insertionid" SERIAL NOT NULL,
    "proposalid" INTEGER NOT NULL,
    "createdate" TIMESTAMP(6),
    "gscontractsid" INTEGER,
    "customerid" INTEGER NOT NULL,
    "yr" INTEGER NOT NULL,
    "mnth" INTEGER NOT NULL,
    "pubid" INTEGER NOT NULL,
    "net" DECIMAL(19,4),
    "gross" DECIMAL(19,4),
    "barter" DECIMAL(19,4),
    "adsize" INTEGER,
    "columninches" DECIMAL(18,4),
    "columns" DECIMAL(18,4),
    "adsection" INTEGER,
    "adnotes" VARCHAR(5000),
    "adpositioning" VARCHAR(255),
    "dateadded" TIMESTAMP(6),
    "prodcharge" DOUBLE PRECISION,
    "status1" TIMESTAMP(6),
    "status2" TIMESTAMP(6),
    "status3" TIMESTAMP(6),
    "status4" TIMESTAMP(6),
    "status5" TIMESTAMP(6),
    "status6" TIMESTAMP(6),
    "status8" TIMESTAMP(6),
    "status7" TIMESTAMP(6),
    "adnumber" INTEGER,
    "posreq1" VARCHAR(100),
    "posreq2" DECIMAL(1,0),
    "posreq3" DECIMAL(1,0),
    "posreq4" DECIMAL(1,0),
    "posreq5" INTEGER,
    "acttime" INTEGER,
    "esttime" INTEGER,
    "designer1" INTEGER,
    "designer2" INTEGER,
    "duedate" TIMESTAMP(6),
    "reminderscount" INTEGER,
    "prodnotes" TEXT,
    "color" VARCHAR(50),
    "frequency" VARCHAR(100),
    "cardrate" DECIMAL(19,4),
    "discount" DECIMAL(19,4),
    "ratecardid" INTEGER,
    "adagencydiscount" DECIMAL(1,0),
    "zoneid" INTEGER,
    "adname" VARCHAR(255),
    "pickupcontractid" INTEGER,
    "isbleed" DECIMAL(1,0),
    "repnames" VARCHAR(1000) DEFAULT '',
    "repids" VARCHAR(1000) DEFAULT '',
    "reppercents" VARCHAR(1000) DEFAULT '',
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "autorenew" DECIMAL(1,0) DEFAULT 0,
    "autorenewcanceldate" TIMESTAMP(6),
    "autorenewcancelreason" VARCHAR(2000),
    "autorenewcancelcomment" VARCHAR(2000),
    "autorenewdeactivationdate" TIMESTAMP(6),
    "autorenewrenewed" DECIMAL(1,0) DEFAULT 0,
    "cpm" DECIMAL(18,2) DEFAULT 0,
    "description" VARCHAR(500) DEFAULT '',
    "salescontactid" INTEGER,
    "impressions" INTEGER DEFAULT 0,
    "qty" DECIMAL(18,4) DEFAULT 0,
    "price" DECIMAL(18,4) DEFAULT 0,
    "impressionsactual" INTEGER DEFAULT 0,
    "qtyactual" INTEGER DEFAULT 0,
    "digitalpositionid" INTEGER DEFAULT -1,
    "sortorder" INTEGER,
    "adagencypercentage" DECIMAL(18,6),
    "billingcontacts" VARCHAR(1000) DEFAULT '',
    "addataid" INTEGER,
    "adcolumn" INTEGER,
    "adinch" DECIMAL(10,5),
    "totalcolumninches" DECIMAL(10,5),
    "isinchdropdown" DECIMAL(1,0) DEFAULT 0,
    "gbsessionid" VARCHAR(100),
    "gbmappingid" INTEGER,
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "insertionsource" VARCHAR(30),

    CONSTRAINT "pk_tblproposalinsertion_1680165181" PRIMARY KEY ("insertionid")
);

-- CreateTable
CREATE TABLE "tblproposalinsertion_03132025" (
    "insertionid" SERIAL NOT NULL,
    "proposalid" INTEGER NOT NULL,
    "createdate" TIMESTAMP(6),
    "gscontractsid" INTEGER,
    "customerid" INTEGER NOT NULL,
    "yr" INTEGER NOT NULL,
    "mnth" INTEGER NOT NULL,
    "pubid" INTEGER NOT NULL,
    "net" DECIMAL(19,4),
    "gross" DECIMAL(19,4),
    "barter" DECIMAL(19,4),
    "adsize" INTEGER,
    "columninches" DECIMAL(18,4),
    "columns" DECIMAL(18,4),
    "adsection" INTEGER,
    "adnotes" VARCHAR(5000),
    "adpositioning" VARCHAR(255),
    "dateadded" TIMESTAMP(6),
    "prodcharge" DOUBLE PRECISION,
    "status1" TIMESTAMP(6),
    "status2" TIMESTAMP(6),
    "status3" TIMESTAMP(6),
    "status4" TIMESTAMP(6),
    "status5" TIMESTAMP(6),
    "status6" TIMESTAMP(6),
    "status8" TIMESTAMP(6),
    "status7" TIMESTAMP(6),
    "adnumber" INTEGER,
    "posreq1" VARCHAR(100),
    "posreq2" DECIMAL(1,0),
    "posreq3" DECIMAL(1,0),
    "posreq4" DECIMAL(1,0),
    "posreq5" INTEGER,
    "acttime" INTEGER,
    "esttime" INTEGER,
    "designer1" INTEGER,
    "designer2" INTEGER,
    "duedate" TIMESTAMP(6),
    "reminderscount" INTEGER,
    "prodnotes" TEXT,
    "color" VARCHAR(50),
    "frequency" VARCHAR(100),
    "cardrate" DECIMAL(19,4),
    "discount" DECIMAL(19,4),
    "ratecardid" INTEGER,
    "adagencydiscount" DECIMAL(1,0),
    "zoneid" INTEGER,
    "adname" VARCHAR(255),
    "pickupcontractid" INTEGER,
    "isbleed" DECIMAL(1,0),
    "repnames" VARCHAR(1000),
    "repids" VARCHAR(1000),
    "reppercents" VARCHAR(1000),
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "autorenew" DECIMAL(1,0),
    "autorenewcanceldate" TIMESTAMP(6),
    "autorenewcancelreason" VARCHAR(2000),
    "autorenewcancelcomment" VARCHAR(2000),
    "autorenewdeactivationdate" TIMESTAMP(6),
    "autorenewrenewed" DECIMAL(1,0),
    "cpm" DECIMAL(18,2),
    "description" VARCHAR(500),
    "salescontactid" INTEGER,
    "impressions" INTEGER,
    "qty" DECIMAL(18,4),
    "price" DECIMAL(18,4),
    "impressionsactual" INTEGER,
    "qtyactual" INTEGER,
    "digitalpositionid" INTEGER,
    "sortorder" INTEGER,
    "adagencypercentage" DECIMAL(18,6),
    "billingcontacts" VARCHAR(1000),
    "addataid" INTEGER,
    "adcolumn" INTEGER,
    "adinch" DECIMAL(10,5),
    "totalcolumninches" DECIMAL(10,5),
    "isinchdropdown" DECIMAL(1,0),
    "gbsessionid" VARCHAR(100),
    "gbmappingid" INTEGER,
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "insertionsource" VARCHAR(30)
);

-- CreateTable
CREATE TABLE "tblproposalinsertiondeleted" (
    "insertionid" INTEGER NOT NULL,
    "proposalid" INTEGER NOT NULL,
    "deletedby" INTEGER NOT NULL,
    "deletedon" TIMESTAMP(6) NOT NULL,
    "jsondata" TEXT,

    CONSTRAINT "pk_tblproposalinsertiondeleted_1758889583" PRIMARY KEY ("insertionid")
);

-- CreateTable
CREATE TABLE "tblproposalinsertiondisplay" (
    "displayid" SERIAL NOT NULL,
    "proposalid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblproposalinsertiondisplayfields_1641108937" PRIMARY KEY ("displayid")
);

-- CreateTable
CREATE TABLE "tblproposallineitemtemplate" (
    "id" SERIAL NOT NULL,
    "proposalid" INTEGER NOT NULL,
    "thumbnailimage" TEXT,
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "createddate" TIMESTAMP(6),

    CONSTRAINT "pk_tblproposallineitemtemplate_1125123299" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproposalsignatures" (
    "id" SERIAL NOT NULL,
    "proposalid" INTEGER,
    "footer" VARCHAR(100) DEFAULT '',
    "datefooter" VARCHAR(100) DEFAULT '',
    "side" VARCHAR(100) DEFAULT 'left',
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblproposalsignatures_1657108994" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblproposaltextblock" (
    "id" SERIAL NOT NULL,
    "proposalid" INTEGER,
    "html" TEXT DEFAULT '',
    "sortorder" INTEGER DEFAULT 0,

    CONSTRAINT "pk_tblproposaltextblock_1673109051" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblprospectstages" (
    "stageid" SERIAL NOT NULL,
    "stagename" VARCHAR(100),
    "colorcode" VARCHAR(10),
    "sortorder" INTEGER NOT NULL,

    CONSTRAINT "pk__tblprosp__03eb7ad818b8a067" PRIMARY KEY ("stageid")
);

-- CreateTable
CREATE TABLE "tblpub2inv" (
    "pubid" INTEGER NOT NULL,
    "issueid" INTEGER NOT NULL,
    "adsizeid" INTEGER NOT NULL,
    "ratecardid" INTEGER,
    "inv" DOUBLE PRECISION,
    "adpositionid" INTEGER,
    "adsectionid" INTEGER
);

-- CreateTable
CREATE TABLE "tblpub2inv_dev_32463_060725" (
    "pubid" INTEGER NOT NULL,
    "issueid" INTEGER NOT NULL,
    "adsizeid" INTEGER NOT NULL,
    "ratecardid" INTEGER,
    "inv" DOUBLE PRECISION,
    "adpositionid" INTEGER,
    "adsectionid" INTEGER
);

-- CreateTable
CREATE TABLE "tblpublication2magazine" (
    "publication2magazineid" SERIAL NOT NULL,
    "publicationid" INTEGER,
    "magazineid" INTEGER,
    "revenueequiv" DECIMAL(18,2),

    CONSTRAINT "pk_tblpublication2magazine_1554104577" PRIMARY KEY ("publication2magazineid")
);

-- CreateTable
CREATE TABLE "tblpublicsitepage" (
    "id" SERIAL NOT NULL,
    "html" TEXT DEFAULT '',
    "pagetitle" VARCHAR(255) DEFAULT '',
    "headerimageurl" VARCHAR(255) DEFAULT '',
    "headerimagealt" VARCHAR(255) DEFAULT '',
    "footer" TEXT DEFAULT '',
    "stylesheet" VARCHAR(255) DEFAULT '',
    "isvisible" DECIMAL(1,0) DEFAULT 0,
    "parentid" INTEGER DEFAULT -1,
    "sortorder" INTEGER,
    "datecreated" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "datemodified" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "lastmodby" INTEGER,
    "displaynavbar" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk_tblpublicsitecontent_1927782025" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpubschedule" (
    "id" SERIAL NOT NULL,
    "pubid" INTEGER NOT NULL,
    "issueid" INTEGER NOT NULL,
    "mailinglistclosedate" TIMESTAMP(6),
    "spacereservationdeadline" TIMESTAMP(6),
    "admaterialdeadline" TIMESTAMP(6),
    "filesshippedtoprinter" TIMESTAMP(6),
    "proofsarrivefromprinter" TIMESTAMP(6),
    "periodicalsshippedfromprinter" TIMESTAMP(6),
    "accountingclosedate" TIMESTAMP(6),
    "onsaledate" TIMESTAMP(6),
    "volume" VARCHAR(100),
    "printquantity" INTEGER,

    CONSTRAINT "pk_tblpubschedule_1059027054" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblpubsection2form" (
    "id" SERIAL NOT NULL,
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "pubsectionid" INTEGER NOT NULL,
    "formid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblpubsection2form_1138103095" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblqbaccounts" (
    "id" SERIAL NOT NULL,
    "quickbooksaccountid" VARCHAR(50),
    "acctname" VARCHAR(100),
    "accttype" VARCHAR(100),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "active" DECIMAL(1,0),

    CONSTRAINT "pk_tblqbaccounts_1643973033" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblqbadvertisercontext" (
    "advertiserid" INTEGER NOT NULL,
    "context" VARCHAR(100),
    "isdeleted" DECIMAL(1,0) NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblqbclasses" (
    "id" SERIAL NOT NULL,
    "quickbooksclassid" VARCHAR(50),
    "classname" VARCHAR(100),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "active" DECIMAL(1,0) NOT NULL DEFAULT 1,
    "categoryid" VARCHAR(100),

    CONSTRAINT "pk_tblqbclasses_1691973204" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblqbcodes" (
    "id" SERIAL NOT NULL,
    "pubid" INTEGER DEFAULT -1,
    "ratecardid" INTEGER DEFAULT -1,
    "chargeid" INTEGER DEFAULT -1,
    "coderevenue" VARCHAR(100) DEFAULT '',
    "codereceivable" VARCHAR(100) DEFAULT '',
    "classrevenue" VARCHAR(100) DEFAULT '',
    "classreceivable" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblqbcodes_1739973375" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblqbcurrencies" (
    "quickbookscurrencyid" VARCHAR(50) NOT NULL,
    "quickbookscurrencycode" VARCHAR(10) NOT NULL,
    "quickbookscurrencyname" VARCHAR(100),
    "isactive" DECIMAL(1,0),
    "updateddate" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "tblqbcustomer" (
    "customerid" SERIAL NOT NULL,
    "quickbookscustomerid" VARCHAR(50),
    "editsequence" VARCHAR(16),
    "companyname" VARCHAR(100),
    "customer" VARCHAR(209) NOT NULL,
    "firstname" VARCHAR(50),
    "lastname" VARCHAR(50),
    "email" VARCHAR(1023),
    "phone" VARCHAR(50),
    "phone2" VARCHAR(25),
    "phone3" VARCHAR(25),
    "fax" VARCHAR(25),
    "street" VARCHAR(2000),
    "street2" VARCHAR(2000),
    "city" VARCHAR(255),
    "st" VARCHAR(255),
    "zip" VARCHAR(50),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "active" DECIMAL(1,0),

    CONSTRAINT "pk_tblqbcustomers_226972035" PRIMARY KEY ("customerid")
);

-- CreateTable
CREATE TABLE "tblqbpaymentmethods" (
    "id" SERIAL NOT NULL,
    "quickbookspaymentmethodid" VARCHAR(50),
    "paymentname" VARCHAR(50),
    "updatedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "active" DECIMAL(1,0),

    CONSTRAINT "pk_tblqbpaymentmethods_1551500756" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblqbtaxes" (
    "id" SERIAL NOT NULL,
    "quickbookstaxid" TEXT NOT NULL,
    "taxname" VARCHAR(100),
    "istaxgroup" DECIMAL(1,0),
    "updateddate" TIMESTAMP(6),
    "isactive" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblqbtaxesmapping" (
    "mmtaxid" INTEGER NOT NULL,
    "quickbookstaxid" TEXT,
    "istaxgroup" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblqbtaxratesmapping" (
    "quickbookstaxcodeid" TEXT NOT NULL,
    "quickbookstaxrateid" TEXT NOT NULL,
    "ratevalue" DECIMAL(18,6),
    "applicableon" VARCHAR(100),
    "taxorder" INTEGER
);

-- CreateTable
CREATE TABLE "tblqbtransaction" (
    "id" SERIAL NOT NULL,
    "loginuserid" INTEGER NOT NULL,
    "transactionrefid" BIGINT NOT NULL,
    "qbrequestid" INTEGER NOT NULL,
    "operationsubtype" VARCHAR(20) NOT NULL,
    "referenceid" INTEGER,
    "initiateddate" TIMESTAMP(6) NOT NULL,
    "updateddate" TIMESTAMP(6) NOT NULL,
    "status" VARCHAR(20) NOT NULL,
    "source" VARCHAR(30),
    "errorinformation" TEXT,
    "processedtransactionrefid" BIGINT,

    CONSTRAINT "pk_tblqbtransaction_1396408244" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblqbxml" (
    "requestid" SERIAL NOT NULL,
    "request" TEXT,
    "response" TEXT,
    "operationtype" INTEGER,
    "id" INTEGER,
    "createdate" TIMESTAMP(6),

    CONSTRAINT "pk_tblqbxml_1890925908" PRIMARY KEY ("requestid")
);

-- CreateTable
CREATE TABLE "tblratecard" (
    "ratecardid" SERIAL NOT NULL,
    "name" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(4000) DEFAULT '',
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "isnet" DECIMAL(1,0) DEFAULT 1,
    "grosspercent" DECIMAL(6,2) DEFAULT 0,
    "usesdaterange" DECIMAL(1,0) DEFAULT 0,
    "subproducttypeid" INTEGER,
    "producttypeid" INTEGER DEFAULT 1,
    "agencydiscounttype" INTEGER,
    "showtexthtml" DECIMAL(1,0) DEFAULT 0,
    "allowinvoicenpayment" DECIMAL(1,0) DEFAULT 0,
    "charperline" INTEGER DEFAULT 0,
    "columninches" DECIMAL(1,0),
    "clssimageremotepath" VARCHAR(300),
    "remoteimageext" VARCHAR(5),
    "baserate" DECIMAL(19,4) DEFAULT 0,
    "includetitleinwordcount" DECIMAL(1,0) DEFAULT 0,
    "freewordscount" INTEGER DEFAULT 0,
    "isagencydiscountenabled" DECIMAL(1,0),
    "ratetype" INTEGER NOT NULL DEFAULT 0,
    "createdby" INTEGER,
    "updatedby" INTEGER,
    "createdon" TIMESTAMP(6),
    "updatedon" TIMESTAMP(6),
    "code" VARCHAR(100),
    "includefooter" DECIMAL(1,0),
    "quantitytype" INTEGER,
    "isautofillcirculationnumber" DECIMAL(1,0),
    "defaultquantity" DECIMAL(18,4) DEFAULT -1,

    CONSTRAINT "pk_tblratecard_1058206920" PRIMARY KEY ("ratecardid")
);

-- CreateTable
CREATE TABLE "tblratecard2adcolor" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "adcolorid" INTEGER NOT NULL,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblratecard2adcolor_1383220228" PRIMARY KEY ("ratecardid","adcolorid")
);

-- CreateTable
CREATE TABLE "tblratecard2adcolumn" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "adcolumnid" INTEGER NOT NULL,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblratecard2adcolumn_1415220342" PRIMARY KEY ("ratecardid","adcolumnid")
);

-- CreateTable
CREATE TABLE "tblratecard2adfrequency" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "frequencyid" INTEGER NOT NULL,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblratecard2adfrequency_1447220456" PRIMARY KEY ("ratecardid","frequencyid")
);

-- CreateTable
CREATE TABLE "tblratecard2adinch" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "adinchid" INTEGER NOT NULL,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblratecard2adinch_1479220570" PRIMARY KEY ("ratecardid","adinchid")
);

-- CreateTable
CREATE TABLE "tblratecard2admaster" (
    "ratecardid" INTEGER NOT NULL,
    "admaster" VARCHAR(20) NOT NULL,
    "isrequired" INTEGER NOT NULL,

    CONSTRAINT "pk_tblratecard2admaster_1331744047" PRIMARY KEY ("ratecardid","admaster")
);

-- CreateTable
CREATE TABLE "tblratecard2adposition" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "positionid" INTEGER NOT NULL,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblratecard2adposition_1511220684" PRIMARY KEY ("ratecardid","positionid")
);

-- CreateTable
CREATE TABLE "tblratecard2adsection" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "adsectionid" INTEGER NOT NULL,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblratecard2adsection_1543220798" PRIMARY KEY ("ratecardid","adsectionid")
);

-- CreateTable
CREATE TABLE "tblratecard2adsize" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "adsizeid" INTEGER NOT NULL,
    "sortorder" INTEGER,
    "height" DECIMAL(18,4),
    "width" DECIMAL(18,4),
    "unit" VARCHAR(50),

    CONSTRAINT "pk_tblratecard2adsize_1575220912" PRIMARY KEY ("ratecardid","adsizeid")
);

-- CreateTable
CREATE TABLE "tblratecard2multicurrency" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "multicurrencyid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblratecard2multicurrency_1731029448" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblratecard2publication" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "pubid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblratecard2publication_1607221026" PRIMARY KEY ("ratecardid","pubid")
);

-- CreateTable
CREATE TABLE "tblratecard2tax" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "taxid" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "tblratecard2webadposition" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "positionid" INTEGER NOT NULL,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblratecard2webadposition_1639221140" PRIMARY KEY ("ratecardid","positionid")
);

-- CreateTable
CREATE TABLE "tblratecardentry" (
    "ratecardentryid" SERIAL NOT NULL,
    "ratecardid" INTEGER DEFAULT -1,
    "adsizeid" INTEGER DEFAULT -1,
    "adcolorid" INTEGER DEFAULT -1,
    "adfrequencyid" INTEGER DEFAULT -1,
    "adpositionid" INTEGER DEFAULT -1,
    "rate" DECIMAL(19,4) DEFAULT -1,
    "adsectionid" INTEGER,
    "webadpositionid" INTEGER DEFAULT -1,
    "multicurrencyid" INTEGER,
    "tieredpricingmodelid" INTEGER,

    CONSTRAINT "pk_tblratecardentry_1586104691" PRIMARY KEY ("ratecardentryid")
);

-- CreateTable
CREATE TABLE "tblratecardentry_dev_29474" (
    "ratecardentryid" SERIAL NOT NULL,
    "ratecardid" INTEGER,
    "adsizeid" INTEGER,
    "adcolorid" INTEGER,
    "adfrequencyid" INTEGER,
    "adpositionid" INTEGER,
    "rate" DECIMAL(19,4),
    "adsectionid" INTEGER,
    "webadpositionid" INTEGER,
    "multicurrencyid" INTEGER,
    "tieredpricingmodelid" INTEGER
);

-- CreateTable
CREATE TABLE "tblratecardinventry" (
    "ratecardentryid" SERIAL NOT NULL,
    "ratecardid" INTEGER DEFAULT -1,
    "adsizeid" INTEGER DEFAULT -1,
    "adcolorid" INTEGER DEFAULT -1,
    "adfrequencyid" INTEGER DEFAULT -1,
    "adpositionid" INTEGER DEFAULT -1,
    "inv" DECIMAL(19,4) DEFAULT -1,
    "inventory" INTEGER,
    "webadpositionid" INTEGER,

    CONSTRAINT "pk_tblratecardinventry_1457544376" PRIMARY KEY ("ratecardentryid")
);

-- CreateTable
CREATE TABLE "tblratecardlink" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "linkedratecardid" INTEGER NOT NULL DEFAULT 0,
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "islinked" DECIMAL(1,0) NOT NULL,

    CONSTRAINT "pk__tblratec__a19f175829cdc9f9" PRIMARY KEY ("ratecardid","linkedratecardid")
);

-- CreateTable
CREATE TABLE "tblratecardpricingmodel" (
    "id" SERIAL NOT NULL,
    "ratecardid" INTEGER NOT NULL,
    "baserate" DECIMAL(18,2) NOT NULL,
    "startunit" DECIMAL(18,2) NOT NULL,
    "endunit" DECIMAL(18,2) NOT NULL,

    CONSTRAINT "pk_tblratecardpricingmodel_1674697264" PRIMARY KEY ("id","ratecardid")
);

-- CreateTable
CREATE TABLE "tblrep2customer" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER NOT NULL,
    "gsemployeesid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblrep2customer_690869578" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblrep2customercolumnsview" (
    "id" SERIAL NOT NULL,
    "repid" INTEGER,
    "nameofview" VARCHAR(100),
    "columnsvisiblecriteria" TEXT,
    "dbquerycolumns" TEXT,
    "isdefault" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblrep2customersearchfieldsconfig" (
    "configid" INTEGER,
    "repid" INTEGER,
    "fieldviewconfig" XML
);

-- CreateTable
CREATE TABLE "tblreport" (
    "reportid" INTEGER NOT NULL,
    "sourcereportid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "datasource" VARCHAR(100) DEFAULT '',
    "customfieldsdisplaypage" VARCHAR(500) DEFAULT ''
);

-- CreateTable
CREATE TABLE "tblreportactivitymodulereportsetting" (
    "reportsettingid" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "ispublic" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0) NOT NULL,
    "displayreps" VARCHAR(100) NOT NULL,
    "repsprimaryaxis" TEXT NOT NULL,
    "showsummarytotal" DECIMAL(1,0) NOT NULL,
    "secondaryaxis" TEXT NOT NULL,
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "showaverage" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblreportactivitymodulereportsetting_1537648771" PRIMARY KEY ("reportsettingid")
);

-- CreateTable
CREATE TABLE "tblreportactivitymodulereportsetting2usermapping" (
    "userid" INTEGER NOT NULL,
    "reportsettingid" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0) NOT NULL,

    CONSTRAINT "pk_tblreportactivitymodulereportsetting2usermapping_1585648942" PRIMARY KEY ("userid")
);

-- CreateTable
CREATE TABLE "tblreportcriteria" (
    "criteriaid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "sortorder" CHAR(10),

    CONSTRAINT "pk_tblreportcriteria_1348251908" PRIMARY KEY ("criteriaid")
);

-- CreateTable
CREATE TABLE "tblreportcriteriafields" (
    "fieldid" SERIAL NOT NULL,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "inputtype" VARCHAR(100) DEFAULT '',
    "fieldname" VARCHAR(100) DEFAULT '',
    "datasource" VARCHAR(100) DEFAULT '',
    "parameters" VARCHAR(100) DEFAULT '',
    "datatextfield" VARCHAR(100) DEFAULT '',
    "datavaluefield" VARCHAR(100) DEFAULT '',
    "optionlist" VARCHAR(7000) DEFAULT '',
    "width" INTEGER DEFAULT -1,
    "height" INTEGER DEFAULT -1,
    "reportid" INTEGER,
    "sqlwhere" VARCHAR(500) DEFAULT '',
    "defaultitemtext" VARCHAR(100) DEFAULT '',
    "defaultvalue" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblreportcriteriafields_1568776696" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblreportcustomer" (
    "reportid" SERIAL NOT NULL,
    "name" VARCHAR(100) DEFAULT '',
    "datasource" VARCHAR(100) DEFAULT '',
    "customfieldsdisplaypage" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblreportcustomer_761769771" PRIMARY KEY ("reportid")
);

-- CreateTable
CREATE TABLE "tblreportcustomercriteria" (
    "criteriaid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblreportcustomercriteria_249767947" PRIMARY KEY ("criteriaid")
);

-- CreateTable
CREATE TABLE "tblreportcustomerdisplay" (
    "displayid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "sortorder" INTEGER,
    "header" VARCHAR(100) DEFAULT '',
    "total" DECIMAL(1,0) DEFAULT 0,
    "average" DECIMAL(1,0) DEFAULT 0,
    "Group" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblreportcustomerdisplay_313768175" PRIMARY KEY ("displayid")
);

-- CreateTable
CREATE TABLE "tblreportcustomerdisplayfields" (
    "fieldid" SERIAL NOT NULL,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "fieldname" VARCHAR(100) DEFAULT '',
    "format" VARCHAR(100) DEFAULT '',
    "reportid" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblreportcustomerdisplayfields_1689109108" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblreportcustomerfields" (
    "fieldid" SERIAL NOT NULL,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "inputtype" VARCHAR(100) DEFAULT '',
    "fieldname" VARCHAR(100) DEFAULT '',
    "datasource" VARCHAR(100) DEFAULT '',
    "parameters" VARCHAR(100) DEFAULT '',
    "datatextfield" VARCHAR(100) DEFAULT '',
    "datavaluefield" VARCHAR(100) DEFAULT '',
    "optionlist" VARCHAR(7000) DEFAULT '',
    "width" INTEGER DEFAULT -1,
    "height" INTEGER DEFAULT -1,
    "reportid" INTEGER DEFAULT -1,
    "sqlwhere" VARCHAR(255),

    CONSTRAINT "pk_tblreportcustomerfields_793769885" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblreportdisplay" (
    "displayid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblreportdisplay_1380252022" PRIMARY KEY ("displayid")
);

-- CreateTable
CREATE TABLE "tblreportdisplayfields" (
    "fieldid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "header" VARCHAR(100) DEFAULT '',
    "fieldname" VARCHAR(500) DEFAULT '',
    "format" VARCHAR(100) DEFAULT '',
    "replace" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblreportdisplayfields_1341299888" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblreportsalesbyreportgoalrange" (
    "id" SERIAL NOT NULL,
    "reportsettingid" INTEGER NOT NULL,
    "frompercentage" DECIMAL(18,0),
    "topercentage" DECIMAL(18,0),
    "colorcode" VARCHAR(10),

    CONSTRAINT "pk_tblreportsalesbyreportgoalrange_506693103" PRIMARY KEY ("id","reportsettingid")
);

-- CreateTable
CREATE TABLE "tblreportsalesbyreportsetting" (
    "reportsettingid" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "ispublic" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0) NOT NULL,
    "groupby" VARCHAR(50),
    "frequency" VARCHAR(50) NOT NULL,
    "comparison" VARCHAR(50) NOT NULL,
    "typeofaccountingdate" VARCHAR(50) NOT NULL,
    "consideramountas" VARCHAR(50) NOT NULL,
    "isshowsummaryrow" DECIMAL(1,0) NOT NULL,
    "isshowsummarycolumn" DECIMAL(1,0) NOT NULL,
    "createdby" INTEGER NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,
    "typeofsalesrep" VARCHAR(20) NOT NULL DEFAULT 'Commission',
    "isgoalenabled" DECIMAL(1,0),
    "goalname" VARCHAR(50),
    "updatedby" INTEGER,
    "updatedon" TIMESTAMP(6),
    "actualforecast" VARCHAR(30),
    "isshowpacing" DECIMAL(1,0),

    CONSTRAINT "pk_tblreportsalesbyreportsetting_1749125522" PRIMARY KEY ("reportsettingid")
);

-- CreateTable
CREATE TABLE "tblreportsalesbyreportsettingusermapping" (
    "id" SERIAL NOT NULL,
    "userid" INTEGER NOT NULL,
    "reportsettingid" INTEGER NOT NULL,
    "isdefault" DECIMAL(1,0) NOT NULL DEFAULT 0,

    CONSTRAINT "pk_tblreportsalesbyreportsettingusermapping_1797125693" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblreportsubscriber" (
    "reportid" SERIAL NOT NULL,
    "name" VARCHAR(100) DEFAULT '',
    "datasource" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblreportsubscriber_1485964370" PRIMARY KEY ("reportid")
);

-- CreateTable
CREATE TABLE "tblreportsubscribercriteria" (
    "criteriaid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblreportsubscribercriteria_1501964427" PRIMARY KEY ("criteriaid")
);

-- CreateTable
CREATE TABLE "tblreportsubscriberdisplay" (
    "displayid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblreportsubscriberdisplay_1517964484" PRIMARY KEY ("displayid")
);

-- CreateTable
CREATE TABLE "tblreportsubscriberdisplayfields" (
    "fieldid" SERIAL NOT NULL,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "fieldname" VARCHAR(100) DEFAULT '',
    "format" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblreportsubscriberdisplayfields_1533964541" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblreportsubscriberfields" (
    "fieldid" SERIAL NOT NULL,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "inputtype" VARCHAR(100) DEFAULT '',
    "fieldname" VARCHAR(100) DEFAULT '',
    "datasource" VARCHAR(100) DEFAULT '',
    "parameters" VARCHAR(100) DEFAULT '',
    "datatextfield" VARCHAR(100) DEFAULT '',
    "datavaluefield" VARCHAR(100) DEFAULT '',
    "optionlist" VARCHAR(7000) DEFAULT '',
    "width" INTEGER DEFAULT -1,
    "height" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblreportsubscriberfields_1549964598" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblreportsubscriptioncriteria" (
    "criteriaid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblreportsubscriptioncriteria_760441833" PRIMARY KEY ("criteriaid")
);

-- CreateTable
CREATE TABLE "tblreportsubscriptiondisplay" (
    "displayid" SERIAL NOT NULL,
    "reportid" INTEGER,
    "fieldtype" VARCHAR(100) DEFAULT '',
    "fieldid" INTEGER,
    "customfieldid" INTEGER,
    "sortorder" INTEGER,

    CONSTRAINT "pk_tblreportsubscriptiondisplay_1000442688" PRIMARY KEY ("displayid")
);

-- CreateTable
CREATE TABLE "tblreportsubscriptiondisplayfields" (
    "fieldid" SERIAL NOT NULL,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "fieldname" VARCHAR(100) DEFAULT '',
    "format" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblreportsubscriptiondisplayfields_920442403" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblreportsubscriptionfields" (
    "fieldid" SERIAL NOT NULL,
    "header" VARCHAR(100) DEFAULT '',
    "sortorder" INTEGER,
    "inputtype" VARCHAR(100) DEFAULT '',
    "fieldname" VARCHAR(100) DEFAULT '',
    "datasource" VARCHAR(100) DEFAULT '',
    "parameters" VARCHAR(100) DEFAULT '',
    "datatextfield" VARCHAR(100) DEFAULT '',
    "datavaluefield" VARCHAR(100) DEFAULT '',
    "optionlist" VARCHAR(7000) DEFAULT '',
    "width" INTEGER DEFAULT -1,
    "height" INTEGER DEFAULT -1,

    CONSTRAINT "pk_tblreportsubscriptionfields_568441149" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblrequiredfields" (
    "fieldid" SERIAL NOT NULL,
    "fieldname" VARCHAR(255) NOT NULL,
    "requiredfield" INTEGER NOT NULL,
    "displaypage" VARCHAR(255),
    "displayname" VARCHAR(255) NOT NULL,
    "featurename" VARCHAR(50),
    "addautonoteonupdate" INTEGER,
    "isadminonly" INTEGER DEFAULT 0,

    CONSTRAINT "pk_tblrequiredfields_597121418" PRIMARY KEY ("fieldid")
);

-- CreateTable
CREATE TABLE "tblrequiredfieldshistory" (
    "id" SERIAL NOT NULL,
    "fieldid" INTEGER,
    "action" VARCHAR(20),
    "actionby" INTEGER,
    "username" VARCHAR(50),
    "actiondate" TIMESTAMP(6),
    "description" VARCHAR(100),
    "source" VARCHAR(20),

    CONSTRAINT "pk__tblrequi__3214ec078d0c5222" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblrsvpevents" (
    "id" SERIAL NOT NULL,
    "siteid" INTEGER NOT NULL DEFAULT 1,
    "createdate" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),
    "eventname" VARCHAR(50) NOT NULL,
    "eventdate" TIMESTAMP(6) NOT NULL,
    "creatorid" INTEGER NOT NULL,

    CONSTRAINT "pk_tblrsvpevents_1170103209" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsalesopportunity" (
    "id" SERIAL NOT NULL,
    "pipelinestageid" INTEGER,
    "gscustomersid" INTEGER,
    "contact" INTEGER,
    "amount" DECIMAL(19,4),
    "productid" INTEGER,
    "description" TEXT,
    "deleted" DECIMAL(1,0),
    "closedate" DATE,
    "roianalysis" DECIMAL(1,0),
    "budgetconfirmed" DECIMAL(1,0),
    "nextstep" TEXT,
    "name" TEXT,
    "owner" INTEGER,
    "assignedto" INTEGER,
    "type" INTEGER,
    "source" TEXT,
    "businessunit" INTEGER,
    "lossreason" INTEGER,
    "notes" TEXT,
    "createddate" TIMESTAMP(6),
    "modifieddate" TIMESTAMP(6),
    "iswon" SMALLINT DEFAULT -1,
    "actualclosedate" DATE,
    "probability" INTEGER,
    "status" VARCHAR(20),
    "salespresenter" TEXT,

    CONSTRAINT "pk_tblsalesopportunity_485068964" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsalesopportunitytoorders" (
    "id" SERIAL NOT NULL,
    "opportunityid" INTEGER NOT NULL,
    "proposalid" INTEGER NOT NULL,
    "orderid" INTEGER NOT NULL,
    "linkeddate" TIMESTAMP(6),

    CONSTRAINT "pk__tblsales__3214ec07397badb1" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsalespipeline" (
    "id" SERIAL NOT NULL,
    "stage" VARCHAR(500),
    "description" TEXT,
    "percentclosed" INTEGER,
    "sortorder" INTEGER,
    "colorcode" VARCHAR(50),
    "cancustomerchange" DECIMAL(1,0),

    CONSTRAINT "pk_tblsalespipeline_517069078" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsavedsearchlist" (
    "savedlistid" SERIAL NOT NULL,
    "name" VARCHAR(200),
    "sortorder" INTEGER NOT NULL,
    "createdate" TIMESTAMP(6),
    "includeids" TEXT,
    "wheresql" TEXT,
    "isdefault" DECIMAL(1,0),
    "createdbyid" INTEGER,
    "listtype" VARCHAR(50),
    "pagetype" INTEGER,
    "searchcriteriajson" TEXT,
    "producttype" INTEGER,

    CONSTRAINT "pk_tblsavedsearchlist_317452405" PRIMARY KEY ("savedlistid")
);

-- CreateTable
CREATE TABLE "tblsearchdata" (
    "isearchid" SERIAL NOT NULL,
    "sreportname" VARCHAR(50),
    "sdatesearch" VARCHAR(500),
    "ssearchdata" TEXT,
    "gsemployeesid" INTEGER NOT NULL,
    "ssummary" TEXT,
    "lastvisitdate" TIMESTAMP(6),
    "scolconf" TEXT,
    "subproducttypeid" INTEGER
);

-- CreateTable
CREATE TABLE "tblsearchfieldconfig" (
    "id" SERIAL NOT NULL,
    "controlid" VARCHAR(200),
    "columnindex" INTEGER,
    "positionindex" INTEGER,
    "name" VARCHAR(200),
    "sectionkey" VARCHAR(200),
    "sectionname" VARCHAR(50),
    "isaccordianrequired" DECIMAL(1,0),
    "componentname" VARCHAR(200),
    "placeholder" VARCHAR(200),
    "fieldname" TEXT,
    "queryvalue" VARCHAR(200),
    "allowexclude" DECIMAL(1,0) DEFAULT 0,
    "allowemptyfilter" DECIMAL(1,0) DEFAULT 0,
    "displaykey" VARCHAR(50),
    "valuekey" VARCHAR(50),
    "plusbutton" DECIMAL(1,0) DEFAULT 0,
    "disableexclude" DECIMAL(1,0) DEFAULT 1,
    "ismulti" DECIMAL(1,0) DEFAULT 0,
    "fromordersearch" DECIMAL(1,0) DEFAULT 0,
    "defaultfiltercodes" TEXT,
    "requesttype" VARCHAR(50) DEFAULT 'GET',
    "items" TEXT,
    "propname" VARCHAR(200),
    "isexpanded" DECIMAL(1,0) DEFAULT 1,
    "isshowmandatory" DECIMAL(1,0) DEFAULT 0,
    "showall" DECIMAL(1,0) DEFAULT 0,
    "issectionshow" DECIMAL(1,0) DEFAULT 1,
    "sectionid" INTEGER,
    "pagetype" INTEGER NOT NULL,
    "modifiedname" VARCHAR(200),
    "allowfilters" DECIMAL(1,0) DEFAULT 1,
    "allowremove" DECIMAL(1,0) DEFAULT 1,
    "tooltip" VARCHAR(1000),
    "isfieldshow" DECIMAL(1,0) DEFAULT 1,
    "rowindex" INTEGER,
    "fieldcode" VARCHAR(1000),
    "isandoperatorrequired" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk__tblsearc__3214ec070a5e6e60" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsearchfieldproducttypemapping" (
    "id" SERIAL NOT NULL,
    "producttype" INTEGER,
    "pagetype" INTEGER NOT NULL,
    "fieldid" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "tblsearchparams" (
    "id" SERIAL NOT NULL,
    "issuccess" DECIMAL(1,0),
    "executiontime" VARCHAR(8),
    "message" TEXT,
    "dateadded" TIMESTAMP(6),
    "searchquery" TEXT,
    "execspstatement" TEXT,
    "loggedinuserid" VARCHAR(20),
    "startindex" INTEGER,
    "lastindex" INTEGER,
    "listofcolumnstobedisplayed" TEXT,
    "primarycontactonly" INTEGER,
    "mailinglistid" INTEGER,
    "sort" TEXT,
    "sendsupportingdata" DECIMAL(1,0),
    "action" VARCHAR(20),
    "repid" TEXT,
    "categoryid" TEXT,
    "contactgroupid" TEXT,
    "contacttype" TEXT,
    "customer" TEXT,
    "contactid" TEXT,
    "name" TEXT,
    "adagency" TEXT,
    "city" TEXT,
    "lastcontactoption" TEXT,
    "lastcontactfromdate" VARCHAR(15),
    "state" TEXT,
    "email" TEXT,
    "phone" VARCHAR(32),
    "priority" TEXT,
    "country" TEXT,
    "county" TEXT,
    "zip" VARCHAR(50),
    "subcontactid" INTEGER,
    "isadagency" INTEGER,
    "ischeckproduction" DECIMAL(1,0),
    "currentcontractid" INTEGER,
    "productid" INTEGER,
    "businessunitid" INTEGER,
    "issueyear" INTEGER,
    "issueid" INTEGER,
    "fromdate" VARCHAR(19),
    "todate" VARCHAR(19),
    "budgetplanfrom" VARCHAR(19),
    "budgetplanto" VARCHAR(19),
    "customfields" XML,
    "whereclause" TEXT,
    "isquicksearch" DECIMAL(1,0),
    "phone2" VARCHAR(32),
    "lastcontacttodate" CHAR(15)
);

-- CreateTable
CREATE TABLE "tblselfserviceportaladimage" (
    "id" SERIAL NOT NULL,
    "checkoutid" INTEGER NOT NULL,
    "imageguid" UUID NOT NULL,
    "imagename" VARCHAR(500) NOT NULL,
    "imagestream" TEXT NOT NULL,
    "createdon" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "pk_tblselfserviceportaladimage_286884339" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblselfserviceportalitem" (
    "id" SERIAL NOT NULL,
    "checkoutid" INTEGER NOT NULL,
    "itemtype" VARCHAR(50) NOT NULL,
    "uid" VARCHAR(1000),
    "itemid" INTEGER,
    "itemstatus" VARCHAR(50),
    "originalpaymentid" INTEGER,
    "paymentid" INTEGER,
    "paymentstatus" VARCHAR(50),
    "invoiceasyncid" INTEGER,
    "invoiceid" INTEGER,
    "invoicestatus" VARCHAR(1000),
    "invoicepaymentid" INTEGER,
    "invoicepaymentstatus" TEXT,
    "createdon" TIMESTAMP(6) NOT NULL,
    "updatedon" TIMESTAMP(6),
    "amount" DECIMAL(18,2),
    "planid" INTEGER,

    CONSTRAINT "pk_tblselfserviceportalitem_318884453" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsidebar" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "image" DECIMAL(1,0) DEFAULT 0,
    "imageurl" VARCHAR(100) DEFAULT '',
    "calendar" DECIMAL(1,0) DEFAULT 1,
    "searchcustomer" DECIMAL(1,0) DEFAULT 1,
    "searchlastname" DECIMAL(1,0) DEFAULT 1,
    "searchrep" DECIMAL(1,0) DEFAULT 1,
    "salesgoals" DECIMAL(1,0) DEFAULT 1,
    "runsheet" DECIMAL(1,0) DEFAULT 1,
    "letters" DECIMAL(1,0) DEFAULT 1,
    "todo" DECIMAL(1,0) DEFAULT 1,
    "production" DECIMAL(1,0) DEFAULT 1,
    "customproduction" DECIMAL(1,0) DEFAULT 1,
    "contractexpirations" DECIMAL(1,0) DEFAULT 1,
    "complist" DECIMAL(1,0) DEFAULT 1,
    "proposals" DECIMAL(1,0) DEFAULT 1,
    "calendarlink" DECIMAL(1,0) DEFAULT 0,
    "weekevents" DECIMAL(1,0) DEFAULT 1,
    "link1" DECIMAL(1,0) DEFAULT 0,
    "link1url" VARCHAR(255) DEFAULT '',
    "link2" DECIMAL(1,0) DEFAULT 0,
    "link2url" VARCHAR(255) DEFAULT '',
    "link3" DECIMAL(1,0) DEFAULT 0,
    "link3url" VARCHAR(255) DEFAULT '',
    "sortorder" INTEGER,
    "contactlink" DECIMAL(1,0) DEFAULT 1,
    "letterlink" DECIMAL(1,0) DEFAULT 1,
    "flatplan" DECIMAL(1,0) DEFAULT 1,
    "roleid" INTEGER
);

-- CreateTable
CREATE TABLE "tblsite" (
    "siteid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "organization" VARCHAR(100) DEFAULT '',
    "webaddress" VARCHAR(100) DEFAULT '',

    CONSTRAINT "pk_tblsite_1186103266" PRIMARY KEY ("siteid")
);

-- CreateTable
CREATE TABLE "tblsplitreps" (
    "id" SERIAL NOT NULL,
    "gscontractsid" INTEGER,
    "gsemployeesid" INTEGER,
    "percentage" DECIMAL(18,2) DEFAULT 100,
    "insertionid" INTEGER DEFAULT -1
);

-- CreateTable
CREATE TABLE "tblsplitrepscontracts" (
    "id" SERIAL NOT NULL,
    "insertionid" INTEGER,
    "gsemployeesid" INTEGER,
    "percentage" DECIMAL(18,2) DEFAULT 100
);

-- CreateTable
CREATE TABLE "tblstandard2customfields" (
    "gscustomersid" INTEGER NOT NULL,
    "spouse" VARCHAR(255),
    "kids" VARCHAR(255),
    "charity" VARCHAR(255),
    "birthdate" TIMESTAMP(6),
    "nickname" VARCHAR(255),
    "homefax" VARCHAR(255)
);

-- CreateTable
CREATE TABLE "tblstate" (
    "id" SERIAL NOT NULL,
    "statecode" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblstatecodemapping" (
    "statecode" VARCHAR(10) NOT NULL,
    "statename" VARCHAR(100) NOT NULL
);

-- CreateTable
CREATE TABLE "tblstatement" (
    "statementid" SERIAL NOT NULL,
    "statementnumber" VARCHAR(100) DEFAULT '',
    "gscustomersid" INTEGER,
    "gsadagencyid" INTEGER DEFAULT -1,
    "total" DECIMAL(19,4) DEFAULT 0,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "statementdate" TIMESTAMP(6),
    "duedate" TIMESTAMP(6),
    "paymentdate" TIMESTAMP(6),
    "updatedbyuserid" INTEGER,
    "upperhtml" TEXT DEFAULT '',
    "lowerhtml" TEXT DEFAULT '',

    CONSTRAINT "pk_tblstatement_1682873112" PRIMARY KEY ("statementid")
);

-- CreateTable
CREATE TABLE "tblstatementdefinition" (
    "statementdefinitionid" SERIAL NOT NULL,
    "description" VARCHAR(1000) DEFAULT '',
    "isdefault" DECIMAL(1,0) DEFAULT 0,
    "upperhtml" TEXT,
    "lowerhtml" TEXT,
    "createdate" TIMESTAMP(6),
    "updatedate" TIMESTAMP(6),
    "updatedbyid" INTEGER,
    "saeditonly" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "upperjson" TEXT,
    "lowerjson" TEXT,
    "isoldtemplate" DECIMAL(1,0) DEFAULT 0,
    "thumbnailimage" TEXT,
    "active" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk_tblstatementdefinition_1874873796" PRIMARY KEY ("statementdefinitionid")
);

-- CreateTable
CREATE TABLE "tblstates" (
    "id" SERIAL NOT NULL,
    "statename" VARCHAR(100)
);

-- CreateTable
CREATE TABLE "tblstylemapping" (
    "stylemappingid" SERIAL NOT NULL,
    "styleid" INTEGER NOT NULL,
    "parentstyleid" INTEGER NOT NULL,
    "inddstylename" VARCHAR(50)
);

-- CreateTable
CREATE TABLE "tblsubbatch" (
    "id" SERIAL NOT NULL,
    "batchnum" VARCHAR(50) NOT NULL,
    "subscriberid" INTEGER,
    "subscriptionid" INTEGER,
    "description" VARCHAR(4000),
    "executedate" TIMESTAMP(6),
    "executedby" INTEGER
);

-- CreateTable
CREATE TABLE "tblsubbatchsettings" (
    "id" SERIAL NOT NULL,
    "fieldname" VARCHAR(50) NOT NULL,
    "friendlyname" VARCHAR(100) NOT NULL,
    "taborder" INTEGER NOT NULL,
    "autoinsert" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "iscustomfield" INTEGER NOT NULL DEFAULT 0
);

-- CreateTable
CREATE TABLE "tblsubmenu" (
    "id" SERIAL NOT NULL,
    "description" VARCHAR(100),
    "main_id" VARCHAR(100),
    "caption" VARCHAR(100),
    "url" VARCHAR(200),

    CONSTRAINT "pk_tblsubmenu_1202103323" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsubscriber" (
    "subscriberid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "contactid" INTEGER NOT NULL,
    "subscribertypeid" INTEGER DEFAULT -1,
    "source" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(4000) DEFAULT '',
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "gscustomersid" INTEGER DEFAULT -1,
    "gsadagencyid" INTEGER,
    "password" VARCHAR(100) DEFAULT '',
    "subscriberfirstname" VARCHAR(100) DEFAULT '',
    "subscriberlastname" VARCHAR(100) DEFAULT '',
    "subscriberprefix" VARCHAR(100) DEFAULT '',
    "subscribersuffix" VARCHAR(100) DEFAULT '',
    "subscribercompanyname" VARCHAR(100) DEFAULT '',
    "subscriberattn" VARCHAR(100) DEFAULT '',
    "subscriberaddress1" VARCHAR(100) DEFAULT '',
    "subscriberaddress2" VARCHAR(100) DEFAULT '',
    "subscribercity" VARCHAR(100) DEFAULT '',
    "subscriberregion" VARCHAR(100) DEFAULT '',
    "subscriberpostalcode" VARCHAR(100) DEFAULT '',
    "subscribercounty" VARCHAR(100) DEFAULT '',
    "subscribercountry" VARCHAR(100) DEFAULT '',
    "subscriberphone" VARCHAR(100) DEFAULT '',
    "subscriberfax" VARCHAR(100) DEFAULT '',
    "subscriberemail" VARCHAR(100) DEFAULT '',
    "subscriberurl" VARCHAR(100) DEFAULT '',
    "importfileid" INTEGER,
    "importid" INTEGER,

    CONSTRAINT "pk_tblsubscriber_1506208516" PRIMARY KEY ("subscriberid")
);

-- CreateTable
CREATE TABLE "tblsubscriber2group" (
    "id" SERIAL NOT NULL,
    "groupid" INTEGER,
    "subscriberid" INTEGER,
    "subscriptionid" INTEGER,
    "addressid" INTEGER
);

-- CreateTable
CREATE TABLE "tblsubscriberdeleted" (
    "id" SERIAL NOT NULL,
    "deletedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "subscriberid" INTEGER,
    "createdate" TIMESTAMP(6),
    "contactid" INTEGER,
    "subscribertypeid" INTEGER DEFAULT -1,
    "source" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(8000) DEFAULT '',
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "gscustomersid" INTEGER DEFAULT -1,
    "gsadagencyid" INTEGER,
    "password" VARCHAR(100) DEFAULT '',
    "subscriberfirstname" VARCHAR(100) DEFAULT '',
    "subscriberlastname" VARCHAR(100) DEFAULT '',
    "subscribercompanyname" VARCHAR(100) DEFAULT '',
    "subscriberattn" VARCHAR(100) DEFAULT '',
    "subscriberaddress1" VARCHAR(100) DEFAULT '',
    "subscriberaddress2" VARCHAR(100) DEFAULT '',
    "subscribercity" VARCHAR(100) DEFAULT '',
    "subscriberregion" VARCHAR(100) DEFAULT '',
    "subscriberpostalcode" VARCHAR(100) DEFAULT '',
    "subscribercountry" VARCHAR(100) DEFAULT '',
    "subscriberprefix" VARCHAR(100) DEFAULT '',
    "subscribersuffix" VARCHAR(100) DEFAULT '',
    "gsemployeesid" INTEGER,

    CONSTRAINT "pk_tblsubscriberdeleted_1_987918641" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsubscribergroup" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100),
    "canedit" DECIMAL(1,0),
    "enabled" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblsubscribertype" (
    "subscribertypeid" SERIAL NOT NULL,
    "subscribertype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblsubscribertype_1_1581964712" PRIMARY KEY ("subscribertypeid")
);

-- CreateTable
CREATE TABLE "tblsubscription" (
    "subscriptionid" SERIAL NOT NULL,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "magazineid" INTEGER NOT NULL,
    "magazinename" VARCHAR(100) DEFAULT '',
    "subscriberid" INTEGER NOT NULL,
    "subscriptiontypeid" INTEGER DEFAULT -1,
    "source" VARCHAR(100) DEFAULT '',
    "giftfromid" INTEGER DEFAULT -1,
    "startissueid" INTEGER,
    "startissue" VARCHAR(100) DEFAULT '',
    "startyear" INTEGER,
    "endissueid" INTEGER,
    "endissuename" VARCHAR(100) DEFAULT '',
    "endyear" INTEGER,
    "orderdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "invoicedate" TIMESTAMP(6),
    "paymentdate" TIMESTAMP(6),
    "canceldate" TIMESTAMP(6),
    "copies" INTEGER DEFAULT 1,
    "price" DECIMAL(19,4) DEFAULT 0,
    "pricedeferred" DECIMAL(19,4) DEFAULT 0,
    "shipping" DECIMAL(19,4) DEFAULT 0,
    "shippingdeferred" DECIMAL(19,4) DEFAULT 0,
    "tax" DECIMAL(19,4) DEFAULT 0,
    "amountpaid" DECIMAL(19,4) DEFAULT 0,
    "paymentmethod" VARCHAR(100) DEFAULT '',
    "cc" VARCHAR(100) DEFAULT '',
    "paymentstatusid" INTEGER DEFAULT -1,
    "billingseriesid" INTEGER DEFAULT -1,
    "billingcommunicationstartdate" TIMESTAMP(6),
    "billingcommunicationnumber" INTEGER DEFAULT 1,
    "renewalseriesid" INTEGER DEFAULT -1,
    "renewalcommunicationstartdate" TIMESTAMP(6),
    "renewalnumber" INTEGER DEFAULT 0,
    "renewalcommunicationnumber" INTEGER DEFAULT 1,
    "campaignid" INTEGER DEFAULT -1,
    "cancellationreason" VARCHAR(1000) DEFAULT '',
    "salesrepid" INTEGER DEFAULT -1,
    "salesrep" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(1000) DEFAULT '',
    "stoprenewalletters" DECIMAL(1,0) DEFAULT 0,
    "sourceid" INTEGER DEFAULT -1,
    "renewaltoid" INTEGER DEFAULT 0,
    "renewalfromid" INTEGER DEFAULT 0,
    "lastissue" VARCHAR(100) DEFAULT '',
    "suspenddate" TIMESTAMP(6),
    "dateverified" TIMESTAMP(6),
    "datequalified" TIMESTAMP(6),
    "importfileid" INTEGER,
    "importid" INTEGER,

    CONSTRAINT "pk_tblsubscription_1168059247" PRIMARY KEY ("subscriptionid")
);

-- CreateTable
CREATE TABLE "tblsubscription2address" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER,
    "addressid" INTEGER,
    "copies" INTEGER,
    "contactid" INTEGER DEFAULT -1,
    "frommonth" INTEGER DEFAULT -1,
    "fromday" INTEGER DEFAULT -1,
    "tomonth" INTEGER DEFAULT -1,
    "today" INTEGER DEFAULT -1,
    "type" VARCHAR(50) DEFAULT 'Subscription',

    CONSTRAINT "pk_tblsubscription2address_1613964826" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsubscriptionbillingcommunication" (
    "billingcommunicationid" SERIAL NOT NULL,
    "billingseriesid" INTEGER,
    "communicationnumber" INTEGER,
    "letterid" INTEGER,
    "sendafterxdays" INTEGER,
    "bymail" DECIMAL(1,0) DEFAULT 1,
    "byemail" DECIMAL(1,0) DEFAULT 0,
    "byfax" DECIMAL(1,0) DEFAULT 0,
    "byphone" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblsubscriptionbillingcommunication_859866130" PRIMARY KEY ("billingcommunicationid")
);

-- CreateTable
CREATE TABLE "tblsubscriptionbillingseries" (
    "billingseriesid" SERIAL NOT NULL,
    "billingseriestypeid" INTEGER DEFAULT -1,
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblsubscriptionbillingseries_875866187" PRIMARY KEY ("billingseriesid")
);

-- CreateTable
CREATE TABLE "tblsubscriptionbillingseriestype" (
    "billingseriestypeid" SERIAL NOT NULL,
    "billingseriestype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblsubscriptionbillingseriestype_891866244" PRIMARY KEY ("billingseriestypeid")
);

-- CreateTable
CREATE TABLE "tblsubscriptioncampaign" (
    "campaignid" SERIAL NOT NULL,
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',
    "mailingdate" TIMESTAMP(6),
    "firstresponsedate" TIMESTAMP(6),
    "printingcostperpiece" DECIMAL(19,4) DEFAULT 0,
    "mailingcostperpiece" DECIMAL(19,4) DEFAULT 0,
    "piecesmailed" INTEGER DEFAULT 0,
    "extracosts" DECIMAL(19,4) DEFAULT 0,
    "extracostsdescription" VARCHAR(1000) DEFAULT '',
    "targetrevenue" DECIMAL(19,4) DEFAULT 0,
    "targetsubscriptions" INTEGER DEFAULT 0,
    "targetrenewals" INTEGER DEFAULT 0,
    "mailinglistpath" VARCHAR(100) DEFAULT '',
    "mailinglistrecordpath" VARCHAR(100) DEFAULT '',
    "mailinglistdescription" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblsubscriptioncampaign_907866301" PRIMARY KEY ("campaignid")
);

-- CreateTable
CREATE TABLE "tblsubscriptiondeleted" (
    "id" SERIAL NOT NULL,
    "deletedate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "subscriptionid" INTEGER,
    "createdate" TIMESTAMP(6),
    "magazineid" INTEGER,
    "magazinename" VARCHAR(100) DEFAULT '',
    "subscriberid" INTEGER,
    "subscriptiontypeid" INTEGER DEFAULT -1,
    "source" VARCHAR(100) DEFAULT '',
    "giftfromid" INTEGER DEFAULT -1,
    "startissueid" INTEGER,
    "startissue" VARCHAR(100) DEFAULT '',
    "startyear" INTEGER,
    "endissueid" INTEGER,
    "endissuename" VARCHAR(100) DEFAULT '',
    "endyear" INTEGER,
    "orderdate" TIMESTAMP(6),
    "invoicedate" TIMESTAMP(6),
    "paymentdate" TIMESTAMP(6),
    "canceldate" TIMESTAMP(6),
    "copies" INTEGER DEFAULT 1,
    "price" DECIMAL(19,4) DEFAULT 0,
    "pricedeferred" DECIMAL(19,4) DEFAULT 0,
    "shipping" DECIMAL(19,4) DEFAULT 0,
    "shippingdeferred" DECIMAL(19,4) DEFAULT 0,
    "tax" DECIMAL(19,4) DEFAULT 0,
    "amountpaid" DECIMAL(19,4) DEFAULT 0,
    "paymentmethod" VARCHAR(100) DEFAULT '',
    "cc" VARCHAR(100) DEFAULT '',
    "paymentstatusid" INTEGER DEFAULT -1,
    "billingseriesid" INTEGER DEFAULT -1,
    "billingcommunicationstartdate" TIMESTAMP(6),
    "billingcommunicationnumber" INTEGER DEFAULT 1,
    "renewalseriesid" INTEGER DEFAULT -1,
    "renewalcommunicationstartdate" TIMESTAMP(6),
    "renewalnumber" INTEGER DEFAULT 0,
    "renewalcommunicationnumber" INTEGER DEFAULT 1,
    "campaignid" INTEGER DEFAULT -1,
    "cancellationreason" VARCHAR(1000) DEFAULT '',
    "salesrepid" INTEGER DEFAULT -1,
    "salesrep" VARCHAR(100) DEFAULT '',
    "notes" VARCHAR(1000) DEFAULT '',
    "stoprenewalletters" DECIMAL(1,0) DEFAULT 0,
    "sourceid" INTEGER DEFAULT -1,
    "renewaltoid" INTEGER DEFAULT 0,
    "renewalfromid" INTEGER DEFAULT 0,
    "lastissue" VARCHAR(100) DEFAULT '',
    "suspenddate" TIMESTAMP(6),
    "dateverified" TIMESTAMP(6),
    "datequalified" TIMESTAMP(6),
    "deletedbyid" INTEGER
);

-- CreateTable
CREATE TABLE "tblsubscriptioninvoicefixlog" (
    "subscriptionid" INTEGER,
    "invoiceid" INTEGER,
    "billingtermamount" DECIMAL(18,2),
    "invoiceamount" DECIMAL(18,2),
    "invoicebarteramount" DECIMAL(18,2),
    "updatedinvoiceamount" DECIMAL(18,2),
    "updatedbarteramount" DECIMAL(18,2),
    "updatedon" TIMESTAMP(6)
);

-- CreateTable
CREATE TABLE "tblsubscriptionrenewalcommunication" (
    "renewalcommunicationid" SERIAL NOT NULL,
    "renewalseriesid" INTEGER,
    "communicationnumber" INTEGER,
    "letterid" INTEGER,
    "sendafterxdays" INTEGER,
    "bymail" DECIMAL(1,0) DEFAULT 1,
    "byemail" DECIMAL(1,0) DEFAULT 0,
    "byfax" DECIMAL(1,0) DEFAULT 0,
    "byphone" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblsubscriptionrenewalcommunication_939866415" PRIMARY KEY ("renewalcommunicationid")
);

-- CreateTable
CREATE TABLE "tblsubscriptionrenewalprices" (
    "renewalpricesid" SERIAL NOT NULL,
    "renewalseriesid" INTEGER,
    "subscriptionnumber" INTEGER,
    "price" DECIMAL(19,4) DEFAULT 0,

    CONSTRAINT "pk_tblsubscriptionrenewalprices_955866472" PRIMARY KEY ("renewalpricesid")
);

-- CreateTable
CREATE TABLE "tblsubscriptionrenewalseries" (
    "renewalseriesid" SERIAL NOT NULL,
    "renewalseriestypeid" INTEGER DEFAULT -1,
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblrenewalseries_971866529" PRIMARY KEY ("renewalseriesid")
);

-- CreateTable
CREATE TABLE "tblsubscriptionrenewalseriestype" (
    "renewalseriestypeid" SERIAL NOT NULL,
    "renewalseriestype" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblsubscriptionrenewalseriestype_987866586" PRIMARY KEY ("renewalseriestypeid")
);

-- CreateTable
CREATE TABLE "tblsubscriptionseries" (
    "seriesid" SERIAL NOT NULL,
    "seriestype" VARCHAR(100) DEFAULT '',
    "name" VARCHAR(100) DEFAULT '',
    "description" VARCHAR(100) DEFAULT '',
    "renewalprice" DECIMAL(19,4) DEFAULT -1,

    CONSTRAINT "pk_tblsubscriptionseries_256055998" PRIMARY KEY ("seriesid")
);

-- CreateTable
CREATE TABLE "tblsubscriptionseriescommunications" (
    "id" SERIAL NOT NULL,
    "subscriptionid" INTEGER,
    "renewalseriesid" INTEGER,
    "billingseriesid" INTEGER,
    "letterid" INTEGER,
    "letternumber" INTEGER,
    "letterdate" TIMESTAMP(6),

    CONSTRAINT "pk_tblsubscriptioncommunications_434152642" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsubscriptionseriesletter" (
    "id" SERIAL NOT NULL,
    "seriesid" INTEGER,
    "letterid" INTEGER,
    "number" INTEGER NOT NULL,
    "sendafterxdays" INTEGER,
    "cancel" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblsubscriptionseriesletter_336056283" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsubscriptionsource" (
    "sourceid" SERIAL NOT NULL,
    "source" VARCHAR(100) DEFAULT '',
    "price" DECIMAL(19,4) DEFAULT -1,
    "startdate" TIMESTAMP(6),
    "enddate" TIMESTAMP(6),
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "renewalseriesid" INTEGER DEFAULT -1,
    "billingseriesid" INTEGER DEFAULT -1,
    "description" VARCHAR(1000) DEFAULT '',
    "subscribertypeid" INTEGER,
    "magazineids" VARCHAR(1000) DEFAULT '',
    "complist" DECIMAL(1,0) DEFAULT 0,
    "magazineid" INTEGER DEFAULT -1,
    "price2" DECIMAL(19,4) DEFAULT -1,
    "price3" DECIMAL(19,4) DEFAULT -1,
    "imageurl" VARCHAR(100) DEFAULT '',
    "sidebarimageurl1" VARCHAR(100) DEFAULT '',
    "sidebarimageurl2" VARCHAR(100) DEFAULT '',
    "sidebarimageurl3" VARCHAR(100) DEFAULT '',
    "pagefooternotes" VARCHAR(4000) DEFAULT '',
    "totalcost" DECIMAL(19,4),
    "totalpieces" INTEGER,
    "campaigndate" TIMESTAMP(6),
    "campaignmedia" INTEGER,
    "customfieldlist" VARCHAR(4000),

    CONSTRAINT "pk_tblsubscribersource_14727205" PRIMARY KEY ("sourceid")
);

-- CreateTable
CREATE TABLE "tblsubscriptionsourcecampaignmedia" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(90) NOT NULL,

    CONSTRAINT "pk_tblsubscriptionsourcecampaignmedia_642153383" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsubscriptiontype" (
    "subscriptiontypeid" SERIAL NOT NULL,
    "subscriptiontype" VARCHAR(100) DEFAULT '',
    "iscomp" DECIMAL(1,0) DEFAULT 0,
    "description" VARCHAR(1000) DEFAULT '',

    CONSTRAINT "pk_tblsubscribertype_1661964997" PRIMARY KEY ("subscriptiontypeid")
);

-- CreateTable
CREATE TABLE "tblsummaryemailfrequency" (
    "id" SERIAL NOT NULL,
    "frequency" INTEGER NOT NULL,
    "summaryemailid" INTEGER NOT NULL,
    "hour" INTEGER NOT NULL,
    "weekday" INTEGER,
    "monthday" INTEGER,
    "month" INTEGER,
    "isdefault" DECIMAL(1,0) NOT NULL,

    CONSTRAINT "pk__tblsumma__3214ec273f73b2d2" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblsummeryreportemail" (
    "id" INTEGER NOT NULL,
    "title" VARCHAR(3000) NOT NULL,
    "category" VARCHAR(500) NOT NULL,
    "description" TEXT NOT NULL,
    "subject" VARCHAR(1000) NOT NULL,
    "storedprocedure" VARCHAR(500) NOT NULL,
    "templatepath" VARCHAR(1000) NOT NULL,
    "typeparameter" INTEGER,
    "helpnotes" TEXT,

    CONSTRAINT "pk__tmp_ms_x__3214ec2739bad97c" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltaskhistory" (
    "id" SERIAL NOT NULL,
    "taskid" INTEGER NOT NULL,
    "gsemployeesid" INTEGER NOT NULL,
    "notetext" VARCHAR(2000) NOT NULL,
    "dateadded" TIMESTAMP(6) NOT NULL DEFAULT clock_timestamp(),

    CONSTRAINT "pk_tbltaskhistory_1707921206" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltaskselectlist" (
    "tskselectid" SERIAL NOT NULL,
    "tskname" VARCHAR(100),
    "tskselecttype" VARCHAR(100),
    "sortorder" INTEGER
);

-- CreateTable
CREATE TABLE "tbltasktype" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100),

    CONSTRAINT "pk__tbltaskt__3214ec073b3c5946" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltax" (
    "taxid" SERIAL NOT NULL,
    "adjustmentid" INTEGER NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" VARCHAR(1000),
    "amount" DECIMAL(18,5),
    "ispercentage" DECIMAL(1,0) NOT NULL,
    "displayname" VARCHAR(100),
    "isactive" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk_tbltax_537313224" PRIMARY KEY ("taxid")
);

-- CreateTable
CREATE TABLE "tbltaxgroup" (
    "id" SERIAL NOT NULL,
    "groupname" VARCHAR(50) NOT NULL,
    "country" VARCHAR(50),
    "state" VARCHAR(10),
    "city" VARCHAR(50),
    "isapplytaxautomatically" DECIMAL(1,0),
    "displayname" VARCHAR(100),
    "isactive" DECIMAL(1,0) DEFAULT 1,

    CONSTRAINT "pk__tbltaxgr__3214ec27c19aca39" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltaxgroup2product" (
    "id" SERIAL NOT NULL,
    "taxgroupid" INTEGER NOT NULL,
    "productid" INTEGER NOT NULL,

    CONSTRAINT "pk_taxgroup2product_1819413801" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltaxgroupmapping" (
    "id" SERIAL NOT NULL,
    "taxgroupid" INTEGER,
    "taxid" INTEGER,
    "taxtype" VARCHAR(50),
    "taxorderid" INTEGER,

    CONSTRAINT "pk__tbltaxgr__3214ec27184ab6c8" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltaxmapping" (
    "id" INTEGER NOT NULL,
    "type" VARCHAR(25) NOT NULL,
    "taxid" INTEGER NOT NULL,
    "groupid" INTEGER,

    CONSTRAINT "ck_tbltaxmapping_1518172704" PRIMARY KEY ("id","type","taxid")
);

-- CreateTable
CREATE TABLE "tbltemplatechangeorderstyle" (
    "id" SERIAL NOT NULL,
    "definitionid" INTEGER,
    "changeorderid" INTEGER,
    "headerstyle" TEXT,
    "lineitemstyle" TEXT,
    "footerstyle" TEXT,
    "tablestyle" TEXT,
    "borderstyle" TEXT,
    "lineitemthemeid" INTEGER,
    "templatesettings" TEXT,

    CONSTRAINT "pk_tbltemplatechangeorderstyle_83739601" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltemplateinvoicestyle" (
    "id" SERIAL NOT NULL,
    "definitionid" INTEGER,
    "invoiceid" INTEGER,
    "headerstyle" TEXT,
    "lineitemstyle" TEXT,
    "footerstyle" TEXT,
    "tablestyle" TEXT,
    "borderstyle" TEXT,
    "lineitemthemeid" INTEGER,

    CONSTRAINT "pk_tbltemplateinvoicestyle_1046503007" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltemplatelineitemtheme" (
    "lineitemthemeid" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "themetype" INTEGER NOT NULL,
    "headerstyle" TEXT,
    "lineitemstyle" TEXT,
    "footerstyle" TEXT,
    "tablestyle" TEXT,
    "borderstyle" TEXT,

    CONSTRAINT "pk_tbltemplatelineitemtheme_232596117" PRIMARY KEY ("lineitemthemeid")
);

-- CreateTable
CREATE TABLE "tbltemplatepaymentplanstyle" (
    "id" SERIAL NOT NULL,
    "definitionid" INTEGER,
    "paymentplanid" INTEGER,
    "headerstyle" TEXT,
    "lineitemstyle" TEXT,
    "footerstyle" TEXT,
    "tablestyle" TEXT,
    "borderstyle" TEXT,
    "lineitemthemeid" INTEGER,

    CONSTRAINT "pk_tbltemplatepaymentplanstyle_1078503121" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltemplateprocessingfeesetup" (
    "id" INTEGER NOT NULL,
    "templatetype" VARCHAR(50) NOT NULL,
    "ismaster" DECIMAL(1,0) NOT NULL,
    "isenabled" DECIMAL(1,0),
    "ispercentage" DECIMAL(1,0),
    "fee" DECIMAL(18,6),
    "displaytext" TEXT,

    CONSTRAINT "ck_tbltemplateprocessingfeesetup_1489648600" PRIMARY KEY ("id","templatetype","ismaster")
);

-- CreateTable
CREATE TABLE "tbltemplateproposalstyle" (
    "id" SERIAL NOT NULL,
    "definitionid" INTEGER,
    "proposalid" INTEGER,
    "headerstyle" TEXT,
    "lineitemstyle" TEXT,
    "footerstyle" TEXT,
    "tablestyle" TEXT,
    "borderstyle" TEXT,
    "lineitemthemeid" INTEGER,
    "templatesettings" TEXT,

    CONSTRAINT "pk_tbltemplateproposalstyle_1110503235" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tbltemplatetaxsetup" (
    "id" INTEGER NOT NULL,
    "templatetype" VARCHAR(50) NOT NULL,
    "ismaster" DECIMAL(1,0) NOT NULL,
    "taxpattern" TEXT,
    "isdisplaytotaltax" DECIMAL(1,0),
    "isdisplaytaxdetails" DECIMAL(1,0),
    "totaltaxtext" VARCHAR(100),

    CONSTRAINT "pk_tbltemplatetaxsetup_1154363427" PRIMARY KEY ("id","templatetype","ismaster")
);

-- CreateTable
CREATE TABLE "tbltexteditorstyles" (
    "styleid" SERIAL NOT NULL,
    "name" VARCHAR(50),
    "starttag" VARCHAR(50),
    "endtag" VARCHAR(50),
    "htmlstarttag" VARCHAR(200),
    "htmlendtag" VARCHAR(50),
    "indesignstarttag" VARCHAR(50),
    "indesignendtag" VARCHAR(50),
    "isbutton" DECIMAL(1,0),
    "isactive" DECIMAL(1,0),
    "sortorder" INTEGER,
    "defaulttext" TEXT
);

-- CreateTable
CREATE TABLE "tbltransactionsubscription" (
    "orderid" SERIAL NOT NULL,
    "clientid" INTEGER NOT NULL,
    "subscriptionid" INTEGER,
    "subscriberid" INTEGER,
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "authdate" TIMESTAMP(6),
    "ccname" VARCHAR(100),
    "cclast4" VARCHAR(100),
    "cctype" VARCHAR(100),
    "amount" DECIMAL(19,4),
    "type" VARCHAR(100) DEFAULT '',
    "success" DECIMAL(1,0),

    CONSTRAINT "pk_tbltransactionsubscription_1813633554" PRIMARY KEY ("orderid")
);

-- CreateTable
CREATE TABLE "tblurls" (
    "id" SERIAL NOT NULL,
    "tablecolumn" VARCHAR(255),
    "totalurl" TEXT,
    "oldstring" TEXT,
    "newstring" TEXT,
    "isapplication" DECIMAL(1,0),
    "isexecuted" DECIMAL(1,0),
    "description" TEXT
);

-- CreateTable
CREATE TABLE "tblusercheckin" (
    "usercheckinid" SERIAL NOT NULL,
    "userid" INTEGER NOT NULL,
    "customerid" INTEGER NOT NULL,
    "transactiondate" TIMESTAMP(6) NOT NULL,
    "location" TEXT NOT NULL,
    "latitude" VARCHAR(20) NOT NULL,
    "longitude" VARCHAR(20) NOT NULL,
    "note" TEXT,
    "ispinned" DECIMAL(1,0),

    CONSTRAINT "pk_tblusercheckin_usercheckinid_1706697378" PRIMARY KEY ("usercheckinid")
);

-- CreateTable
CREATE TABLE "tblusergoal" (
    "id" SERIAL NOT NULL,
    "userid" INTEGER NOT NULL,
    "productid" INTEGER NOT NULL,
    "month" INTEGER NOT NULL,
    "year" INTEGER NOT NULL,
    "goalamount" DECIMAL(18,2) NOT NULL,
    "createdate" TIMESTAMP(6),
    "createdby" INTEGER,
    "updatedate" TIMESTAMP(6),
    "updatedby" INTEGER,

    CONSTRAINT "pk_compositepk_combinationcolumns_538693217" PRIMARY KEY ("userid","productid","month","year")
);

-- CreateTable
CREATE TABLE "tbluserrole" (
    "roleid" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "cancreatecontracts" DECIMAL(1,0) NOT NULL,
    "caneditannouncements" DECIMAL(1,0) NOT NULL,
    "caneditgoals" DECIMAL(1,0) NOT NULL,
    "activitydetail" DECIMAL(1,0) NOT NULL,
    "candeletecustomers" INTEGER NOT NULL,
    "enablebatchupdate" INTEGER NOT NULL,
    "notessetting" INTEGER NOT NULL,
    "caneditnotes" INTEGER NOT NULL,
    "candeletenotes" INTEGER NOT NULL,
    "arsettings" INTEGER NOT NULL,
    "caneditorders" DECIMAL(1,0) NOT NULL,
    "cancreatechangeorders" DECIMAL(1,0) NOT NULL,
    "candeleteorders" DECIMAL(1,0) NOT NULL,
    "canapplychangeorders" DECIMAL(1,0) NOT NULL DEFAULT 0,
    "cancreatepaymentplans" DECIMAL(1,0),
    "storecardeditaccess" INTEGER,

    CONSTRAINT "pk_tbluserrole_1306695953" PRIMARY KEY ("roleid")
);

-- CreateTable
CREATE TABLE "tbluserrole02042025" (
    "roleid" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "cancreatecontracts" DECIMAL(1,0) NOT NULL,
    "caneditannouncements" DECIMAL(1,0) NOT NULL,
    "caneditgoals" DECIMAL(1,0) NOT NULL,
    "activitydetail" DECIMAL(1,0) NOT NULL,
    "candeletecustomers" INTEGER NOT NULL,
    "enablebatchupdate" INTEGER NOT NULL,
    "notessetting" INTEGER NOT NULL,
    "caneditnotes" INTEGER NOT NULL,
    "candeletenotes" INTEGER NOT NULL,
    "arsettings" INTEGER NOT NULL,
    "caneditorders" DECIMAL(1,0) NOT NULL,
    "cancreatechangeorders" DECIMAL(1,0) NOT NULL,
    "candeleteorders" DECIMAL(1,0) NOT NULL,
    "canapplychangeorders" DECIMAL(1,0) NOT NULL,
    "cancreatepaymentplans" DECIMAL(1,0)
);

-- CreateTable
CREATE TABLE "tblusersessions" (
    "id" SERIAL NOT NULL,
    "gsemployeesid" INTEGER,
    "sessionid" VARCHAR(50),
    "logintime" TIMESTAMP(6),
    "lastpageaccesstime" TIMESTAMP(6),
    "remote_addr" VARCHAR(50),
    "remote_host" VARCHAR(50),
    "pagecount" INTEGER DEFAULT 1
);

-- CreateTable
CREATE TABLE "tblusersign" (
    "id" SERIAL NOT NULL,
    "userid" INTEGER NOT NULL,
    "url" VARCHAR(2000),
    "name" VARCHAR(100),

    CONSTRAINT "pk_tblusersign_69119537" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadbanners" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100),
    "path" VARCHAR(1000),
    "sizeid" INTEGER,
    "campaignid" INTEGER,
    "selected" DECIMAL(1,0),

    CONSTRAINT "pk_tblwebadbanners_1615448929" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadbillingterms" (
    "id" SERIAL NOT NULL,
    "billingterms" VARCHAR(100) DEFAULT '',
    "description" TEXT DEFAULT '',
    "defaultselection" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblwebadsbillingterms_1647449043" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadcampaign" (
    "id" SERIAL NOT NULL,
    "gscustomersid" INTEGER,
    "gscontractsid" INTEGER,
    "name" VARCHAR(100) DEFAULT '',
    "campaigntypeid" INTEGER,
    "startdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "enddate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "impressions" INTEGER DEFAULT 0,
    "impressionsactual" INTEGER DEFAULT 0,
    "clicks" INTEGER DEFAULT 0,
    "clicksactual" INTEGER DEFAULT 0,
    "actions" INTEGER DEFAULT 0,
    "actionsactual" INTEGER DEFAULT 0,
    "priority" INTEGER DEFAULT 5,
    "url" VARCHAR(1000) DEFAULT '',
    "keywords" TEXT DEFAULT '',
    "pricingmodelid" INTEGER,
    "billingtermsid" INTEGER,
    "net" DECIMAL(19,4) DEFAULT 0,
    "gross" DECIMAL(19,4) DEFAULT 0,
    "barter" DECIMAL(19,4) DEFAULT 0,
    "discount" DECIMAL(19,4) DEFAULT 0,
    "surcharge" DECIMAL(19,4) DEFAULT 0,
    "installments" INTEGER DEFAULT 0,
    "productid" INTEGER,
    "notes" TEXT DEFAULT '',
    "createdate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "deletedate" TIMESTAMP(6),
    "convertdate" TIMESTAMP(6),
    "proposal" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblwebadcampaign_1727449328" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadcampaign2position" (
    "id" SERIAL NOT NULL,
    "campaignid" INTEGER,
    "positionid" INTEGER
);

-- CreateTable
CREATE TABLE "tblwebadcampaign2section" (
    "id" SERIAL NOT NULL,
    "campaignid" INTEGER,
    "sectionid" INTEGER,

    CONSTRAINT "pk_tblwebadcampaign2section_2111450696" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadcampaigntype" (
    "id" SERIAL NOT NULL,
    "campaigntype" VARCHAR(100),
    "description" TEXT,
    "sortorder" INTEGER,
    "defaultselection" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblwebadcampaigntype_2143450810" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadposition" (
    "id" SERIAL NOT NULL,
    "position" VARCHAR(200),
    "description" TEXT,
    "width" INTEGER DEFAULT 0,
    "height" INTEGER DEFAULT 0,
    "subproducttypeid" INTEGER,

    CONSTRAINT "pk_tblwebadposition_753541868" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadpricingmodel" (
    "id" SERIAL NOT NULL,
    "pricingmodel" VARCHAR(100) DEFAULT '',
    "description" TEXT DEFAULT '',
    "defaultselection" DECIMAL(1,0) DEFAULT 0,

    CONSTRAINT "pk_tblwebadspricingmodel_107967561" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadproduct" (
    "id" SERIAL NOT NULL,
    "product" VARCHAR(100) DEFAULT '',
    "description" TEXT DEFAULT '',
    "sections" TEXT DEFAULT '',
    "positions" TEXT DEFAULT '',

    CONSTRAINT "pk_tblwebadproduct_187967846" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebadproduct2position" (
    "id" SERIAL NOT NULL,
    "productid" INTEGER,
    "positionid" INTEGER
);

-- CreateTable
CREATE TABLE "tblwebadproduct2section" (
    "id" SERIAL NOT NULL,
    "productid" INTEGER,
    "sectionid" INTEGER
);

-- CreateTable
CREATE TABLE "tblwebadsection" (
    "id" SERIAL NOT NULL,
    "section" VARCHAR(200) DEFAULT '',
    "description" TEXT DEFAULT '',

    CONSTRAINT "pk_tblwebadsection_315968302" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tblwebcalendarappointment" (
    "autoid" SERIAL NOT NULL,
    "appointmentid" VARCHAR(255) NOT NULL,
    "calendarid" SMALLINT NOT NULL,
    "icaluid" VARCHAR(255),
    "employeeid" INTEGER NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "meetingtype" SMALLINT,
    "startdate" TIMESTAMP(6) NOT NULL,
    "enddate" TIMESTAMP(6) NOT NULL,
    "location" VARCHAR(255),
    "notes" TEXT,
    "url" VARCHAR(255),
    "isallday" DECIMAL(1,0) NOT NULL,
    "reminder" VARCHAR(100),
    "rrule" VARCHAR(255),
    "rexception" VARCHAR(255),
    "duration" INTEGER NOT NULL,
    "originalappointmentid" VARCHAR(100),
    "issyncwithgoogle" DECIMAL(1,0),
    "gsactivityid" INTEGER,
    "syncstatus" VARCHAR(3),
    "contactid" INTEGER
);

-- CreateTable
CREATE TABLE "tblwebcalendarexception" (
    "exception" TEXT,
    "datestamp" TIMESTAMP(6),
    "User" VARCHAR(20),
    "trackinformaiton" TEXT
);

-- CreateTable
CREATE TABLE "tblwebpagesummaries" (
    "id" SERIAL NOT NULL,
    "url" VARCHAR(300) NOT NULL,
    "summary" TEXT,
    "createdtime" TIMESTAMP(6) NOT NULL
);

-- CreateTable
CREATE TABLE "tblworkflowactions" (
    "id" SERIAL NOT NULL,
    "actionname" VARCHAR(255) NOT NULL,
    "description" VARCHAR(500),
    "executiontype" VARCHAR(50) NOT NULL,
    "executionsource" VARCHAR(500),
    "category" VARCHAR(100),
    "isactive" DECIMAL(1,0) DEFAULT 1,
    "createddate" TIMESTAMP(6) DEFAULT clock_timestamp(),
    "requiredarguements" TEXT,

    CONSTRAINT "pk__tblworkf__3214ec274795c49c" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "ix_gsactivities_gsactivities19" ON "gsactivities"("datestarted", "gsemployeesid");

-- CreateIndex
CREATE INDEX "ix_gsactivities_ix_gsactivities20161025_" ON "gsactivities"("gscustomersid", "dateadded");

-- CreateIndex
CREATE INDEX "ix_gsactivities_ix_gsactivities_foradvancesearch_lastcontact" ON "gsactivities"("callback", "meeting", "dateadded", "gscustomersid", "iscall");

-- CreateIndex
CREATE INDEX "ix_gscontacttypedetails_ix_gscontacttypedetails_customertype" ON "gscontacttypedetails"("gscustomersid", "gscontacttypeid");

-- CreateIndex
CREATE INDEX "ix_gscontacttypedetails_ix_gscontacttypedetails_gscustomersid_1" ON "gscontacttypedetails"("gscustomersid");

-- CreateIndex
CREATE INDEX "ix_gscontracts_ix_gscontracts_customerid_mnth_20190401" ON "gscontracts"("customerid", "mnth");

-- CreateIndex
CREATE INDEX "ix_gscontracts_ix_gscontracts_pubid_011124" ON "gscontracts"("pubid", "customerid", "mnth", "net", "barter", "dateadded", "startdate", "enddate");

-- CreateIndex
CREATE INDEX "ix_gscontracts_ix_gscontracts_ratecardid_adsize" ON "gscontracts"("adsize", "ratecardid");

-- CreateIndex
CREATE INDEX "ix_gscontracts_ix_gscontracts_ratecardid_color" ON "gscontracts"("color", "ratecardid");

-- CreateIndex
CREATE INDEX "ix_gscontracts2charges_ix_gscontracts2charges_gscontractsid_110" ON "gscontracts2charges"("gscontractsid");

-- CreateIndex
CREATE INDEX "ix_gscontracts2productioncontact_ix_gscontracts2productionconta" ON "gscontracts2productioncontact"("gscontractsid", "isproposal");

-- CreateIndex
CREATE INDEX "ix_gscontractsdata_ix_gscontractsdata_gscontractsdataid_110716" ON "gscontractsdata"("gscontractsdataid");

-- CreateIndex
CREATE INDEX "ix_gscontractsinstallment_ix_gscontractsinstallment_gscontracts" ON "gscontractsinstallment"("gscontractsid");

-- CreateIndex
CREATE INDEX "ix_gscontractsinstallment_ix_gscontractsinstallment_id_2include" ON "gscontractsinstallment"("id", "installmentamount", "installmentpercentage");

-- CreateIndex
CREATE INDEX "ix_gscontractsnotes_ix_gscontractsnotes_gscontractsid_winclude_" ON "gscontractsnotes"("gscontractsid", "note");

-- CreateIndex
CREATE INDEX "ix_gscustomers_ix_gscustomers_20120706" ON "gscustomers"("parentid", "isagency", "gscustomersid", "customer", "firstname", "lastname", "gsrepid");

-- CreateIndex
CREATE INDEX "ix_gscustomers_ix_gscustomers_email" ON "gscustomers"("email");

-- CreateIndex
CREATE INDEX "ix_gspublications_ix_gspublications_gspublicationid_pubabbrev" ON "gspublications"("gspublicationid", "pubabbrev");

-- CreateIndex
CREATE UNIQUE INDEX "app_product_extras_gspublicationid_key" ON "app_product_extras"("gspublicationid");

-- CreateIndex
CREATE INDEX "app_product_extras_gspublicationid_idx" ON "app_product_extras"("gspublicationid");

-- CreateIndex
CREATE INDEX "ix_pgassetitem_ix_pgassetitem_groupid_isdeleted" ON "pgassetitem"("groupid", "isdeleted");

-- CreateIndex
CREATE INDEX "ix_pgassetitem_ix_pgassetitem_itemid_111016" ON "pgassetitem"("itemid");

-- CreateIndex
CREATE INDEX "ix_pgassetitem_ix_pgassetitem_itemid_parentitemid" ON "pgassetitem"("itemid", "parentitemid");

-- CreateIndex
CREATE INDEX "ix_pgissueplan_ix_pgissueplan_productid_issuenumber_issueyear_f" ON "pgissueplan"("productid", "issuenumber", "issueyear", "folioid");

-- CreateIndex
CREATE INDEX "ix_pgpage_ix_pgpage_dspgid" ON "pgpage"("dspgid");

-- CreateIndex
CREATE INDEX "ix_pgpage_ix_pgpage_fileid" ON "pgpage"("fileid", "pageid");

-- CreateIndex
CREATE INDEX "ix_pgpage_ix_pgpage_fileid_entitytype" ON "pgpage"("fileid", "entitytype", "pageid");

-- CreateIndex
CREATE INDEX "ix_pgpageinsert_ix_pgpageinsert_issueid_inserttype_genericinspg" ON "pgpageinsert"("issueid", "inserttype", "genericinspgid", "entityid");

-- CreateIndex
CREATE UNIQUE INDEX "uq__pgworkgr__81f128a351134020" ON "pgworkgroups"("workgroupname");

-- CreateIndex
CREATE INDEX "ix_tblasyncactivity_ix_tblasyncactivity_eventtype_completedon" ON "tblasyncactivity"("id", "eventtype", "completedon");

-- CreateIndex
CREATE UNIQUE INDEX "uk__tblautomatedschedule_criterianame_1801317727" ON "tblautomatedschedule"("criterianame");

-- CreateIndex
CREATE INDEX "ix_tblbusinessunit_ix_tblbusinessunit_id_110816" ON "tblbusinessunit"("id");

-- CreateIndex
CREATE INDEX "ix_tblbusinessunit2product_ix_tblbusinessunit2product_businessu" ON "tblbusinessunit2product"("businessunitid");

-- CreateIndex
CREATE UNIQUE INDEX "ux_tblcbmoclassifiedstyle_name_1291411920" ON "tblcbmoclassifiedstyle"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ux_tblchangeorders_changeorderid_customerid_1634365137" ON "tblchangeorders"("changeorderid", "customerid");

-- CreateIndex
CREATE INDEX "ix_tblclosedissues_ix_tblclosedissues_issueid_wincludes_2018120" ON "tblclosedissues"("issueid", "id", "zoneid");

-- CreateIndex
CREATE INDEX "ix_tblcomplist_ix_tblcomplist_gscustomersid" ON "tblcomplist"("gscustomersid");

-- CreateIndex
CREATE INDEX "ix_tblcomplist_ix_tblcomplist_subscriberid" ON "tblcomplist"("subscriberid");

-- CreateIndex
CREATE INDEX "ix_tblcontactaddress__dta_index_tblcontactaddress_1" ON "tblcontactaddress"("contactid", "isprimary", "addressid", "attn", "address1", "address2", "city", "region", "postalcode");

-- CreateIndex
CREATE INDEX "ix_tblcontactaddress__dta_index_tblcontactaddress_2" ON "tblcontactaddress"("addressid", "attn", "address1", "address2", "city", "region", "postalcode");

-- CreateIndex
CREATE INDEX "ix_tblcontactaddress_tblcontactaddress18" ON "tblcontactaddress"("address1");

-- CreateIndex
CREATE INDEX "ix_tblcontactemail_ix_tblcontactemail_contactid_isprimary" ON "tblcontactemail"("contactid", "isprimary");

-- CreateIndex
CREATE INDEX "ix_tblcontactfax_ix_tblcontactfax_contactid_isprimary" ON "tblcontactfax"("contactid", "isprimary");

-- CreateIndex
CREATE INDEX "ix_tblcontactperson__dta_index_tblcontactperson_1" ON "tblcontactperson"("isprimary", "contactid", "prefix", "firstname", "lastname", "suffix");

-- CreateIndex
CREATE INDEX "ix_tblcontactphone_ix_tblcontactphone_contactid_isprimary" ON "tblcontactphone"("contactid", "isprimary");

-- CreateIndex
CREATE INDEX "ix_tblcontacturl_ix_tblcontacturl_contactid_isprimary" ON "tblcontacturl"("contactid", "isprimary");

-- CreateIndex
CREATE INDEX "ix_tblcustomer2category_ix_tblcustomer2category_contactid_categ" ON "tblcustomer2category"("contactid", "categoryid");

-- CreateIndex
CREATE INDEX "ix_tblcustomer2priority_ix_tblcustomer2priority_custid_priority" ON "tblcustomer2priority"("customerid", "priorityid");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tblcustomerpaymentprofile_customerid_paymentgatewaydetailid_" ON "tblcustomerpaymentprofile"("customerid", "paymentgatewaydetailid");

-- CreateIndex
CREATE INDEX "ix_tblcustomerworkflowmapping_ix_tblcustomerworkflowmapping_cus" ON "tblcustomerworkflowmapping"("customerid", "workflowid");

-- CreateIndex
CREATE INDEX "ix_tblcustomfielddatacontact_ix_tblcustomfielddatacontact_gscus" ON "tblcustomfielddatacontact"("gscustomersid");

-- CreateIndex
CREATE INDEX "ix_tblcustomfielddataproduction_ix_tblcustomfielddataproduction" ON "tblcustomfielddataproduction"("gscontractsid");

-- CreateIndex
CREATE INDEX "ix_tblcustomfielddatasubscriber_ix_tblcustomfielddatasubscriber" ON "tblcustomfielddatasubscriber"("subscriberid");

-- CreateIndex
CREATE INDEX "ix_tblcustomfielddatasubscription_ix_tblcustomfielddatasubscrip" ON "tblcustomfielddatasubscription"("subscriptionid");

-- CreateIndex
CREATE INDEX "ix_tbldigitaladsadcellerantorder_ix_tbldigitaladsadcellerantord" ON "tbldigitaladsadcellerantorder"("advertiserid");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tbldigitaladssetup_authorizationid_565121304" ON "tbldigitaladssetup"("authorizationid");

-- CreateIndex
CREATE INDEX "ix_tblemailverificationprogress_ix_tblemailverificationprogress" ON "tblemailverificationprogress"("emailid");

-- CreateIndex
CREATE INDEX "ix_tblemailverificationstatus_ix_tblemailverificationstatus_ema" ON "tblemailverificationstatus"("emailid");

-- CreateIndex
CREATE INDEX "ix_tblemailverificationstatus_ix_tblemailverificationstatus_ism" ON "tblemailverificationstatus"("ismanualupdate", "guid", "emailid");

-- CreateIndex
CREATE INDEX "ix_tblemployee2pub_ix_tblemployee2pub_gsemployeesid_111516" ON "tblemployee2pub"("gsemployeesid");

-- CreateIndex
CREATE INDEX "ix_tblemployeesecurity_ix_tblemployeesecurity_employeeid_110316" ON "tblemployeesecurity"("employeeid");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tblglcodes_pubid_ratecardid_chargeid_1698365365" ON "tblglcodes"("pubid", "ratecardid", "chargeid");

-- CreateIndex
CREATE UNIQUE INDEX "uq__tblgloba__737584f67bc893fb" ON "tblglobalresource"("name");

-- CreateIndex
CREATE INDEX "ix_tblhomepageinbox_ix_tblhomepageinbox20161025_1" ON "tblhomepageinbox"("inboxtypeid", "done", "repid", "datecreated", "id", "fromrepid", "fromname", "subject", "message", "link", "viewed");

-- CreateIndex
CREATE INDEX "ix_tblinvoice__dta_index_tblinvoice_77_418868609__k3_k1_k2" ON "tblinvoice"("gscustomersid", "invoiceid", "invoicenumber");

-- CreateIndex
CREATE INDEX "ix_tblinvoice_ix_tblinvoice_billtoid" ON "tblinvoice"("billtoid");

-- CreateIndex
CREATE INDEX "ix_tblinvoice_ix_tblinvoice_invoicenumber_billtoid_asyncid" ON "tblinvoice"("invoiceid", "invoicenumber", "billtoid", "asyncid", "gscustomersid", "invoicedate", "duedate", "total", "bartertotal", "locked", "lastemailsentdate");

-- CreateIndex
CREATE INDEX "ix_tblinvoice2zone__dta_index_tblinvoice2zone_5_1984114209__k2_" ON "tblinvoice2zone"("invoiceid", "zoneid");

-- CreateIndex
CREATE INDEX "ix_tblinvoiceconsolidated__dta_index_tblinvoiceconsolidated_5_5" ON "tblinvoiceconsolidated"("cinvoiceid", "invoicenumber");

-- CreateIndex
CREATE INDEX "ix_tblinvoiceconsolidated_ix_tblinvoiceconsolidated_cinvoiceid" ON "tblinvoiceconsolidated"("cinvoiceid", "invoicenumber");

-- CreateIndex
CREATE INDEX "ix_tblinvoiceconsolidated_ix_tblinvoiceconsolidated_customerid" ON "tblinvoiceconsolidated"("gscustomersid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitem__dta_index_tblinvoicelineitem_5_104425082" ON "tblinvoicelineitem"("toinvoiceid", "cinvoiceid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitem_ix_tblinvoicelineitem20161024_1" ON "tblinvoicelineitem"("gscontractsid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitem_ix_tblinvoicelineitem_gscontractsinstallm" ON "tblinvoicelineitem"("gscontractsinstallmentid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitem_ix_tblinvoicelineitem_invoiceid_020817" ON "tblinvoicelineitem"("invoiceid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitem_ix_tblinvoicelineitem_invoiceid_gscontrac" ON "tblinvoicelineitem"("invoiceid", "gscontractsid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitem_ix_tblinvoicelineitem_toinvoiceid_cinvoic" ON "tblinvoicelineitem"("toinvoiceid", "cinvoiceid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitemdefinition_ix_tblinvoicelineitemdefinition" ON "tblinvoicelineitemdefinition"("invoiceid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitemdisplay_ix_tblinvoicelineitemdisplay_linei" ON "tblinvoicelineitemdisplay"("lineitemdefinitionid", "fieldid", "customfieldid", "header", "sortorder", "addtototal", "showtotal", "subtractfromtotal");

-- CreateIndex
CREATE INDEX "ix_tblinvoicelineitemdisplay_ix_tblinvoicelineitemdisplay_qbget" ON "tblinvoicelineitemdisplay"("fieldid", "invoiceid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepayment__dta_index_tblinvoicepayment_5_1108251053_" ON "tblinvoicepayment"("invoiceid", "paymentmethod", "amountpaid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepayment_ix_tblinvoicepayment_gscustomersid" ON "tblinvoicepayment"("gscustomersid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepayment_ix_tblinvoicepayment_invid_custid" ON "tblinvoicepayment"("invoiceid", "gscustomersid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepayment_ix_tblinvoicepayment_invoiceid" ON "tblinvoicepayment"("invoiceid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepayment_ix_tblinvoicepayment_paymentmethod" ON "tblinvoicepayment"("paymentmethod", "originpaymentid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepayment2contract_ix_tblinvoicepayment2contract_con" ON "tblinvoicepayment2contract"("contractid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepayment2contract_ix_tblinvoicepayment2contract_inv" ON "tblinvoicepayment2contract"("invoicepaymentid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepayment2zone_ix_tblinvoicepayment2zone_invoicepaym" ON "tblinvoicepayment2zone"("invoicepaymentid", "zoneid");

-- CreateIndex
CREATE INDEX "ix_tblinvoicepaymentextension_ix_tblinvoicepaymentextension_pay" ON "tblinvoicepaymentextension"("paymentid", "exchangerate");

-- CreateIndex
CREATE INDEX "ix_tblmagfrequency_ix_tblmagfrequency_issueset_wincludes_201902" ON "tblmagfrequency"("issueset", "id", "issuename", "issuedate");

-- CreateIndex
CREATE INDEX "ix_tblpaordercontainer_ix_tblpaordercontainer20240110" ON "tblpaordercontainer"("customerid");

-- CreateIndex
CREATE INDEX "ix_tblparent2customer_ix_tblparent2customer20240110" ON "tblparent2customer"("parentid");

-- CreateIndex
CREATE INDEX "ix_tblparent2customer_ix_tblparent2customer_customerid" ON "tblparent2customer"("customerid");

-- CreateIndex
CREATE INDEX "ix_tblparent2customer_ix_tblparent2customer_parentid_customerid" ON "tblparent2customer"("parentid", "customerid");

-- CreateIndex
CREATE INDEX "ix_tblpaymentplan2item_ix_tblpaymentplan2item_invoiceid_orderid" ON "tblpaymentplan2item"("invoiceid", "orderid", "paymentplanid");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tblplanaddongroup_name_1542504774" ON "tblplanaddongroup"("name");

-- CreateIndex
CREATE INDEX "ix_tblplansubscription_ix_tblplansubscription_customerid" ON "tblplansubscription"("customerid");

-- CreateIndex
CREATE INDEX "ix_tblplansubscriptionbillingamount_ix_tblplansubscriptionbilli" ON "tblplansubscriptionbillingamount"("subscriptionid");

-- CreateIndex
CREATE INDEX "ix_tblplansubscriptionbillingterm_ix_tblplansubscriptionbilling" ON "tblplansubscriptionbillingterm"("subscriptionid");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tblplansubscriptionbillingterm_subid_status_sd_ed_682693730" ON "tblplansubscriptionbillingterm"("subscriptionid", "billingstartdate", "billingenddate");

-- CreateIndex
CREATE INDEX "ix_tblplansubscriptionorder_ix_tblplansubscriptionorder_billing" ON "tblplansubscriptionorder"("billingtermid");

-- CreateIndex
CREATE UNIQUE INDEX "uk__tblplansubscriptionsource_name_1512600677" ON "tblplansubscriptionsource"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ux_tblpreflightfile_name_1808269747" ON "tblpreflightfile"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ux_tblpreflightmediakit_name_1945318240" ON "tblpreflightmediakit"("name");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tblproductcategory_name_2110174813" ON "tblproductcategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tblproductioncontractorder_contractproposalorderid_140617230" ON "tblproductioncontractorder"("contractid", "proposalid", "orderid");

-- CreateIndex
CREATE UNIQUE INDEX "uq_tblproductionorderrenewed_sourceid_renewedid_1079935169" ON "tblproductionorderrenewed"("sourceid", "renewedid");

-- CreateIndex
CREATE INDEX "ix_tblproductionorderstagemapping_tblproductionorderstagemappin" ON "tblproductionorderstagemapping"("orderid");

-- CreateIndex
CREATE INDEX "ix_tblproductionordertask_ix_tblproductionordertask_orderid" ON "tblproductionordertask"("orderid");

-- CreateIndex
CREATE INDEX "ix_tblproductionordertask_ix_tblproductionordertask_taskid" ON "tblproductionordertask"("taskid");

-- CreateIndex
CREATE UNIQUE INDEX "ux_tblproposalapproval_approvalid_proposalid_1650365194" ON "tblproposalapproval"("approvalid", "proposalid");

-- CreateIndex
CREATE INDEX "ix_tblproposalinsertion_ix_tblproposalinsertion2016112_1" ON "tblproposalinsertion"("proposalid");

-- CreateIndex
CREATE INDEX "ix_tblproposalinsertion_ix_tblproposalinsertion2016112_2" ON "tblproposalinsertion"("gscontractsid");

-- CreateIndex
CREATE INDEX "ix_tblproposalinsertion_ix_tblproposalinsertion_ratecardid_colo" ON "tblproposalinsertion"("ratecardid", "color");

-- CreateIndex
CREATE INDEX "ix_tblpubschedule_ix_tblpubschedule_pubid_issueid_20190206" ON "tblpubschedule"("pubid", "issueid");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tblqbcodes_pubid_ratecardid_chargeid_1941842230" ON "tblqbcodes"("pubid", "ratecardid", "chargeid");

-- CreateIndex
CREATE INDEX "ix_tblqbcustomer_ix_tblqbcustomer_quickbookscustomerid" ON "tblqbcustomer"("quickbookscustomerid");

-- CreateIndex
CREATE INDEX "ix_tblqbtransaction_ix_tblqbtransaction_qbrequestid" ON "tblqbtransaction"("qbrequestid");

-- CreateIndex
CREATE INDEX "ix_tblqbxml_ix_tblqbxml_operationtype_20200917" ON "tblqbxml"("operationtype", "id", "response");

-- CreateIndex
CREATE UNIQUE INDEX "uq__tblratec__00239d925f9fdcaf" ON "tblratecardlink"("ratecardid");

-- CreateIndex
CREATE INDEX "ix_tblrep2customer_ix_tblrep2customer_gsemployeesid_121416" ON "tblrep2customer"("gsemployeesid", "gscustomersid");

-- CreateIndex
CREATE UNIQUE INDEX "uc_tblreportactivitymodulereportsetting_name_1553648828" ON "tblreportactivitymodulereportsetting"("name");

-- CreateIndex
CREATE UNIQUE INDEX "uc_tblreportsalesbyreportsetting_name_1765125579" ON "tblreportsalesbyreportsetting"("name");

-- CreateIndex
CREATE INDEX "ix_tblsplitreps_ix_tblsplitreps" ON "tblsplitreps"("gsemployeesid");

-- CreateIndex
CREATE INDEX "ix_tblsplitreps_ix_tblsplitreps_1" ON "tblsplitreps"("gscontractsid");

-- CreateIndex
CREATE INDEX "ix_tblsplitreps_ix_tblsplitreps_insertionid_121416" ON "tblsplitreps"("insertionid");

-- CreateIndex
CREATE INDEX "ix_tblsubscriber__dta_index_tblsubscriber_1" ON "tblsubscriber"("subscriberid", "contactid");

-- CreateIndex
CREATE INDEX "ix_tblsubscriber_tblsubscriber20" ON "tblsubscriber"("contactid");

-- CreateIndex
CREATE INDEX "ix_tblsubscription__dta_index_tblsubscription_1" ON "tblsubscription"("magazineid", "endyear", "startyear", "subscriptionid", "startissueid", "endissueid", "subscriberid", "magazinename", "canceldate", "copies", "suspenddate");

-- CreateIndex
CREATE INDEX "ix_tblsubscription__dta_index_tblsubscription_2" ON "tblsubscription"("subscriberid", "subscriptionid", "endissueid", "magazineid", "endyear", "startissueid", "startyear", "magazinename", "canceldate", "copies", "suspenddate");

-- CreateIndex
CREATE INDEX "ix_tblsubscription2address__dta_index_tblsubscription2address_1" ON "tblsubscription2address"("subscriptionid", "type", "addressid", "frommonth", "tomonth", "today");

-- CreateIndex
CREATE UNIQUE INDEX "uk_tbltemplatelineitemtheme_name_248596174" ON "tbltemplatelineitemtheme"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ux_tbluserrole_name_1322696010" ON "tbluserrole"("name");

-- CreateIndex
CREATE INDEX "ix_tblwebcalendarappointment_ix_tblwebcalendarappointment_activ" ON "tblwebcalendarappointment"("gsactivityid");

-- AddForeignKey
ALTER TABLE "gscontracts" ADD CONSTRAINT "fk_gscontracts_stageid_99023634" FOREIGN KEY ("stageid") REFERENCES "tblproductionorderstages"("stageid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gsemployees" ADD CONSTRAINT "fk_gsemployees_gsdept_gsdeptid_23215383" FOREIGN KEY ("gsdeptid") REFERENCES "gsdept"("gsdeptid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gsemployees" ADD CONSTRAINT "fk_gsemployees_tbldashboards_id_1182119452" FOREIGN KEY ("defaultdashboardid") REFERENCES "tbldashboards"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gsemployees" ADD CONSTRAINT "fk_gsemployees_tbluserrole_roleid_1354696124" FOREIGN KEY ("roleid") REFERENCES "tbluserrole"("roleid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "gspublications" ADD CONSTRAINT "fk_gspublications_productcategoryid_26691393" FOREIGN KEY ("productcategoryid") REFERENCES "tblproductcategory"("productcategoryid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "app_product_extras" ADD CONSTRAINT "app_product_extras_gspublicationid_fkey" FOREIGN KEY ("gspublicationid") REFERENCES "gspublications"("gspublicationid") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tblactivitysystem" ADD CONSTRAINT "fk_tblactivitysystem_gscustomers_1978698347" FOREIGN KEY ("customerid") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbladvsearchallcolumn2producttype" ADD CONSTRAINT "fk__tbladvsea__colum__77b8d74c" FOREIGN KEY ("columnid") REFERENCES "tbladvsearchallcolumns"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblarpaymentgatewayccprofilehistory" ADD CONSTRAINT "fk_tblarpaymentgatewayccprofilehistory_tblcustomerpaymentprofil" FOREIGN KEY ("customerprofileid") REFERENCES "tblcustomerpaymentprofile"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblchangeorderlineitemdefinition" ADD CONSTRAINT "fk_tblchangeorderlineitemdefinition_tblcontractlineitemtype_499" FOREIGN KEY ("lineitemtypeid") REFERENCES "tblcontractlineitemtype"("lineitemtypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblchangeorderlineitemdefinition" ADD CONSTRAINT "fk_tblcontractlineitemdefinition_tblchangeorders_483741026" FOREIGN KEY ("changeorderid") REFERENCES "tblchangeorders"("changeorderid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblchangeorderlineitemdisplay" ADD CONSTRAINT "fk_tblchangeorderlineitemdisplay_tblchangeorderlineitemdefiniti" FOREIGN KEY ("lineitemdefinitionid") REFERENCES "tblchangeorderlineitemdefinition"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblchangeorderlineitemtemplate" ADD CONSTRAINT "fk_tblchangeorderlineitemtemplate_tblchangeorders_531741197" FOREIGN KEY ("changeorderid") REFERENCES "tblchangeorders"("changeorderid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblclassifiedelementsmap" ADD CONSTRAINT "fk_tblclassifiedelementsmap_tblindesigntemplates_1144547311" FOREIGN KEY ("indesigntemplateid") REFERENCES "tblindesigntemplates"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontact2contacttype" ADD CONSTRAINT "fk_tblcontact2contacttype_tblcontact_631009329" FOREIGN KEY ("contactid") REFERENCES "tblcontact"("contactid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontact2contacttype" ADD CONSTRAINT "fk_tblcontact2contacttype_tblcontacttype_647009386" FOREIGN KEY ("contacttypeid") REFERENCES "tblcontacttype"("contacttypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactaddress" ADD CONSTRAINT "fk_tblcontactaddress_tblcontactaddresstype_679009500" FOREIGN KEY ("addresstypeid") REFERENCES "tblcontactaddresstype"("addresstypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactadvsearchpageviewforrep" ADD CONSTRAINT "fk_tblcontactadvsearchpageviews_tblcontactadvsearchpageviewforr" FOREIGN KEY ("viewid") REFERENCES "tblcontactadvsearchpageviews"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactemail" ADD CONSTRAINT "fk_tblcontactemail_tblcontact_695009557" FOREIGN KEY ("contactid") REFERENCES "tblcontact"("contactid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactemail" ADD CONSTRAINT "fk_tblcontactemail_tblcontactemailtype_711009614" FOREIGN KEY ("emailtypeid") REFERENCES "tblcontactemailtype"("emailtypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactfax" ADD CONSTRAINT "fk_tblcontactfax_tblcontact_727009671" FOREIGN KEY ("contactid") REFERENCES "tblcontact"("contactid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactfax" ADD CONSTRAINT "fk_tblcontactfax_tblcontactfaxtype_743009728" FOREIGN KEY ("faxtypeid") REFERENCES "tblcontactfaxtype"("faxtypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactperson" ADD CONSTRAINT "fk_tblcontactperson_tblcontact_759009785" FOREIGN KEY ("contactid") REFERENCES "tblcontact"("contactid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactperson" ADD CONSTRAINT "fk_tblcontactperson_tblcontactpersontype_775009842" FOREIGN KEY ("persontypeid") REFERENCES "tblcontactpersontype"("persontypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactphone" ADD CONSTRAINT "fk_tblcontactphone_tblcontact_791009899" FOREIGN KEY ("contactid") REFERENCES "tblcontact"("contactid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontactphone" ADD CONSTRAINT "fk_tblcontactphone_tblcontactphonetype_807009956" FOREIGN KEY ("phonetypeid") REFERENCES "tblcontactphonetype"("phonetypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontacturl" ADD CONSTRAINT "fk_tblcontacturl_tblcontact_823010013" FOREIGN KEY ("contactid") REFERENCES "tblcontact"("contactid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontacturl" ADD CONSTRAINT "fk_tblcontacturl_tblcontacturltype_839010070" FOREIGN KEY ("urltypeid") REFERENCES "tblcontacturltype"("urltypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontractlineitemdefinition" ADD CONSTRAINT "fk_tblcontractlineitemdefinition_tblcontract_285296126" FOREIGN KEY ("contractid") REFERENCES "tblcontract"("contractid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontractlineitemdefinition" ADD CONSTRAINT "fk_tblcontractlineitemdefinition_tblcontractlineitemtype_317296" FOREIGN KEY ("lineitemtypeid") REFERENCES "tblcontractlineitemtype"("lineitemtypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcontractlineitemdisplay" ADD CONSTRAINT "fk_tblcontractlineitemdisplay_tblcontractlineitemdefinition_866" FOREIGN KEY ("lineitemdefinitionid") REFERENCES "tblcontractlineitemdefinition"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcustomer2product" ADD CONSTRAINT "fk_tblcustomer2product_customerid_418360805" FOREIGN KEY ("customerid") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcustomer2product" ADD CONSTRAINT "fk_tblcustomer2product_productid_402360748" FOREIGN KEY ("productid") REFERENCES "gspublications"("gspublicationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblcustomerpaymentprofile" ADD CONSTRAINT "fk_tblcustomerpaymentprofile_gscustomersid_797454115" FOREIGN KEY ("customerid") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbldigitaladsadcellerantadvertiser" ADD CONSTRAINT "fk_tbldigitaladsadcellerantadvertiser_725121874" FOREIGN KEY ("digitaladssetupid") REFERENCES "tbldigitaladssetup"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbldigitaladsadcellerantorder" ADD CONSTRAINT "fk_tbldigitaladsadcellerantorder_741121931" FOREIGN KEY ("digitaladssetupid") REFERENCES "tbldigitaladssetup"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbldigitaladsadvertiser" ADD CONSTRAINT "fk_tbldigitaladsadvertiser_252072184" FOREIGN KEY ("customerid") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbldigitaladsorder" ADD CONSTRAINT "fk_tbldigitaladsorder_gscontracts_268072241" FOREIGN KEY ("orderid") REFERENCES "gscontracts"("gscontractsid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbldigitaladssetup" ADD CONSTRAINT "fk_tbldigitaladssetup_gspublications_284072298" FOREIGN KEY ("productid") REFERENCES "gspublications"("gspublicationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblemailverificationstatus" ADD CONSTRAINT "fk_tblemailverificationstatus_tblemailverificationstatuscodes_s" FOREIGN KEY ("statuscode") REFERENCES "tblemailverificationstatuscodes"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblemployee2pub" ADD CONSTRAINT "fk_tblemployee2pub_tbluserrole_roleid_1370696181" FOREIGN KEY ("roleid") REFERENCES "tbluserrole"("roleid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblemployeesecurity" ADD CONSTRAINT "fk_tblemployeesecurity_tbluserrole_roleid_1386696238" FOREIGN KEY ("roleid") REFERENCES "tbluserrole"("roleid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblgscustomers" ADD CONSTRAINT "fk_tblgscustomers_tblgsemployees_324196205" FOREIGN KEY ("repid") REFERENCES "tblgsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhighchartdashboardconf" ADD CONSTRAINT "fk__tblhighch__chart__6252dabb" FOREIGN KEY ("charttypeid") REFERENCES "tblhighcharttype"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhighchartdashboardconf" ADD CONSTRAINT "fk__tblhighch__toolt__6346fef4" FOREIGN KEY ("tooltipid") REFERENCES "tblhighcharttooltips"("tooltipid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagecomponent2emailrep" ADD CONSTRAINT "fk_tblhomepagecomponent2emailrep_gsemployees_1338696067" FOREIGN KEY ("repid") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagecomponent2emailrep" ADD CONSTRAINT "fk_tblhomepagecomponent2emailrep_tblsummaryemailfrequency_11285" FOREIGN KEY ("summaryemailfrequencyid") REFERENCES "tblsummaryemailfrequency"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagecomponent2emailrep" ADD CONSTRAINT "fk_tblhomepagecomponent2emailrep_tbluserrole_roleid_1402696295" FOREIGN KEY ("roleid") REFERENCES "tbluserrole"("roleid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagecomponent2user" ADD CONSTRAINT "fk_tblhomepagecomponent2user_tblhomepagecomponent_1950838212" FOREIGN KEY ("componentid") REFERENCES "tblhomepagecomponent"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagecomponentcolumns" ADD CONSTRAINT "fk_tblhomepagecomponentcolumns_tblhomepagecomponent_1966838269" FOREIGN KEY ("componentid") REFERENCES "tblhomepagecomponent"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagecomponentcontrolparameters" ADD CONSTRAINT "fk_tblhomepagecomponentcontrolparameters_tblhomepagecomponentco" FOREIGN KEY ("componentcontrolid") REFERENCES "tblhomepagecomponentcontrols"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagecomponentcontrols" ADD CONSTRAINT "fk_tblhomepagecomponentcontrols_tblhomepagecomponent_1998838383" FOREIGN KEY ("componentid") REFERENCES "tblhomepagecomponent"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagecomponentparameters" ADD CONSTRAINT "fk_tblhomepagecomponentparameters_tblhomepagecomponent_19828383" FOREIGN KEY ("componentid") REFERENCES "tblhomepagecomponent"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepageemailnotification2rep" ADD CONSTRAINT "fk_tblhomepageemailnotification2rep_tbluserrole_roleid_14186963" FOREIGN KEY ("roleid") REFERENCES "tbluserrole"("roleid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepagegoal" ADD CONSTRAINT "fk_tblhomepagegoal_tblhomepagegoaltype_1879781854" FOREIGN KEY ("goaltypeid") REFERENCES "tblhomepagegoaltype"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepageinbox" ADD CONSTRAINT "fk_tblhomepageinbox_tblhomepageinboxtype_1895781911" FOREIGN KEY ("inboxtypeid") REFERENCES "tblhomepageinboxtype"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblhomepageinboxcategory2rep" ADD CONSTRAINT "fk_tblhomepageinboxcategory2rep_tbluserrole_roleid_1434696409" FOREIGN KEY ("roleid") REFERENCES "tbluserrole"("roleid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblinvoiceextension" ADD CONSTRAINT "fk_tblinvoiceextension_multicurrencyid_1939030189" FOREIGN KEY ("multicurrencyid") REFERENCES "tblmulticurrencysetup"("multicurrencyid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblinvoicelineitem" ADD CONSTRAINT "fk_tblinvoicelineitem_tblinvoice_933682474" FOREIGN KEY ("invoiceid") REFERENCES "tblinvoice"("invoiceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblinvoicelineitemdefinition" ADD CONSTRAINT "fk_tblinvoicelineitemdefinition_tblinvoice_988686720" FOREIGN KEY ("invoiceid") REFERENCES "tblinvoice"("invoiceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblinvoicelineitemdefinition" ADD CONSTRAINT "fk_tblinvoicelineitemdefinition_tblinvoicelineitemtype_10046867" FOREIGN KEY ("lineitemtypeid") REFERENCES "tblinvoicelineitemtype"("lineitemtypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblinvoicepayment" ADD CONSTRAINT "fk_tblinvoicepayment_tblinvoice_642869407" FOREIGN KEY ("invoiceid") REFERENCES "tblinvoice"("invoiceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblinvoicepaymentextension" ADD CONSTRAINT "fk_tblinvoicepaymentextension_tblmulticurrency_1955030246" FOREIGN KEY ("multicurrencyid") REFERENCES "tblmulticurrencysetup"("multicurrencyid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblissue" ADD CONSTRAINT "fk_tblissue_tblissueset_340196262" FOREIGN KEY ("issuesetid") REFERENCES "tblissueset"("issuesetid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbljobdone" ADD CONSTRAINT "fk_tbljobsent_tbljob_73819375" FOREIGN KEY ("jobid") REFERENCES "tbljob"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbljobexception" ADD CONSTRAINT "fk_tbljobexceptions_tbljob_2029302339" FOREIGN KEY ("jobid") REFERENCES "tbljob"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbljobqueue" ADD CONSTRAINT "fk_tbljobqueue_tbljob_1869301769" FOREIGN KEY ("jobid") REFERENCES "tbljob"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblmulticurrency2production" ADD CONSTRAINT "fk_tblmulticurrency2production_insertionid_1795029676" FOREIGN KEY ("insertionid") REFERENCES "tblproposalinsertion"("insertionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblmulticurrency2production" ADD CONSTRAINT "fk_tblmulticurrency2production_orderid_1779029619" FOREIGN KEY ("orderid") REFERENCES "gscontracts"("gscontractsid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblmulticurrency2production" ADD CONSTRAINT "fk_tblmulticurrency2production_paymentplanid_1827029790" FOREIGN KEY ("paymentplanid") REFERENCES "tblpaymentplan"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblmulticurrency2production" ADD CONSTRAINT "fk_tblmulticurrency2production_tblmulticurrency_1811029733" FOREIGN KEY ("multicurrencyid") REFERENCES "tblmulticurrencysetup"("multicurrencyid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblmulticurrencyautoexchangerate" ADD CONSTRAINT "fk_tblmulticurrencyautoexchangerate_currencyid_1843029847" FOREIGN KEY ("currencyid") REFERENCES "tblmulticurrencies"("currencyid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblmulticurrencyexchangeratehistory" ADD CONSTRAINT "fk_tblmulticurrencyexchangeratehistory_multicurrencyid_18590299" FOREIGN KEY ("multicurrencyid") REFERENCES "tblmulticurrencysetup"("multicurrencyid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblmulticurrencysetup" ADD CONSTRAINT "fk_tblmulticurrencysetup_currencyid_1891030018" FOREIGN KEY ("currencyid") REFERENCES "tblmulticurrencies"("currencyid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblmulticurrencysetup" ADD CONSTRAINT "fk_tblmulticurrencysetup_paymentgatewayid_1875029961" FOREIGN KEY ("paymentgatewayid") REFERENCES "tblpaymentgatewaymerchant"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpaadunits" ADD CONSTRAINT "fk_tblpaadunits_smartsizemode_615217492" FOREIGN KEY ("smartsizemode") REFERENCES "tblpaadunitsmartsizemodeenum"("enumerationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpaadunits" ADD CONSTRAINT "fk_tblpaadunits_status_801646149" FOREIGN KEY ("status") REFERENCES "tblpainventorystatusenum"("enumerationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpaadunitsizemst" ADD CONSTRAINT "fk_tblpaadunitsizemst_environmenttype_817646206" FOREIGN KEY ("environmenttype") REFERENCES "tblpaenvironmenttypeenum"("enumerationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpaymentgatewayconnect" ADD CONSTRAINT "fk_tblpaymentgatewayconnect_tblpaymentgateway_1476460584" FOREIGN KEY ("gatewayid") REFERENCES "tblpaymentgateway"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpaymentplanlineitemdisplay" ADD CONSTRAINT "fk_tblpaymentplanlineitemdisplay_lineitemdefinitionid_115850340" FOREIGN KEY ("lineitemdefinitionid") REFERENCES "tblpaymentplanlineitemdefinition"("lineitemdefinitionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblperson2department" ADD CONSTRAINT "fk_tblperson2department_tbldepartment_388196433" FOREIGN KEY ("departmentid") REFERENCES "tbldepartment"("departmentid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblperson2group" ADD CONSTRAINT "fk_tblperson2group_tblgroup_404196490" FOREIGN KEY ("groupid") REFERENCES "tblgroup"("groupid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblperson2rsvpevent" ADD CONSTRAINT "fk_tblperson2rsvpevent_tblrsvpevents_420196547" FOREIGN KEY ("rsvpeventid") REFERENCES "tblrsvpevents"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan" ADD CONSTRAINT "fk_tblplan_billingperiodunit_813454172" FOREIGN KEY ("billingperiodunit") REFERENCES "tblplanperiodunit"("periodunitid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan" ADD CONSTRAINT "fk_tblplan_createdby_893454457" FOREIGN KEY ("createdby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan" ADD CONSTRAINT "fk_tblplan_endaction_861454343" FOREIGN KEY ("endaction") REFERENCES "tblplansubscriptiontermendaction"("termendactionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan" ADD CONSTRAINT "fk_tblplan_giftexpiryunit_829454229" FOREIGN KEY ("giftexpiryunit") REFERENCES "tblplanperiodunit"("periodunitid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan" ADD CONSTRAINT "fk_tblplan_productid_909454514" FOREIGN KEY ("productid") REFERENCES "gspublications"("gspublicationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan" ADD CONSTRAINT "fk_tblplan_trialperiodunit_877454400" FOREIGN KEY ("trialperiodunit") REFERENCES "tblplanperiodunit"("periodunitid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan" ADD CONSTRAINT "fk_tblplan_updatedby_845454286" FOREIGN KEY ("updatedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan2addon" ADD CONSTRAINT "fk_tblplan2addon_addoneventtypeid_925454571" FOREIGN KEY ("addoneventtypeid") REFERENCES "tblplanaddoneventtype"("addoneventtypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan2addon" ADD CONSTRAINT "fk_tblplan2addon_addonid_957454685" FOREIGN KEY ("addonid") REFERENCES "tblplanaddon"("addonid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan2addon" ADD CONSTRAINT "fk_tblplan2addon_planid_941454628" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan2orderaddon" ADD CONSTRAINT "fk_tblplan2orderaddon_cbmoclassifiedstyleid_1355412148" FOREIGN KEY ("cbmoclassifiedstyleid") REFERENCES "tblcbmoclassifiedstyle"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplan2orderaddon" ADD CONSTRAINT "fk_tblplan2orderaddon_planid_398884738" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanaddon" ADD CONSTRAINT "fk_tblplanaddon_createdby_973454742" FOREIGN KEY ("createdby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanaddon" ADD CONSTRAINT "fk_tblplanaddon_productid_1005454856" FOREIGN KEY ("productid") REFERENCES "gspublications"("gspublicationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanaddon" ADD CONSTRAINT "fk_tblplanaddon_updatedby_989454799" FOREIGN KEY ("updatedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanaddongroup2addon" ADD CONSTRAINT "fk_tblplanaddongroup2addon_addongroupid_1606505002" FOREIGN KEY ("addongroupid") REFERENCES "tblplanaddongroup"("addongroupid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanaddongroup2addon" ADD CONSTRAINT "fk_tblplanaddongroup2addon_addonid_1590504945" FOREIGN KEY ("addonid") REFERENCES "tblplanaddon"("addonid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanbillingcycle" ADD CONSTRAINT "fk_tblplanbillingcycle_closeonperiodunitid_905978504" FOREIGN KEY ("closeonperiodunitid") REFERENCES "tblplanperiodunit"("periodunitid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanbillingcycle" ADD CONSTRAINT "fk_tblplanbillingcycle_startonperiodunitid_889978447" FOREIGN KEY ("startonperiodunitid") REFERENCES "tblplanperiodunit"("periodunitid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanbillingcycle" ADD CONSTRAINT "fk_tblplanbillingcycle_startsonintervalid_873978390" FOREIGN KEY ("startsonintervalid") REFERENCES "tblplanperiodunit"("periodunitid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplancoupon" ADD CONSTRAINT "fk_tblplancoupon_createdby_1021454913" FOREIGN KEY ("createdby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplancoupon" ADD CONSTRAINT "fk_tblplancoupon_updatedby_1037454970" FOREIGN KEY ("updatedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplancouponaddon" ADD CONSTRAINT "fk_tblplancouponaddon_addonid_1069455084" FOREIGN KEY ("addonid") REFERENCES "tblplanaddon"("addonid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplancouponaddon" ADD CONSTRAINT "fk_tblplancouponaddon_couponid_1053455027" FOREIGN KEY ("couponid") REFERENCES "tblplancoupon"("couponid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplancouponcustomer" ADD CONSTRAINT "fk_tblplancouponcustomer_couponid_1085455141" FOREIGN KEY ("couponid") REFERENCES "tblplancoupon"("couponid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplancouponplan" ADD CONSTRAINT "fk_tblplancouponplan_couponid_1117455255" FOREIGN KEY ("couponid") REFERENCES "tblplancoupon"("couponid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplancouponplan" ADD CONSTRAINT "fk_tblplancouponplan_planid_1101455198" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplancustomerportalsettings" ADD CONSTRAINT "fk_tblplancustomerportalsettings_planid_2103938817" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanfeature" ADD CONSTRAINT "fk_tblplanfeature_planid_1133455312" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanfreecredits" ADD CONSTRAINT "fk_tblplanfreecredits_tblplan_660457677" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanfulfilmentpointproduct" ADD CONSTRAINT "fk_tblplanfulfilmentpointproduct_fulfilmentid_1497980613" FOREIGN KEY ("fulfilmentid") REFERENCES "tblplanfulfilmentpoint"("fulfilmentid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanfulfilmentpointproduct" ADD CONSTRAINT "fk_tblplanfulfilmentpointproduct_productid_921978561" FOREIGN KEY ("productid") REFERENCES "gspublications"("gspublicationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanpricingmodellineitem" ADD CONSTRAINT "fk_tblplanpricingmodellineitem_addonid_1975938361" FOREIGN KEY ("addonid") REFERENCES "tblplanaddon"("addonid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanpricingmodellineitem" ADD CONSTRAINT "fk_tblplanpricingmodellineitem_planid_1943938247" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplanpricingmodellineitem" ADD CONSTRAINT "fk_tblplanpricingmodellineitem_pricingmodelid_1959938304" FOREIGN KEY ("pricingmodelid") REFERENCES "tblplanpricingmodel"("pricingmodelid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansplitreps" ADD CONSTRAINT "fk_tblplansplitreps_planid_969978732" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansplitreps" ADD CONSTRAINT "fk_tblplansplitreps_userid_953978675" FOREIGN KEY ("userid") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscription" ADD CONSTRAINT "fk_tblplansubscription_addressid_1213455597" FOREIGN KEY ("addressid") REFERENCES "tblcontactaddress"("addressid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscription" ADD CONSTRAINT "fk_tblplansubscription_createdby_1261455768" FOREIGN KEY ("createdby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscription" ADD CONSTRAINT "fk_tblplansubscription_customerid_1245455711" FOREIGN KEY ("customerid") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscription" ADD CONSTRAINT "fk_tblplansubscription_planid_1229455654" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscription" ADD CONSTRAINT "fk_tblplansubscription_updatedby_1197455540" FOREIGN KEY ("updatedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionaddon" ADD CONSTRAINT "fk_tblplansubscriptionaddon_addonid_1277455825" FOREIGN KEY ("addonid") REFERENCES "tblplanaddon"("addonid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionbillingterm" ADD CONSTRAINT "fk_tblplansubscriptionbillingterm_subscriptionid_1293455882" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionbillingtermpayment" ADD CONSTRAINT "fk_tblplansubscriptionbillingtermpayment_tblplansubscription_13" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncancel" ADD CONSTRAINT "fk_tblplansubscriptioncancel_cancelledby_1373456167" FOREIGN KEY ("cancelledby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncancel" ADD CONSTRAINT "fk_tblplansubscriptioncancel_reasonid_1357456110" FOREIGN KEY ("reasonid") REFERENCES "tblplansubscriptioncancelreason"("cancelreasonid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncancel" ADD CONSTRAINT "fk_tblplansubscriptioncancel_subscriptionid_1341456053" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncancel" ADD CONSTRAINT "fk_tblplansubscriptioncancel_updatedby_1389456224" FOREIGN KEY ("updatedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncoupon" ADD CONSTRAINT "fk_tblplansubscriptioncoupon_couponid_1421456338" FOREIGN KEY ("couponid") REFERENCES "tblplancoupon"("couponid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncoupon" ADD CONSTRAINT "fk_tblplansubscriptioncoupon_subscriptionid_1405456281" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncouponcustomer" ADD CONSTRAINT "fk_tblplansubscriptioncouponcustomer_couponid_382884681" FOREIGN KEY ("couponid") REFERENCES "tblplancoupon"("couponid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncouponcustomer" ADD CONSTRAINT "fk_tblplansubscriptioncouponcustomer_customerid_366884624" FOREIGN KEY ("customerid") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioncreditadjustments" ADD CONSTRAINT "fk_tblplansubscriptioncreditadjustments_tblplansubscriptioncred" FOREIGN KEY ("creditid") REFERENCES "tblplansubscriptioncredits"("creditid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionextendedbillingdates" ADD CONSTRAINT "fk_tblplansubscriptionextendedbillingdates_billingtermid_730693" FOREIGN KEY ("billingtermid") REFERENCES "tblplansubscriptionbillingterm"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionextendedbillingdates" ADD CONSTRAINT "fk_tblplansubscriptionextendedbillingdates_subscriptionid_71469" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionextensionpayment" ADD CONSTRAINT "fk_tblplansubscriptionextensionpayment_billingtermid_1034694984" FOREIGN KEY ("billingtermid") REFERENCES "tblplansubscriptionbillingterm"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionextensionpayment" ADD CONSTRAINT "fk_tblplansubscriptionextensionpayment_createdby_1018694927" FOREIGN KEY ("createdby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionextensionpayment" ADD CONSTRAINT "fk_tblplansubscriptionextensionpayment_subscriptionid_100269487" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptiongift" ADD CONSTRAINT "fk_tblplansubscriptiongift_giftedby_1453456452" FOREIGN KEY ("giftedby") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptiongift" ADD CONSTRAINT "fk_tblplansubscriptiongift_subscriptionid_1437456395" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioninbetween" ADD CONSTRAINT "fk_tblplansubscriptioninbetween_inbetweenid_1820793794" FOREIGN KEY ("inbetweenid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioninbetween" ADD CONSTRAINT "fk_tblplansubscriptioninbetween_sourceid_1804793737" FOREIGN KEY ("sourceid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioninfo" ADD CONSTRAINT "fk_tblplansubscriptioninfo__sourceid_1675413288" FOREIGN KEY ("sourceid") REFERENCES "tblplansubscriptionsource"("sourceid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptioninfo" ADD CONSTRAINT "fk_tblplansubscriptioninfo_subscriptionid_1528600734" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionorder" ADD CONSTRAINT "fk_tblplansubscriptionorder_addonid_1485456566" FOREIGN KEY ("addonid") REFERENCES "tblplanaddon"("addonid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionorder" ADD CONSTRAINT "fk_tblplansubscriptionorder_billingtermid_1469456509" FOREIGN KEY ("billingtermid") REFERENCES "tblplansubscriptionbillingterm"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionorder" ADD CONSTRAINT "fk_tblplansubscriptionorder_planid_1517456680" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionorder" ADD CONSTRAINT "fk_tblplansubscriptionorder_subscriptionid_1501456623" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionpause" ADD CONSTRAINT "fk_tblplansubscriptionpause_pausedby_1782505629" FOREIGN KEY ("pausedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionpause" ADD CONSTRAINT "fk_tblplansubscriptionpause_resumedby_1830505800" FOREIGN KEY ("resumedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionpause" ADD CONSTRAINT "fk_tblplansubscriptionpause_subscriptionid_1814505743" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionpause" ADD CONSTRAINT "fk_tblplansubscriptionpause_updatedby_1798505686" FOREIGN KEY ("updatedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionrenewed" ADD CONSTRAINT "fk_tblplansubscriptionrenewed_renewedid_1549456794" FOREIGN KEY ("renewedid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionrenewed" ADD CONSTRAINT "fk_tblplansubscriptionrenewed_sourceid_1533456737" FOREIGN KEY ("sourceid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionsplitreps" ADD CONSTRAINT "fk_tblplansubscriptionsplitreps_subscriptionid_1049979017" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptionsplitreps" ADD CONSTRAINT "fk_tblplansubscriptionsplitreps_userid_1033978960" FOREIGN KEY ("userid") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptiontaxes" ADD CONSTRAINT "fk_tblplansubscriptiontaxes_subscriptionid_1833981810" FOREIGN KEY ("subscriptionid") REFERENCES "tblplansubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptiontaxes" ADD CONSTRAINT "fk_tblplansubscriptiontaxes_taxgroupid_265312255" FOREIGN KEY ("taxgroupid") REFERENCES "tbltaxgroup"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplansubscriptiontaxes" ADD CONSTRAINT "fk_tblplansubscriptiontaxes_taxid_681313737" FOREIGN KEY ("taxid") REFERENCES "tbltax"("taxid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplantaxes" ADD CONSTRAINT "fk_tblplantaxes_planid_1865981924" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplantaxes" ADD CONSTRAINT "fk_tblplantaxes_taxgroupid_281312312" FOREIGN KEY ("taxgroupid") REFERENCES "tbltaxgroup"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblplantaxes" ADD CONSTRAINT "fk_tblplantaxes_taxid_665313680" FOREIGN KEY ("taxid") REFERENCES "tbltax"("taxid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpreflightfield" ADD CONSTRAINT "fk_tblpreflightfield_tblpreflightdoctype_doctypeid_1856269918" FOREIGN KEY ("doctypeid") REFERENCES "tblpreflightdoctype"("doctypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpreflightfile" ADD CONSTRAINT "fk_tblpreflightfile_tblpreflightdoctype_doctypeid_1163411464" FOREIGN KEY ("doctypeid") REFERENCES "tblpreflightdoctype"("doctypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpreflightfilefieldmapping" ADD CONSTRAINT "fk_tblpreflightfilefieldmapping_tblpreflightfile_preflightfilei" FOREIGN KEY ("preflightfileid") REFERENCES "tblpreflightfile"("preflightfileid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblprintingcosts" ADD CONSTRAINT "fk_tblprintingcosts_tblprinters_468196718" FOREIGN KEY ("printersid") REFERENCES "tblprinters"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblprintingcosts" ADD CONSTRAINT "fk_tblprintingcosts_tblprintingformsizes_484196775" FOREIGN KEY ("formsizeid") REFERENCES "tblprintingformsizes"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblprintingcosts" ADD CONSTRAINT "fk_tblprintingcosts_tblprintingpaperweights_500196832" FOREIGN KEY ("paperweightid") REFERENCES "tblprintingpaperweights"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductfeature" ADD CONSTRAINT "fk_tblproductfeature_productd_599217435" FOREIGN KEY ("productid") REFERENCES "gspublications"("gspublicationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductioncontractorder" ADD CONSTRAINT "fk_tblproductioncontractorder_orderid_1422172362" FOREIGN KEY ("orderid") REFERENCES "gscontracts"("gscontractsid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductioninternalapprovalstagehistory" ADD CONSTRAINT "fk_tblproductioninternalapprovalstagehistory_tblproductionorder" FOREIGN KEY ("stageid") REFERENCES "tblproductionorderstages"("stageid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductionordernoteviewed" ADD CONSTRAINT "fk_tblproductionordernoteviewed_ordernoteid_1531412775" FOREIGN KEY ("ordernoteid") REFERENCES "gscontractsnotes"("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductionorderprepayrequest" ADD CONSTRAINT "fk_tblproductionorderprepayrequest_gscontracts_471933003" FOREIGN KEY ("orderid") REFERENCES "gscontracts"("gscontractsid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductionorderprepayrequest" ADD CONSTRAINT "fk_tblproductionorderprepayrequest_gsemployees_455932946" FOREIGN KEY ("requestedby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductionorderrenewcancel" ADD CONSTRAINT "fk_tblproductionorderrenewcancel_cancelledby_1207935625" FOREIGN KEY ("cancelledby") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductionorderrenewed" ADD CONSTRAINT "fk_tblproductionorderrenewed_customerid_1191935568" FOREIGN KEY ("customerid") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductionorderstagemapping" ADD CONSTRAINT "fk_tblproductionorderstagemapping_stageid_723025857" FOREIGN KEY ("stageid") REFERENCES "tblproductionorderstages"("stageid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductionorderstagesapprovallist" ADD CONSTRAINT "fk_tblproductionorderstagesapprovallist_tblproductionorderstage" FOREIGN KEY ("stageid") REFERENCES "tblproductionorderstages"("stageid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproductionordertagsmapping" ADD CONSTRAINT "fk_tblproductionordertagsmapping_tagid_1171027453" FOREIGN KEY ("tagid") REFERENCES "tblproductionordertags"("tagid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproposalinsertiondisplay" ADD CONSTRAINT "fk_tblproposalinsertiondisplayfields_tblproposal_21627170" FOREIGN KEY ("proposalid") REFERENCES "tblproposal"("proposalid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproposallineitemtemplate" ADD CONSTRAINT "fk_tblproposallineitemtemplate_tblcontract_1189123527" FOREIGN KEY ("proposalid") REFERENCES "tblcontract"("contractid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproposalsignatures" ADD CONSTRAINT "fk_tblproposalsignatures_tblproposal_37627227" FOREIGN KEY ("proposalid") REFERENCES "tblproposal"("proposalid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblproposaltextblock" ADD CONSTRAINT "fk_tblproposaltextblock_tblproposal_53627284" FOREIGN KEY ("proposalid") REFERENCES "tblproposal"("proposalid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpublication2magazine" ADD CONSTRAINT "fk_tblpublication2magazine_gspublications_516196889" FOREIGN KEY ("publicationid") REFERENCES "gspublications"("gspublicationid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblpublication2magazine" ADD CONSTRAINT "fk_tblpublication2magazine_tblmagazines_532196946" FOREIGN KEY ("magazineid") REFERENCES "tblmagazines"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblqbtransaction" ADD CONSTRAINT "fk_tblqbtransaction_tblqbxml_1460408472" FOREIGN KEY ("qbrequestid") REFERENCES "tblqbxml"("requestid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblratecard2admaster" ADD CONSTRAINT "fk_tblratecard2admaster_ratecardid_1347744104" FOREIGN KEY ("ratecardid") REFERENCES "tblratecard"("ratecardid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblratecard2multicurrency" ADD CONSTRAINT "fk_tblratecard2multicurrency_multicurrencyid_1923030132" FOREIGN KEY ("multicurrencyid") REFERENCES "tblmulticurrencysetup"("multicurrencyid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblratecard2multicurrency" ADD CONSTRAINT "fk_tblratecard2multicurrency_ratecardid_1907030075" FOREIGN KEY ("ratecardid") REFERENCES "tblratecard"("ratecardid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblratecard2publication" ADD CONSTRAINT "fk_tblratecard2publication_tblratecard_1719221425" FOREIGN KEY ("ratecardid") REFERENCES "tblratecard"("ratecardid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblratecardentry" ADD CONSTRAINT "fk_tblratecardentry_multicurrencyid_1971030303" FOREIGN KEY ("multicurrencyid") REFERENCES "tblmulticurrencysetup"("multicurrencyid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblratecardentry" ADD CONSTRAINT "fk_tblratecardentry_tblratecard_1074206977" FOREIGN KEY ("ratecardid") REFERENCES "tblratecard"("ratecardid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblratecardinventry" ADD CONSTRAINT "fk_tblratecardinventry_tblratecard_1473544433" FOREIGN KEY ("ratecardid") REFERENCES "tblratecard"("ratecardid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblratecardpricingmodel" ADD CONSTRAINT "fk_tblratecardpricingmodel_ratecardid_1722697435" FOREIGN KEY ("ratecardid") REFERENCES "tblratecard"("ratecardid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblreportsubscribercriteria" ADD CONSTRAINT "fk_tblreportsubscribercriteria_tblreportsubscriberfields_855010" FOREIGN KEY ("fieldid") REFERENCES "tblreportsubscriberfields"("fieldid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblreportsubscriberdisplay" ADD CONSTRAINT "fk_tblreportsubscriberdisplay_tblreportsubscriberdisplayfields_" FOREIGN KEY ("fieldid") REFERENCES "tblreportsubscriberdisplayfields"("fieldid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblreportsubscriptioncriteria" ADD CONSTRAINT "fk_tblreportsubscriptioncriteria_tblreportsubscriptionfields_79" FOREIGN KEY ("fieldid") REFERENCES "tblreportsubscriptionfields"("fieldid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblreportsubscriptiondisplay" ADD CONSTRAINT "fk_tblreportsubscriptiondisplay_tblreportsubscriptiondisplayfie" FOREIGN KEY ("fieldid") REFERENCES "tblreportsubscriptiondisplayfields"("fieldid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsalesopportunity" ADD CONSTRAINT "fk_tblsalesopportunity_tblsalespipeline_533069135" FOREIGN KEY ("pipelinestageid") REFERENCES "tblsalespipeline"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsearchfieldproducttypemapping" ADD CONSTRAINT "fk__tblsearch__field__78acfb85" FOREIGN KEY ("fieldid") REFERENCES "tblsearchfieldconfig"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblselfserviceportalitem" ADD CONSTRAINT "fk_tblselfserviceportalitem_planid_1508460698" FOREIGN KEY ("planid") REFERENCES "tblplan"("planid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsidebar" ADD CONSTRAINT "fk_tblsidebar_tbluserrole_roleid_1450696466" FOREIGN KEY ("roleid") REFERENCES "tbluserrole"("roleid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriber" ADD CONSTRAINT "fk_tblsubscriber_tblcontact_1522208573" FOREIGN KEY ("contactid") REFERENCES "tblcontact"("contactid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriber" ADD CONSTRAINT "fk_tblsubscriber_tblsubscribertype_1538208630" FOREIGN KEY ("subscribertypeid") REFERENCES "tblsubscribertype"("subscribertypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscription" ADD CONSTRAINT "fk_tblsubscription_tblsubscriber_1554208687" FOREIGN KEY ("subscriberid") REFERENCES "tblsubscriber"("subscriberid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscription" ADD CONSTRAINT "fk_tblsubscription_tblsubscriptiontype_1216059418" FOREIGN KEY ("subscriptiontypeid") REFERENCES "tblsubscriptiontype"("subscriptiontypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscription2address" ADD CONSTRAINT "fk_tblsubscription2address_tblcontactaddress_967010526" FOREIGN KEY ("addressid") REFERENCES "tblcontactaddress"("addressid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscription2address" ADD CONSTRAINT "fk_tblsubscription2address_tblsubscription_1232059475" FOREIGN KEY ("subscriptionid") REFERENCES "tblsubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriptionbillingcommunication" ADD CONSTRAINT "fk_tblsubscriptionbillingcommunication_tblsubscriptionbillingse" FOREIGN KEY ("billingseriesid") REFERENCES "tblsubscriptionbillingseries"("billingseriesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriptionbillingseries" ADD CONSTRAINT "fk_tblsubscriptionbillingseries_tblsubscriptionbillingseriestyp" FOREIGN KEY ("billingseriestypeid") REFERENCES "tblsubscriptionbillingseriestype"("billingseriestypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriptionrenewalcommunication" ADD CONSTRAINT "fk_tblsubscriptionrenewalcommunication_tblsubscriptionrenewalse" FOREIGN KEY ("renewalseriesid") REFERENCES "tblsubscriptionrenewalseries"("renewalseriesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriptionrenewalprices" ADD CONSTRAINT "fk_tblsubscriptionrenewalprices_tblsubscriptionrenewalseries_21" FOREIGN KEY ("renewalseriesid") REFERENCES "tblsubscriptionrenewalseries"("renewalseriesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriptionrenewalseries" ADD CONSTRAINT "fk_tblsubscriptionrenewalseries_tblsubscriptionrenewalseriestyp" FOREIGN KEY ("renewalseriestypeid") REFERENCES "tblsubscriptionrenewalseriestype"("renewalseriestypeid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriptionseriescommunications" ADD CONSTRAINT "fk_tblsubscriptioncommunications_tblsubscription_450152699" FOREIGN KEY ("subscriptionid") REFERENCES "tblsubscription"("subscriptionid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsubscriptionseriesletter" ADD CONSTRAINT "fk_tblsubscriptionseriesletter_tblsubscriptionseries_352056340" FOREIGN KEY ("seriesid") REFERENCES "tblsubscriptionseries"("seriesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblsummaryemailfrequency" ADD CONSTRAINT "fk_tblsummaryemailfrequency_tblsummeryreportemail_1160547368" FOREIGN KEY ("summaryemailid") REFERENCES "tblsummeryreportemail"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tbltaxgroupmapping" ADD CONSTRAINT "fk__tbltaxgro__taxgr__006e18de" FOREIGN KEY ("taxgroupid") REFERENCES "tbltaxgroup"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblusercheckin" ADD CONSTRAINT "fk_tblusercheckin_customerid_1754697549" FOREIGN KEY ("customerid") REFERENCES "gscustomers"("gscustomersid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblusercheckin" ADD CONSTRAINT "fk_tblusercheckin_userid_1738697492" FOREIGN KEY ("userid") REFERENCES "gsemployees"("gsemployeesid") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblwebadbanners" ADD CONSTRAINT "fk_tblwebadbanners_tblwebadcampaign_363968473" FOREIGN KEY ("campaignid") REFERENCES "tblwebadcampaign"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblwebadcampaign" ADD CONSTRAINT "fk_tblwebadcampaign_tblwebadcampaigntype_379968530" FOREIGN KEY ("campaigntypeid") REFERENCES "tblwebadcampaigntype"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblwebadcampaign" ADD CONSTRAINT "fk_tblwebadcampaign_tblwebadspricingmodel_395968587" FOREIGN KEY ("pricingmodelid") REFERENCES "tblwebadpricingmodel"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblwebadcampaign2section" ADD CONSTRAINT "fk_tblwebadcampaign2section_tblwebadcampaign_411968644" FOREIGN KEY ("campaignid") REFERENCES "tblwebadcampaign"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "tblwebadcampaign2section" ADD CONSTRAINT "fk_tblwebadcampaign2section_tblwebadsection_427968701" FOREIGN KEY ("sectionid") REFERENCES "tblwebadsection"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
