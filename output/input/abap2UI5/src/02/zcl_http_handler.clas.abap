CLASS zcl_http_handler DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    CLASS-METHODS main
      IMPORTING
        body          TYPE string
        config        TYPE zif_types=>ty_s_http_request_get OPTIONAL
      RETURNING
        VALUE(result) TYPE string.

    CLASS-METHODS http_post
      IMPORTING
        val           TYPE string
      RETURNING
        VALUE(result) TYPE string.

    CLASS-METHODS http_get
      IMPORTING
        val           TYPE zif_types=>ty_s_http_request_get OPTIONAL
      RETURNING
        VALUE(result) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_http_handler IMPLEMENTATION.


  METHOD http_get.

    DATA(lo_get) = NEW zcl_core_http_get( val ).
    result = lo_get->main( ).

  ENDMETHOD.


  METHOD http_post.

    DATA(lo_post) = NEW zcl_core_http_post( val ).
    result = lo_post->main( ).

  ENDMETHOD.

  METHOD main.

    result = SWITCH #( body
     WHEN `` THEN http_get( config )
     ELSE http_post( body ) ).

  ENDMETHOD.

ENDCLASS.
