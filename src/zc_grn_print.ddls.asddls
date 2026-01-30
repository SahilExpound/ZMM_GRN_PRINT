@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for grn print'
@Metadata.allowExtensions: true
define root view entity ZC_GRN_PRINT as projection on ZI_GRN_PRINT
{
    key MaterialDocument,
    key MaterialDocumentYear,
    StorageLocation,
    PostingDate,
    base64_3,
    m_ind
}
