package com.icia.thenale.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleDTO {

	private int s_num;
	private int s_c_num;
	private String s_startdate;
	private String s_enddate;
	private int s_count;
	private String m_id;
	private String s_c_day1;
	private String s_c_day2;
	private String s_c_day3;
	private String s_c_day4;
	private String s_c_day5;
	private String s_c_x;
	private String s_c_y;

}
