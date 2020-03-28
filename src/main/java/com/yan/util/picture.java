package com.yan.util;

import java.awt.Font;
import java.awt.GridLayout;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFrame;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;

import com.yan.controller.AdminController;

public class picture {
	ChartPanel frame1;

	public picture() throws SQLException {
		CategoryDataset dataset = getDataSet();// 将获得的数据传递给CategoryDataset类的对象
		JFreeChart chart = ChartFactory.createBarChart3D("十天感染情况表", // 图表标题
				"感染情况", // 目录轴的显示标签
				"感染人数", // 数值轴的显示标签
				dataset, // 数据集
				PlotOrientation.VERTICAL, // 图表方向：水平、垂直
				true, // 是否显示图例(对于简单的柱状图必须是false)
				false, // 是否生成工具
				false // 是否生成URL链接
		);

		CategoryPlot plot = chart.getCategoryPlot();// 获取图表区域对象
		CategoryAxis domainAxis = plot.getDomainAxis(); // 水平底部列表
		domainAxis.setLabelFont(new Font("黑体", Font.BOLD, 14)); // 水平底部标题
		domainAxis.setTickLabelFont(new Font("宋体", Font.BOLD, 12)); // 垂直标题
		ValueAxis rangeAxis = plot.getRangeAxis();// 获取柱状
		rangeAxis.setLabelFont(new Font("黑体", Font.BOLD, 15));
		chart.getLegend().setItemFont(new Font("黑体", Font.BOLD, 15));
		chart.getTitle().setFont(new Font("宋体", Font.BOLD, 20));// 设置标题字体

		frame1 = new ChartPanel(chart, true); // 这里也可以用chartFrame,可以直接生成一个独立的Frame

	}

	private static CategoryDataset getDataSet() throws SQLException {

		int count = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		String sql = "select * from tb_stu where islike = 'yes'";
		Connection conn = AdminController.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {

			count++;
		}

		String sql2 = "select * from tb_stu where isconfirm ='yes'";
		Connection conn2 = AdminController.getConnection();
		PreparedStatement ps2 = conn2.prepareStatement(sql2);
		ResultSet rs2 = ps2.executeQuery();
		// System.out.println("hello");
		while (rs2.next()) {
			count2++;

		}

		String sql3 = "select * from tb_teacher where islike = 'yes'";
		Connection conn3 = AdminController.getConnection();
		PreparedStatement ps3 = conn3.prepareStatement(sql3);
		ResultSet rs3 = ps3.executeQuery();
		while (rs3.next()) {
			count3++;
		}

		String sql4 = "select * from tb_teacher where isconfirm = 'yes'";
		Connection conn4 = AdminController.getConnection();
		PreparedStatement ps4 = conn4.prepareStatement(sql4);
		ResultSet rs4 = ps4.executeQuery();
		while (rs4.next()) {
			count4++;
		}
		dataset.addValue(count, "学生疑似感染人数", "学生疑似感染人数");
		dataset.addValue(count2, "学生确诊人数", "学生确诊人数");
		dataset.addValue(count3, "老师疑似感染人数", "老师疑似感染人数");
		dataset.addValue(count4, "老师确诊人数", "老师确诊人数");

		return dataset;
	}

	public ChartPanel getChartPanel() {
		return frame1;

	}

	public static void main(String args[]) throws SQLException {
		JFrame frame = new JFrame("疫情感染情况统计表");
		frame.setLayout(new GridLayout(2, 2, 10, 10));
		frame.add(new picture().getChartPanel()); // 添加柱形图
		frame.setBounds(0, 0, 900, 800);
		frame.setVisible(true);
	}
}
