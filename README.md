## ABAP Toolkit
Utility Functions for S/4 Public Cloud, BTP ABAP Environment & ABAP OnPremise

#### Features:
* Simplified SAP APIs to class-based methods

#### Usage:

character operations
```abap

"strings
zcl_util=>c_trim_upper( ` JsadfHHs  ` ). "->JSADFHHS
zcl_util=>c_trim_lower( ` JsadfHHs  ` ). "->jsadfhhs

"json
zcl_util=>json_stringify( data ).

"...
```

