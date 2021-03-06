view: workpercentagecomplete {
  sql_table_name: sql_server_karbon.workpercentagecomplete ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }



  dimension: assignee {
    type: string
    sql: ${TABLE}.assignee ;;
  }

  dimension: completed_count {
    type: number
    sql: ${TABLE}.completed_count ;;
  }

  dimension_group: completed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.completed_date ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}.contact_name ;;
  }

  dimension_group: due {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.due_date ;;
  }

  dimension: org_name {
    type: string
    sql: ${TABLE}.org_name ;;
  }

  dimension: percentage_completed {
    type: number
    sql: ${TABLE}.percentage_completed ;;
  }

  dimension: primary_status {
    type: string
    sql: ${TABLE}.primary_status ;;
  }

  dimension: secondary_status {
    type: string
    sql: ${TABLE}.secondary_status ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_date ;;
  }

  dimension: tenant_name {
    type: string
    sql: ${TABLE}.tenant_name ;;
  }

  dimension: tenant_perma_key {
    type: string
    sql: ${TABLE}.tenant_perma_key ;;
  }

  dimension: work_item_count {
    type: number
    sql: ${TABLE}.work_item_count ;;
  }

  dimension: work_perma_key {
    type: string
    hidden: yes
    sql: ${TABLE}.work_perma_key ;;
  }

  dimension: work_title {
    type: string
    sql: ${TABLE}.work_title ;;
  }

  measure: completed_count_measure {
    label: "Completed Work Items"
    type: sum
    sql: ${completed_count} ;;
  }

  measure: work_item_count_measure {
    label: "Total Work Items"
    type: sum
    sql: ${work_item_count} ;;
  }

  measure: percentage_completed_measure {
    label: "Percentage Completed"
    value_format_name: percent_2
    type: sum
    sql: ${percentage_completed} ;;
  }

  measure: count {
    type: count
    drill_fields: [org_name, work_title,primary_status,start_date,due_date,completed_date]
  }
}
