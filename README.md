[![ABAP_702](https://github.com/oblomov-dev/abap-util/actions/workflows/ABAP_702.yaml/badge.svg?branch=702)](https://github.com/oblomov-dev/abap-util/actions/workflows/ABAP_702.yaml)
[![ABAP_STANDARD](https://github.com/oblomov-dev/abap-util/actions/workflows/ABAP_STANDARD.yaml/badge.svg)](https://github.com/oblomov-dev/abap-util/actions/workflows/ABAP_STANDARD.yaml)
[![ABAP_CLOUD](https://github.com/oblomov-dev/abap-util/actions/workflows/ABAP_CLOUD.yaml/badge.svg)](https://github.com/oblomov-dev/abap-util/actions/workflows/ABAP_CLOUD.yaml)
<br>
[![auto_build](https://github.com/oblomov-dev/abap-util/actions/workflows/auto_build.yml/badge.svg)](https://github.com/oblomov-dev/abap-util/actions/workflows/auto_build.yml)
[![auto_downport](https://github.com/oblomov-dev/abap-util/actions/workflows/auto_downport.yaml/badge.svg)](https://github.com/oblomov-dev/abap-util/actions/workflows/auto_downport.yaml)
<br>
[![test_unit](https://github.com/oblomov-dev/abap-util/actions/workflows/test_unit.yaml/badge.svg)](https://github.com/oblomov-dev/abap-util/actions/workflows/test_unit.yaml)
[![test_rename](https://github.com/oblomov-dev/abap-util/actions/workflows/test_rename.yaml/badge.svg)](https://github.com/oblomov-dev/abap-util/actions/workflows/test_rename.yaml)

# abap-util
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
"string
zoblomov_cl_util=>c_trim_upper( ` JsadfHHs  ` ). "->JSADFHHS
zoblomov_cl_util=>c_trim_lower( ` JsadfHHs  ` ). "->jsadfhhs
```
```abap
"json
DATA(ls_usr01) = VALUE usr01( bname = 'name' langu = 'E' ).
DATA(lv_json) = zoblomov_cl_util=>json_stringify( ls_usr01 ).

DATA(ls_usr01_result) = VALUE usr01( ).
zoblomov_cl_util=>json_parse(
  EXPORTING
    val  = lv_json
  CHANGING
    data = ls_usr01 ).
```

#### Contribution & Support
Pull requests are welcome! Whether you're fixing bugs, adding new functionality, or improving documentation, your contributions are highly appreciated. If you encounter any issues, feel free to open an issue.
