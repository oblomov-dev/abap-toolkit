## ABAP Toolkit
Utility Functions for ABAP Cloud & Standard ABAP

#### Key Features
* Simplified SAP APIs to class-based methods
* Hides language version differences between ABAP Cloud and Standard ABAP
* Function Scope: GUIDs, RTTI, Messages, Persistence etc.

#### Compatibility
* S/4 Public Cloud and BTP ABAP Environment (ABAP Cloud)
* S/4 Private Cloud and On-Premise (ABAP Cloud, Standard ABAP)
* R/3 NetWeaver AS ABAP 7.02 or higher (Standard ABAP)

#### Credits
* [ajson](https://github.com/sbcgua/ajson)
* [S-RTTI](https://github.com/sandraros/S-RTTI)
* [steampunkification](https://github.com/heliconialabs/steampunkification)
  
#### Usage

```abap

"strings
zoblomov_cl_util=>c_trim_upper( ` JsadfHHs  ` ). "->JSADFHHS
zoblomov_cl_util=>c_trim_lower( ` JsadfHHs  ` ). "->jsadfhhs

"ajson
DATA(lv_json) = zoblomov_cl_util=>json_stringify( data ).

"...
```

#### Contribution & Support
Pull requests are welcome! Whether you're fixing bugs, adding new functionality, or improving documentation, your contributions are highly appreciated. If you encounter any issues, feel free to open an issue.
