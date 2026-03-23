
*Determinations are used to fill in fields of an entity based on the values of other fields. In this example, we will create a determination for the GetCities action, which will fill in the City_From, CountryCode, City_To, and CountryCode_To fields based on the AirportFromId and AirportToId fields.
determination GetCities 
  on save ( field AirportfromId, AirportToId; ).

  *Behaviour imlementation for the GetCities determination.
  CLASS lcl_handler DEFINITION
  INHERITING FROM cl_abap_behavior_handler.
    PRIVATE SECTION.
      METHODS get_cities 
      FOR DETERMINE ON SAVE.
      IMPORTING keys
      FOR Connection~GetCities.

  ENDCLASS.










READ ENTITIES OF zs400_r_connections
  ENTITY connections
  FIELDS( AirpotFromId, AirportToId )
  WITH CORRESPONDING #( keys )
  RESULT DATA(connection).
  

LOOP AT connections INTO DATA(connection).
    SELECT SINGLE
     FROM /dmo/airport
      FIELDS City, CountryCode
      WHERE airport_id = @connection-AirpotFromId
      INTO ( @connection-City_From, @connection-CountryCode ).

    SELECT SINGLE
     FROM /dmo/airport
      FIELDS City, CountryCode
      WHERE airport_id = @connection-AirportToId
      INTO ( @connection-City_To, @connection-CountryCode_To ).
    MODIFY connections FROM connection.
