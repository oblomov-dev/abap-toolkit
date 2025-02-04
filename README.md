## ABAP Toolkit
Utility Functions for S/4 Public Cloud, BTP ABAP Environment & ABAP OnPremise

#### Features:
* Simplified SAP APIs to class-based methods
* Hides language version differences between ABAP Cloud and Standard ABAP

#### Compatibility:
* BTP ABAP Environment (ABAP for Cloud)
* S/4 Public Cloud (ABAP for Cloud)
* S/4 Private Cloud or On-Premise (ABAP for Cloud, Standard ABAP)
* R/3 NetWeaver AS ABAP 7.02 or higher (Standard ABAP)

#### Usage:

character operations
```abap

"strings
zoblomov_cl_util=>c_trim_upper( ` JsadfHHs  ` ). "->JSADFHHS
zoblomov_cl_util=>c_trim_lower( ` JsadfHHs  ` ). "->jsadfhhs

"json
zoblomov_cl_util=>json_stringify( data ).

"...
```

