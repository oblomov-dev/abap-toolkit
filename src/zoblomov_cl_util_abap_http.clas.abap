CLASS zoblomov_cl_util_abap_http DEFINITION PUBLIC.

  PUBLIC SECTION.

    CLASS-METHODS factory
      IMPORTING
        server        TYPE REF TO object
      RETURNING
        VALUE(result) TYPE REF TO zoblomov_cl_util_abap_http.

    CLASS-METHODS factory_cloud
      IMPORTING
        req           TYPE REF TO object
        res           TYPE REF TO object
      RETURNING
        VALUE(result) TYPE REF TO zoblomov_cl_util_abap_http.

    METHODS get_header_field
      IMPORTING
        val           TYPE clike
      RETURNING
        VALUE(result) TYPE string.

    METHODS get_cdata
      RETURNING
        VALUE(result) TYPE string.

    METHODS get_method
      RETURNING
        VALUE(result) TYPE string.

    METHODS set_cdata
      IMPORTING
        val TYPE clike.

    METHODS set_status
      IMPORTING
        !code  TYPE i
        reason TYPE clike.

    METHODS set_session_stateful
      IMPORTING
        val TYPE i.

    METHODS get_response_cookie
      IMPORTING
        val           TYPE clike
      RETURNING
        VALUE(result) TYPE string.

    METHODS delete_response_cookie
      IMPORTING
        val TYPE clike.

    METHODS set_header_field
      IMPORTING
        !n TYPE clike
        v  TYPE clike.

    DATA mo_server_onprem  TYPE REF TO object.
    DATA mo_request_cloud  TYPE REF TO object.
    DATA mo_response_cloud TYPE REF TO object.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zoblomov_cl_util_abap_http IMPLEMENTATION.
  METHOD delete_response_cookie.

    DATA temp1 TYPE string.
    temp1 = val.
    DATA lv_val LIKE temp1.
    lv_val = temp1.

    IF mo_server_onprem IS BOUND.

      DATA object TYPE REF TO object.
      FIELD-SYMBOLS <any> TYPE any.

      ASSIGN mo_server_onprem->('RESPONSE') TO <any>.
      object = <any>.

      CALL METHOD object->('DELETE_COOKIE')
        EXPORTING name = lv_val.

    ELSE.

*      CALL METHOD mo_response_cloud->('DELETE_COOKIE_AT_CLIENT')
*        EXPORTING
*          name = lv_val.

    ENDIF.

  ENDMETHOD.

  METHOD get_response_cookie.

    DATA object TYPE REF TO object.
    FIELD-SYMBOLS <any> TYPE any.

    DATA temp2 TYPE string.
    temp2 = val.
    DATA lv_val LIKE temp2.
    lv_val = temp2.

    IF mo_server_onprem IS BOUND.

      ASSIGN mo_server_onprem->('RESPONSE') TO <any>.
      object = <any>.

      CALL METHOD object->('GET_COOKIE')
        EXPORTING name  = lv_val
        IMPORTING value = result.

    ELSE.

