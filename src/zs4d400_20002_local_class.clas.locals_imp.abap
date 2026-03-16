*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_connection definition.

  public section.

  DATA carrier_id TYPE /dmo/carrier_id.
  DATA connection_id TYPE /dmo/connection_id.

  METHODS set_attributes

    IMPORTING

    i_carrier_id TYPE /dmo/carrier_id OPTIONAl
    i_connection_id TYPE /dmo/connection_id.


  METHODS get_attributes

    EXPORTING

    e_carrier_id TYPE /dmo/carrier_id
    e_connection_id TYPE /dmo/connection_id.


*We use data-class to define static object.
  CLASS-DATA conn_counter TYPE i.


  protected section.


  private section.


endclass.

class lcl_connection implementation.


  method get_attributes.

    e_carrier_id = carrier_id.
    e_connection_id = connection_id.

  endmethod.

  method set_attributes.

  carrier_id  = i_carrier_id.
  connection_id = i_connection_id.
  conn_counter = conn_counter + 1.


  endmethod.

endclass.
