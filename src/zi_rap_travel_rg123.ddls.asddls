@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Travel data'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_RAP_TRAVEL_RG123 as select from zrg_travel_03 as Travel
/*association[0..*] to ZI_RAP_BOOKING_RG123 as _Booking on $projection.TravelUuid = _Booking.TravelUuid */
composition[0..*] of ZI_RAP_BOOKING_RG123 as _Booking

association[0..1] to /DMO/I_Agency as _agency on $projection.AgencyId = _agency.AgencyID
association[0..1] to /DMO/I_Customer as _customer on $projection.CustomerId = _customer.CustomerID
association[0..1] to I_Currency as _currency on $projection.CurrencyCode = _currency.Currency
{
    key travel_uuid as TravelUuid,
    travel_id as TravelId,
    agency_id as AgencyId,
    customer_id as CustomerId,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
    overall_status as OverallStatus,
    created_by as CreatedBy,
    created_at as CreatedAt,
    last_changed_by as LastChangedBy,
    last_changed_at as LastChangedAt,
    local_last_changed_at as LocalLastChangedAt,
    
    /*Associations*/
    _Booking,
    _customer,
    _currency,
    _agency
}
