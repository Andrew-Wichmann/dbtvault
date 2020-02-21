{{- config(materialized='incremental', schema='vlt', enabled=true, tags=['load_cycles_deprecated', 'deprecated']) -}}

{%- set source = [ref('test_stg_booking_hashed_deprecated')]                                       -%}

{%- set src_pk = 'CUSTOMER_PK'                                                          -%}
{%- set src_hashdiff = 'BOOK_CUSTOMER_HASHDIFF'                                         -%}
{%- set src_payload = ['PHONE', 'NATIONALITY']                                          -%}

{%- set src_eff = 'EFFECTIVE_FROM'                                                      -%}
{%- set src_ldts = 'LOADDATE'                                                           -%}
{%- set src_source = 'SOURCE'                                                           -%}

{%- set tgt_pk = source                                                                 -%}
{%- set tgt_hashdiff = [ src_hashdiff , 'BINARY', 'BOOK_CUSTOMER_HASHDIFF']             -%}
{%- set tgt_payload = source                                                            -%}

{%- set tgt_eff = source                                                                -%}
{%- set tgt_ldts = source                                                               -%}
{%- set tgt_source = source                                                             -%}

{{  dbtvault.sat_template(src_pk, src_hashdiff, src_payload,
                          src_eff, src_ldts, src_source,
                          tgt_pk, tgt_hashdiff, tgt_payload,
                          tgt_eff, tgt_ldts, tgt_source,
                          source)                                                        }}





