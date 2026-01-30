@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for GRN Print'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_GRN_PRINT
  as select from    I_MaterialDocumentHeader_2 as a
    left outer join zdb_grn_print              as b on a.MaterialDocument = b.materialdocument
{
  key a.MaterialDocument,
  key a.MaterialDocumentYear,
      a.StorageLocation,
      a.PostingDate,
      b.base64_3 ,
      b.m_ind


}
