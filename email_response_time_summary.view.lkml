view: email_response_summary {
  sql_table_name: sql_server_karbon.email_response_time_summary ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: _fivetran_deleted {
    type: yesno
    hidden: yes
    sql: ${TABLE}._fivetran_deleted ;;
  }

  measure: averageresponsetimehrs {
    type: sum
    sql: ${TABLE}.averageresponsetimehrs ;;
  }

  dimension: averageresponsetimemin {
    type: number
    sql: ${TABLE}.averageresponsetimemin ;;
  }

  dimension_group: month {
    type: time
    timeframes: [date, week, month]
    convert_tz: no
    sql: ${TABLE}.month ;;
  }

  dimension: numberofconversations {
    type: number
    sql: ${TABLE}.numberofconversations ;;
  }

  dimension: numberofemails {
    type: number
    sql: ${TABLE}.numberofemails ;;
  }

  dimension: respondername {
    type: string
    sql: ${TABLE}.respondername ;;
  }

  dimension: tenantname {
    type: string
    sql: ${TABLE}.tenantname ;;
  }

  dimension: tenantpermakey {
    type: string
    sql: ${TABLE}.tenantpermakey ;;
  }

  measure: count {
    type: count
    drill_fields: [id, tenantname, respondername]
  }
}