*      CALL METHOD mo_request_cloud->('GET_COOKIE')
*        EXPORTING
*          i_name  = lv_val
*        RECEIVING
*          r_value = result.

    ENDIF.

  ENDMETHOD.

  METHOD get_header_field.

    DATA object TYPE REF TO object.
    FIELD-SYMBOLS <any> TYPE any.

    DATA temp3 TYPE string.
    temp3 = val.
    DATA lv_val LIKE temp3.
    lv_val = temp3.

    IF mo_server_onprem IS BOUND.

      ASSIGN mo_server_onprem->('REQUEST') TO <any>.
      object = <any>.

      CALL METHOD object->('GET_HEADER_FIELD')
        EXPORTING name  = lv_val
        RECEIVING value = result.

    ELSE.

      CALL METHOD mo_request_cloud->('IF_WEB_HTTP_REQUEST~GET_HEADER_FIELD')
        EXPORTING i_name  = lv_val
        RECEIVING r_value = result.

    ENDIF.

  ENDMETHOD.

  METHOD set_header_field.

    DATA object TYPE REF TO object.
    FIELD-SYMBOLS <any> TYPE any.

    DATA temp4 TYPE string.
    temp4 = n.
    DATA lv_n LIKE temp4.
    lv_n = temp4.
    DATA temp5 TYPE string.
    temp5 = v.
    DATA lv_v LIKE temp5.
    lv_v = temp5.
    IF mo_server_onprem IS BOUND.

      ASSIGN mo_server_onprem->('RESPONSE') TO <any>.
      object = <any>.

      CALL METHOD object->('SET_HEADER_FIELD')
        EXPORTING name  = lv_n
                  value = lv_v.

    ELSE.

      CALL METHOD mo_response_cloud->('IF_WEB_HTTP_RESPONSE~SET_HEADER_FIELD')
        EXPORTING i_name  = lv_n
                  i_value = lv_v.

    ENDIF.

  ENDMETHOD.

  METHOD factory.

    CREATE OBJECT result.
    result->mo_server_onprem = server.

  ENDMETHOD.

  METHOD factory_cloud.

    CREATE OBJECT result.
    result->mo_request_cloud  = req.
    result->mo_response_cloud = res.

  ENDMETHOD.

  METHOD get_cdata.

    DATA object TYPE REF TO object.
    FIELD-SYMBOLS <any> TYPE any.

    IF mo_server_onprem IS BOUND.

      ASSIGN mo_server_onprem->('REQUEST') TO <any>.
      object = <any>.

      CALL METHOD object->('GET_CDATA')
        RECEIVING data = result.

    ELSE.

      CALL METHOD mo_request_cloud->('IF_WEB_HTTP_REQUEST~GET_TEXT')
        RECEIVING r_value = result.

    ENDIF.

  ENDMETHOD.

  METHOD get_method.

    DATA object TYPE REF TO object.
    FIELD-SYMBOLS <any> TYPE any.

    IF mo_server_onprem IS BOUND.

      ASSIGN mo_server_onprem->('REQUEST') TO <any>.
      object = <any>.

      CALL METHOD object->('IF_HTTP_REQUEST~GET_METHOD')
        RECEIVING method = result.

    ELSE.

      CALL METHOD mo_request_cloud->('IF_WEB_HTTP_REQUEST~GET_METHOD')
        RECEIVING r_value = result.

    ENDIF.

  ENDMETHOD.

  METHOD set_cdata.

    DATA object TYPE REF TO object.
    FIELD-SYMBOLS <any> TYPE any.

    IF mo_server_onprem IS BOUND.

      ASSIGN mo_server_onprem->('RESPONSE') TO <any>.
      object = <any>.

      CALL METHOD object->('SET_CDATA')
        EXPORTING data = val.

    ELSE.

      CALL METHOD mo_response_cloud->('IF_WEB_HTTP_RESPONSE~SET_TEXT')
        EXPORTING i_text = val.

    ENDIF.

  ENDMETHOD.

  METHOD set_status.

    DATA object TYPE REF TO object.
    FIELD-SYMBOLS <any> TYPE any.

    DATA temp6 TYPE string.
    temp6 = reason.
    DATA lv_reason LIKE temp6.
    lv_reason = temp6.

    IF mo_server_onprem IS BOUND.

      ASSIGN mo_server_onprem->('RESPONSE') TO <any>.
      object = <any>.

      CALL METHOD object->('IF_HTTP_RESPONSE~SET_STATUS')
        EXPORTING code   = code
                  reason = lv_reason.

    ELSE.

      CALL METHOD mo_response_cloud->('IF_WEB_HTTP_RESPONSE~SET_STATUS')
        EXPORTING i_code   = code
                  i_reason = lv_reason.

    ENDIF.

  ENDMETHOD.

  METHOD set_session_stateful.

    IF mo_server_onprem IS BOUND.

      CALL METHOD mo_server_onprem->('SET_SESSION_STATEFUL')
        EXPORTING stateful = val.

    ELSE.

      ASSERT 1 = 'NO_STATEFUL_FEATURE_IN_CLOUD_ERROR'.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
