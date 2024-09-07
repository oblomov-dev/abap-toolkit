INTERFACE zif_app PUBLIC.
  INTERFACES if_serializable_object.

  CONSTANTS version TYPE string VALUE '1.134.0'.
  CONSTANTS origin  TYPE string VALUE 'https://github.com/abap2UI5/abap2UI5'.
  CONSTANTS author  TYPE string VALUE 'https://github.com/oblomov-dev'.
  CONSTANTS license TYPE string VALUE 'MIT'.

  DATA id_draft TYPE string.
  DATA id_app   TYPE string.

  METHODS main
    IMPORTING
      client TYPE REF TO zif_client.

ENDINTERFACE.
