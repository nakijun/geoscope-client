object fmEnforaMT3000TrackerBusinessModelDeviceInitializerPanel: TfmEnforaMT3000TrackerBusinessModelDeviceInitializerPanel
  Left = 509
  Top = 282
  BorderStyle = bsDialog
  Caption = 'Device initializer'
  ClientHeight = 358
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 478
    Height = 153
    Align = alTop
    Caption = ' Parameters '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object pcParameters: TPageControl
      Left = 2
      Top = 18
      Width = 474
      Height = 133
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'ModemID'
        DesignSize = (
          466
          102)
        object memoEnforaModemID: TMemo
          Left = 8
          Top = 9
          Width = 449
          Height = 56
          Anchors = [akLeft, akTop, akRight]
          HideSelection = False
          ReadOnly = True
          TabOrder = 0
        end
        object btnCopyEnforaModemIDToClipboard: TBitBtn
          Left = 8
          Top = 73
          Width = 449
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Copy to clipboard'
          TabOrder = 1
          OnClick = btnCopyEnforaModemIDToClipboardClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Script'
        ImageIndex = 1
        object memoEnforaInitializationScript: TMemo
          Left = 0
          Top = 0
          Width = 466
          Height = 102
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'AT$AREG=1'#9#9#9#9#9#9
            'AT&F'#9#9#9#9#9#9#9
            'AT&W'#9#9#9#9#9#9#9
            'AT$OBDFAC'#9#9#9#9#9#9
            'AT$MSGLOGCL'#9#9#9#9#9#9
            'AT$EVTEST=100,0'#9#9#9#9#9
            'AT$EVTEST=101,0'#9#9#9#9#9
            'AT$EVTEST=102,0'#9#9#9#9#9
            'AT$EVTEST=103,0'#9#9#9#9#9
            'AT$EVTEST=104,0'#9#9#9#9#9
            'AT$EVTEST=105,0'#9#9#9#9#9
            'AT$EVTEST=106,0'#9#9#9#9#9
            'AT$EVTEST=107,0'#9#9#9#9#9
            'AT$EVTEST=108,0'#9#9#9#9#9
            'AT$EVTEST=109,0'#9#9#9#9#9
            'AT$EVTOFF=1'#9#9#9#9#9#9
            'AT+CFUN=0'#9#9#9#9#9#9
            'AT$USRVAL=23741321'#9#9#9#9#9#9
            'AT%SLEEP=4'#9#9#9#9#9#9#9#9
            'AT$NETMON=15,1,0,0'#9#9#9#9#9#9
            'AT$HBRST=24,1'#9#9#9#9#9#9#9
            'AT+CGDCONT=1,"IP",<APN>,"",0,0'#9
            'AT$WAKEUP=1,1'#9#9#9#9#9#9#9
            'AT$FRIEND=1,1,<TCPSERVERADDRESS>,<TCPSERVERPORT>,3'#9
            'AT$TCPAPI=1'
            'AT$TCPIDLETO=86400'
            'AT$UDPAPI=<UDPSERVERADDRESS>,<UDPSERVERPORT>'
            'AT$GPSFD=1 '#9#9#9#9' '#9#9#9#9
            'AT$MDMID=<MDMID>'
            'AT$EVTIM5=0'#9#9#9#9#9#9
            'AT$ETSAV5=1'#9#9#9#9#9#9
            'AT$STOATEV=1,AT$EVTIM5=60'#9#9
            'AT$STOATEV=2,AT$EVTIM5=30'#9#9
            'AT$EVENT=10,1,8,1,1'#9#9#9#9
            'AT$EVENT=10,3,52,1000,3801039'#9
            'AT$EVENT=14,0,178,0,0'#9#9#9
            'AT$EVENT=14,3,52,1100,674889679'#9
            'AT$EVENT=14,3,44,1,0'#9#9#9
            'AT$IGNDBNC=4'#9#9#9#9#9
            'AT$EVENT=15,0,178,1,1'#9#9#9
            'AT$EVENT=15,3,52,1110,3801039'#9
            'AT$EVENT=15,3,44,2,0'#9#9#9
            'AT$PWRSAV=1,82800'#9#9#9#9#9
            'AT$EVENT=19,0,26,1,1'#9#9#9
            'AT$EVENT=19,3,52,1200,3801039'#9
            'AT$EVENT=20,0,26,0,0'#9#9#9
            'AT$EVENT=20,3,52,1210,3801039'
            'AT$EVTIM10=0'#9#9#9#9#9
            'AT$ETSAV10=1                    '
            'AT$STOATEV=30,AT$EVTIM10=0      '
            'AT$STOATEV=31,AT$EVTIM10=86400'#9' '
            'AT$STOATEV=32,AT$OFF            '
            'AT$EVENT=14,3,44,31,0           '
            'AT$EVENT=15,3,44,30,0           '
            'AT$EVENT=21,1,184,1,1           '
            'AT$EVENT=21,2,178,0,0           '
            'AT$EVENT=21,3,44,32,0           '
            'AT$EVENT=11,1,177,0,0'#9#9#9
            'AT$EVENT=11,3,53,1010,3801039'
            'AT$STOATEV=15,AT$EVTEST=50,0'
            'AT$EVENT=23,0,50,1,1'#9#9#9
            'AT$EVENT=23,3,52,0100,406454223'#9
            'AT$EVENT=23,3,44,15,0'
            'AT$EVTIM6=10'#9#9'  '#9
            'AT$ETSAV6=1'
            'AT$EVENT=16,1,67,1,1'#9#9#9
            'AT$EVENT=16,3,52,2500,406454223'
            'AT$EVENT=17,1,66,1,1'#9#9#9
            'AT$EVENT=17,2,178,0,0'#9#9#9
            'AT$EVENT=17,3,52,2100,3801039'#9
            'AT$EVENT=18,1,66,1,1'#9#9#9
            'AT$EVENT=18,2,178,1,1'#9#9#9
            'AT$EVENT=18,3,52,2110,3801039'
            'AT$EVENT=12,1,8,1,1'#9#9#9#9
            'AT$EVENT=12,2,178,0,0'#9#9#9
            'AT$EVENT=12,3,44,1,0'#9#9#9
            'AT$EVENT=13,1,8,1,1'#9#9#9#9
            'AT$EVENT=13,2,178,1,1'#9#9#9
            'AT$EVENT=13,3,44,2,0'
            'AT$EVENT=24,0,16,<THRESHOLD>,1000000'#9
            'AT$EVENT=24,2,178,1,1'#9#9
            'AT$EVENT=24,3,52,2200,3801039'
            'AT$EVTIM2=<CHECKPOINT>'#9#9#9#9
            'AT$ETSAV2=1'#9#9#9#9#9#9
            'AT$STOATEV=4,AT$EVTIM2=0'#9#9
            'AT$EVENT=25,1,13,1,1'#9
            'AT$EVENT=25,0,16,15,1000000'
            'AT$EVENT=25,2,178,1,1'#9#9#9
            'AT$EVENT=25,3,53,2300,3801039'#9
            'AT$EVENT=25,3,44,4,0'#9#9#9
            'AT$STOATEV=5,AT$OBDGSP=1'#9#9
            'AT$STOATEV=6,AT$OBDSAV'#9#9#9
            'AT$EVENT=96,3,44,5,0'#9#9#9
            'AT$EVENT=96,3,44,6,0'
            'AT$OBDEES=1,4000,3,10'
            'AT$OBDEES=2,8000,3,10'#9
            'AT$OBDEES=3,12000,3,10'
            'AT$EVENT=26,0,167,1,1'#9#9#9
            'AT$EVENT=26,3,52,10100,3801039'#9
            'AT$EVENT=27,0,167,0,0'#9#9#9
            'AT$EVENT=27,3,52,10110,3801039'#9
            'AT$EVENT=28,0,168,1,1'#9#9#9
            'AT$EVENT=28,3,52,10200,3801039'
            'AT$EVENT=29,0,168,0,0'#9#9#9
            'AT$EVENT=29,3,52,10210,3801039'
            'AT$EVENT=30,0,169,1,1'#9#9#9
            'AT$EVENT=30,3,52,10300,3801039'
            'AT$EVENT=31,0,169,0,0'#9#9#9
            'AT$EVENT=31,3,52,10310,3801039'#9#9#9
            'AT$EVENT=26,0,167,1,1'#9#9#9
            'AT$EVENT=26,3,52,10100,3801039'#9
            'AT$EVENT=27,0,167,0,0'#9#9#9
            'AT$EVENT=27,3,52,10110,3801039'
            'AT$OBDSPD=1,40,10,25'
            'AT$OBDSPD=2,60,10,50'
            'AT$OBDSPD=3,100,10,85'#9
            'AT$EVENT=32,0,172,1,1'#9#9#9
            'AT$EVENT=32,3,52,10400,3801039'#9
            'AT$EVENT=33,0,172,0,0'#9#9#9
            'AT$EVENT=33,3,52,10410,3801039'#9
            'AT$EVENT=34,0,173,1,1'#9#9#9
            'AT$EVENT=34,3,52,10500,3801039'#9
            'AT$EVENT=35,0,173,0,0'#9#9#9
            'AT$EVENT=35,3,52,10510,3801039'#9
            'AT$EVENT=36,0,174,1,1'#9#9#9
            'AT$EVENT=36,3,52,10600,3801039'#9
            'AT$EVENT=37,0,174,0,0'#9#9#9
            'AT$EVENT=37,3,52,10610,3801039'#9
            'AT$EVENT=32,0,172,1,1'#9#9#9
            'AT$EVENT=32,3,52,10400,3801039'#9
            'AT$EVENT=33,0,172,0,0'#9#9#9
            'AT$EVENT=33,3,52,10410,3801039'#9
            'AT$OBDIDL=2,180,180'#9#9#9#9
            'AT$EVENT=38,0,171,1,1'#9#9#9
            'AT$EVENT=38,2,178,1,1'#9#9#9
            'AT$EVENT=38,3,52,3300,3801039'#9
            'AT$EVENT=39,0,171,0,0'#9#9#9
            'AT$EVENT=39,2,178,1,1'#9#9#9
            'AT$EVENT=39,3,52,3310,3801039'#9
            'AT$EVENT=40,0,176,1,1'#9#9#9
            'AT$EVENT=40,3,52,10700,406454223'
            'AT$EVENT=41,0,176,0,0'#9#9#9
            'AT$EVENT=41,3,52,10710,406454223'
            'AT$OBDLBL=11500,300,300'#9#9#9
            'AT$EVENT=42,0,175,1,1'#9#9#9
            'AT$EVENT=42,3,52,10800,3801039'#9
            'AT$EVENT=43,0,175,0,0'#9#9#9
            'AT$EVENT=43,3,52,10810,3801039'#9
            'AT$OBDLFL=12,60,60'#9#9#9#9
            'AT$EVENT=44,0,170,1,1'#9#9#9
            'AT$EVENT=44,3,52,10900,3801039'#9
            'AT$EVENT=45,0,170,0,0'#9#9#9
            'AT$EVENT=45,3,52,10910,3801039'#9
            'AT$OBDAM=1,10,3,180'#9#9#9#9
            'AT$EVENT=46,0,62,1,1'#9#9#9
            'AT$EVENT=46,3,52,11000,3801039'#9
            'AT$EVENT=47,0,62,0,0'#9#9#9
            'AT$EVENT=47,3,52,11010,3801039'#9
            'AT$OBDACL=1,150,1,10'
            'AT$OBDACL=2,250,1,10'
            'AT$OBDACL=3,350,1,10'#9#9#9
            'AT$EVENT=48,0,161,1,1'#9#9#9
            'AT$EVENT=48,2,178,1,1'#9#9#9
            'AT$EVENT=48,3,52,11100,3801039'#9
            'AT$EVENT=49,0,161,0,0'#9#9#9
            'AT$EVENT=49,2,178,1,1'#9#9#9
            'AT$EVENT=49,3,52,11110,3801039'
            'AT$EVENT=50,0,162,1,1'#9
            'AT$EVENT=50,2,178,1,1'
            'AT$EVENT=50,3,52,11200,3801039'
            'AT$EVENT=51,0,162,0,0'#9#9#9
            'AT$EVENT=51,2,178,1,1'#9#9#9
            'AT$EVENT=51,3,52,11210,3801039'
            'AT$EVENT=52,0,163,1,1'#9#9#9
            'AT$EVENT=52,2,178,1,1'#9#9
            'AT$EVENT=52,3,52,11300,3801039'
            'AT$EVENT=53,0,163,0,0'#9#9#9
            'AT$EVENT=53,2,178,1,1'#9#9#9
            'AT$EVENT=53,3,52,11310,3801039'
            'AT$OBDDCL=1,380,1,10'#9
            'AT$OBDDCL=2,400,1,10'
            'AT$OBDDCL=3,500,1,10'#9#9
            'AT$EVENT=54,0,164,1,1'#9#9#9
            'AT$EVENT=54,2,178,1,1'#9#9#9
            'AT$EVENT=54,3,52,11400,3801039'#9
            'AT$EVENT=55,0,164,0,0'#9#9#9
            'AT$EVENT=55,2,178,1,1'#9#9#9
            'AT$EVENT=55,3,52,11410,3801039'
            'AT$EVENT=56,0,165,1,1'#9#9#9
            'AT$EVENT=56,2,178,1,1'#9#9#9
            'AT$EVENT=56,3,52,11500,3801039'
            'AT$EVENT=57,0,165,0,0'#9#9#9
            'AT$EVENT=57,2,178,1,1'#9#9#9
            'AT$EVENT=57,3,52,11510,3801039'
            'AT$EVENT=58,0,166,1,1'#9#9#9
            'AT$EVENT=58,2,178,1,1'#9#9#9
            'AT$EVENT=58,3,52,11600,3801039'
            'AT$EVENT=59,0,166,0,0'#9#9#9
            'AT$EVENT=59,2,178,1,1'#9#9#9
            'AT$EVENT=59,3,52,11610,3801039'
            'AT$EVENT=10,3,125,4,1'#9#9#9
            'AT$EVENT=60,0,62,1,1'#9#9#9
            'AT$EVENT=60,2,178,1,1'#9#9#9
            'AT$EVENT=60,3,125,4,0'#9#9#9
            'AT$EVENT=61,1,30,180,1000000'#9
            'AT$EVENT=61,2,178,0,0'#9#9#9
            'AT$EVENT=61,2,104,0,0'#9#9#9
            'AT$EVENT=61,3,52,3320,3801039'#9
            'AT$EVENT=61,3,125,4,1'#9#9#9
            'AT$GFDBNC=60,60'#9#9#9#9#9
            'AT$GEOFNC=1,0,0,0'#9
            'AT$GEOFNC=2,0,0,0'#9
            'AT$GEOFNC=3,0,0,0'#9
            'AT$EVENT=62,0,21,0,0'#9#9#9
            'AT$EVENT=62,3,52,4101,3801039'#9
            'AT$EVENT=63,0,21,1,1'#9#9#9
            'AT$EVENT=63,3,52,4201,3801039'#9
            'AT$EVENT=64,0,22,0,0'#9#9#9
            'AT$EVENT=64,3,52,4102,3801039'#9
            'AT$EVENT=65,0,22,1,1'#9#9#9
            'AT$EVENT=65,3,52,4202,3801039'#9
            'AT$EVENT=66,0,23,0,0'#9#9#9
            'AT$EVENT=66,3,52,4103,3801039'#9
            'AT$EVENT=67,0,23,1,1'#9#9#9
            'AT$EVENT=67,3,52,4203,3801039'#9
            'AT$EVTIM3=0'#9#9#9#9#9#9
            'AT$ETSAV3=1'#9#9#9#9#9#9
            'AT$EVTIM8=0'#9#9#9#9#9#9
            'AT$ETSAV8=1'#9#9#9#9#9#9
            'AT$STOATEV=16,AT$GPSCMD=0'#9#9
            'AT$STOATEV=17,AT$GPSCMD=1'#9#9
            'AT$STOATEV=18,AT$EVTIM3=0'#9#9
            'AT$STOATEV=19,AT$EVTIM3=60'#9#9
            'AT$STOATEV=20,AT$EVTIM8=0'#9#9
            'AT$STOATEV=21,AT$EVTIM8=3600'#9
            'AT$STOATEV=22,AT$EVTEST=105,1'#9
            'AT$EVENT=14,3,125,1,1'#9#9#9
            'AT$EVENT=15,3,125,1,0'#9#9#9
            'AT$EVENT=15,3,44,18,0'#9#9#9
            'AT$EVENT=15,3,125,6,0'#9#9#9
            'AT$EVENT=19,3,125,6,2'#9#9#9
            'AT$EVENT=69,0,62,1,1'#9#9#9
            'AT$EVENT=69,2,106,2,2'#9#9#9
            'AT$EVENT=69,3,44,17,0'#9#9#9
            'AT$EVENT=69,3,125,6,1'#9#9#9
            'AT$EVENT=69,3,43,3,900'#9#9#9
            'AT$EVENT=70,1,14,1,1'#9#9#9
            'AT$EVENT=70,2,106,1,1'#9#9#9
            'AT$EVENT=70,2,62,0,0'#9#9#9
            'AT$EVENT=70,3,44,16,0'#9#9#9
            'AT$EVENT=70,3,44,18,0'#9#9#9
            'AT$EVENT=70,3,125,1,1'#9#9#9
            'AT$EVENT=70,3,125,6,2'#9#9#9
            'AT$ALTOSI=13,45'#9#9#9#9#9
            'AT$EVENT=71,0,119,1,1'#9#9#9
            'AT$EVENT=71,2,101,1,1'#9#9#9
            'AT$EVENT=71,3,44,19,0'#9#9#9
            'AT$EVENT=71,3,125,1,2'#9#9#9
            'AT$EVENT=71,3,125,6,0'#9#9#9
            'AT$EVENT=71,3,52,3200,3801039'#9
            'AT$EVENT=72,1,14,1,1'#9#9#9
            'AT$EVENT=72,2,101,2,2'#9#9#9
            'AT$EVENT=72,3,52,3210,3801039'#9
            'AT$EVENT=73,0,62,0,0'#9#9#9
            'AT$EVENT=73,2,101,2,2'#9#9#9
            'AT$EVENT=73,3,44,21,0'#9#9#9
            'AT$EVENT=74,0,62,1,1'#9#9#9
            'AT$EVENT=74,2,101,2,2'#9#9#9
            'AT$EVENT=74,3,44,20,0'#9#9#9
            'AT$EVENT=75,1,69,1,1'#9#9#9
            'AT$EVENT=75,2,101,2,2'#9#9#9
            'AT$EVENT=75,3,44,22,0'#9#9#9
            'AT$EVENT=76,0,178,1,1'#9#9#9
            'AT$EVENT=76,2,101,2,2'#9#9#9
            'AT$EVENT=76,3,44,22,0'#9#9#9
            'AT$EVENT=77,1,105,1,1'#9#9#9
            'AT$EVENT=77,3,44,18,0'#9#9#9
            'AT$EVENT=77,3,44,20,0'#9#9#9
            'AT$EVENT=77,3,125,1,0'#9#9#9
            'AT$EVENT=77,3,125,5,0'#9#9#9
            'AT$EVENT=77,3,52,3220,3801039'
            'AT$OBDLED=1'
            'AT$EVENT=10,3,125,2,0'#9#9#9
            'AT$EVENT=10,3,125,3,0'#9#9#9
            'AT$EVENT=83,0,27,1,1'#9#9#9
            'AT$EVENT=83,2,102,0,0'#9#9#9
            'AT$EVENT=83,3,125,3,1'#9#9#9
            'AT$EVENT=83,3,52,3400,3801039'#9
            'AT$EVENT=84,0,27,0,0'#9#9#9
            'AT$EVENT=84,2,103,1,1'#9#9#9
            'AT$EVENT=84,3,125,2,1'#9#9#9
            'AT$EVENT=85,0,27,1,1'#9#9#9
            'AT$EVENT=85,2,102,2,2'#9#9#9
            'AT$EVENT=85,3,52,3410,3801039'#9
            'AT$EVENT=86,0,29,300,300'#9#9
            'AT$EVENT=86,2,103,1,1'#9#9#9
            'AT$EVENT=86,3,125,2,2'#9#9#9
            'AT$EVENT=86,3,52,3420,3801039'#9
            'AT$EVTIM1=0'#9#9#9#9#9#9
            'AT$STOATEV=33,AT$EVTIM1=600'#9#9
            'AT$STOATEV=34,AT$EVTIM1=0'#9#9
            'AT$STOATEV=35,AT$RESET'#9#9#9
            'AT$EVENT=87,0,10,1,1'#9#9#9
            'AT$EVENT=87,3,44,34,0'#9#9#9
            'AT$EVENT=88,0,10,5,5'#9#9#9
            'AT$EVENT=88,3,44,34,0'#9#9#9
            'AT$EVENT=89,0,10,0,0 '#9#9#9
            'AT$EVENT=89,2,9,1,1'#9#9#9#9
            'AT$EVENT=89,3,44,33,0'#9#9#9
            'AT$EVENT=90,0,10,0,0 '#9#9#9
            'AT$EVENT=90,2,9,5,5'#9#9#9#9
            'AT$EVENT=90,3,44,33,0'#9#9#9
            'AT$EVENT=91,0,10,2,4'#9#9#9
            'AT$EVENT=91,2,9,1,1'#9#9#9#9
            'AT$EVENT=91,3,44,33,0'#9#9#9
            'AT$EVENT=92,0,10,2,4'#9#9#9
            'AT$EVENT=92,2,9,5,5'#9#9#9#9
            'AT$EVENT=92,3,44,33,0'#9#9#9
            'AT$EVENT=93,0,10,6,9'#9#9#9
            'AT$EVENT=93,2,9,1,1'#9#9#9#9
            'AT$EVENT=93,3,44,33,0'#9#9#9
            'AT$EVENT=94,0,10,6,9'#9#9#9
            'AT$EVENT=94,2,9,5,5'#9#9#9#9
            'AT$EVENT=94,3,44,33,0'#9#9#9
            'AT$EVENT=95,1,12,1,1'#9#9#9
            'AT$EVENT=95,3,44,35,0'#9#9#9
            'AT$EVENT=96,1,185,1,1'#9#9#9
            'AT$EVENT=96,3,52,9900,136970191'#9
            'AT$EVENT=97,1,186,1,1'#9#9#9
            'AT$EVENT=97,3,52,9910,136970191'#9
            'AT$EVENT=98,1,160,1,1'#9#9#9
            'AT$EVENT=98,3,52,9200,3801039'#9
            'AT$EVENT=99,1,147,1,1'#9#9#9
            'AT$EVENT=99,3,52,9100,138018763'#9
            'AT$OBDSAV'#9#9#9#9#9#9
            'AT$EVTOFF=0'
            'AT$AREG=3'#9#9#9#9#9#9
            'AT&W'#9#9#9#9#9#9#9
            'AT$RESET')
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 0
          WordWrap = False
        end
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 153
    Width = 478
    Height = 205
    Align = alClient
    Caption = ' Initialization '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object PageControl2: TPageControl
      Left = 2
      Top = 18
      Width = 474
      Height = 185
      ActivePage = TabSheet5
      Align = alClient
      TabOrder = 0
      object TabSheet5: TTabSheet
        Caption = ' by COM '
        object Label10: TLabel
          Left = 46
          Top = 19
          Width = 69
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'COM port'
        end
        object Label11: TLabel
          Left = 274
          Top = 20
          Width = 65
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Speed'
        end
        object Gauge: TGauge
          Left = 360
          Top = 56
          Width = 57
          Height = 57
          Kind = gkPie
          Progress = 0
          Visible = False
        end
        object bbEnforaWriteDeviceConfiguration: TBitBtn
          Left = 56
          Top = 73
          Width = 289
          Height = 25
          Caption = 'Initialize Enfora device'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = bbEnforaWriteDeviceConfigurationClick
        end
        object EnforaCOMInitialization_edPortSpeed: TEdit
          Left = 342
          Top = 17
          Width = 75
          Height = 24
          TabOrder = 1
          Text = '115200'
        end
        object EnforaCOMInitialization_cbPort: TComboBox
          Left = 118
          Top = 16
          Width = 75
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 0
        end
        object BitBtn1: TBitBtn
          Left = 192
          Top = 15
          Width = 81
          Height = 25
          Caption = 'Search ...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = BitBtn1Click
        end
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 32
    Top = 72
  end
end
