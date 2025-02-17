## ABAP Toolkit
Utility Functions for S/4 Public Cloud, BTP ABAP Environment & ABAP OnPremise

#### Key Features:
* Simplified SAP APIs to class-based methods
* Hides language version differences between ABAP Cloud and Standard ABAP
* Function Scope: GUIDs, RTTI, Messages, Persistence etc.

#### Compatibility:
* S/4 Public Cloud and BTP ABAP Environment (ABAP for Cloud)
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

#### Contribution & Support
Pull requests are welcome! Whether you're fixing bugs, adding new functionality, or improving documentation, your contributions are highly appreciated. If you encounter any issues, feel free to open an issue.
