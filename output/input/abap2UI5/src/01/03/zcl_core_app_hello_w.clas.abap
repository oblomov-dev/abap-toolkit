CLASS zcl_core_app_hello_w DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_app.
    DATA name TYPE string.
    DATA check_initialized TYPE abap_bool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_core_app_hello_w IMPLEMENTATION.


  METHOD zif_app~main.

    IF check_initialized = abap_false.
      check_initialized = abap_true.

      client->view_display( zcl_xml_view=>factory(
        )->shell(
        )->page( title = 'abap2UI5 - Hello World App'
        )->simple_form( editable = abap_true
            )->content( ns = `form`
                )->title( 'Make an input here and send it to the server...'
                )->label( 'Enter your name'
                )->input( client->_bind_edit( name )
                )->button( text  = 'post' press = client->_event( 'BUTTON_POST' )
        )->stringify( ) ).

    ENDIF.

    CASE client->get( )-event.
      WHEN 'BUTTON_POST'.
        client->message_toast_display( |Your name is { name }| ).
      WHEN OTHERS.
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
