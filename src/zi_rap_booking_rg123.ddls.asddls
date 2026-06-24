@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Booking data'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_RAP_BOOKING_RG123 as select from zrg_booking_03 as Booking
/*association[1..1] to ZI_RAP_TRAVEL_RG123 as _travel on $projection.TravelUuid = _travel.TravelUuid*/
association to parent ZI_RAP_TRAVEL_RG123 as _travel on $projection.TravelUuid = _travel.TravelUuid

association[1..1] to /DMO/I_Customer as _customer on $projection.CustomerId = _customer.CustomerID
association [1..1] to /DMO/I_Carrier            as _Carrier    on  $projection.CarrierId    = _Carrier.AirlineID
association [1..1] to /DMO/I_Connection         as _Connection on  $projection.CarrierId    = _Connection.AirlineID
                                                                  and $projection.ConnectionId = _Connection.ConnectionID
association [1..1] to /DMO/I_Flight             as _Flight     on  $projection.CarrierId    = _Flight.AirlineID
                                                                  and $projection.ConnectionId = _Flight.ConnectionID
                                                                  and $projection.FlightDate   = _Flight.FlightDate
association [0..1] to I_Currency                as _Currency   on $projection.CurrencyCode    = _Currency.Currency

{
    key booking_uuid as BookingUuid,
    travel_uuid as TravelUuid,
    booking_id as BookingId,
    booking_date as BookingDate,
    customer_id as CustomerId,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    flight_price as FlightPrice,
    currency_code as CurrencyCode,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    
    /*Associations*/
    
    _travel,
    _customer,
    _Currency,
    _Flight,
    _Connection,
    _Carrier
}
