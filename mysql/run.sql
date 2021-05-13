/*
Navicat MySQL Data Transfer

Source Server         : ee
Source Server Version : 50718
Source Host           : gz-cynosdbmysql-grp-fwk460wr.sql.tencentcdb.com:23283
Source Database       : xzs

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2021-05-13 14:32:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper`;
CREATE TABLE `t_exam_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '试卷名称',
  `subject_id` int(11) DEFAULT NULL COMMENT '学科',
  `paper_type` int(11) DEFAULT NULL COMMENT '试卷类型(1固定试卷 4.时段试卷 6.任务试卷)',
  `grade_level` int(11) DEFAULT NULL COMMENT '级别',
  `score` int(11) DEFAULT NULL COMMENT '试卷总分(千分制)',
  `question_count` int(11) DEFAULT NULL COMMENT '题目数量',
  `suggest_time` int(11) DEFAULT NULL COMMENT '建议时长(分钟)',
  `limit_start_time` datetime DEFAULT NULL COMMENT '时段试卷 开始时间',
  `limit_end_time` datetime DEFAULT NULL COMMENT '时段试卷 结束时间',
  `frame_text_content_id` int(11) DEFAULT NULL COMMENT '试卷框架 内容为JSON',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `task_exam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
INSERT INTO `t_exam_paper` VALUES ('1', '高等数学 期末考试模拟练习(一)', '1', '6', '13', '550', '2', '150', null, null, '3', '2', '2021-05-11 00:31:15', '\0', '1');
INSERT INTO `t_exam_paper` VALUES ('2', '大一下学期 高等数学 线上模拟考试', '1', '4', '13', '710', '4', '60', '2021-05-01 00:00:00', '2021-06-30 00:00:00', '9', '2', '2021-05-13 13:22:24', '\0', null);
INSERT INTO `t_exam_paper` VALUES ('3', '线代第一学月考试', '3', '1', '13', '200', '2', '15', null, null, '10', '2', '2021-05-13 13:24:48', '\0', null);

-- ----------------------------
-- Table structure for t_exam_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_answer`;
CREATE TABLE `t_exam_paper_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_paper_id` int(11) DEFAULT NULL,
  `paper_name` varchar(255) DEFAULT NULL COMMENT '试卷名称',
  `paper_type` int(11) DEFAULT NULL COMMENT '试卷类型(1固定试卷 4.时段试卷 6.任务试卷)',
  `subject_id` int(11) DEFAULT NULL COMMENT '学科',
  `system_score` int(11) DEFAULT NULL COMMENT '系统判定得分',
  `user_score` int(11) DEFAULT NULL COMMENT '最终得分(千分制)',
  `paper_score` int(11) DEFAULT NULL COMMENT '试卷总分',
  `question_correct` int(11) DEFAULT NULL COMMENT '做对题目数量',
  `question_count` int(11) DEFAULT NULL COMMENT '题目总数量',
  `do_time` int(11) DEFAULT NULL COMMENT '做题时间(秒)',
  `status` int(11) DEFAULT NULL COMMENT '试卷状态(1待判分 2完成)',
  `create_user` int(11) DEFAULT NULL COMMENT '学生',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `task_exam_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper_answer
-- ----------------------------
INSERT INTO `t_exam_paper_answer` VALUES ('1', '3', '线代第一学月考试', '1', '3', '200', '200', '200', '2', '2', '2', '2', '1', '2021-05-13 13:33:20', null);
INSERT INTO `t_exam_paper_answer` VALUES ('2', '3', '线代第一学月考试', '1', '3', '0', '0', '200', '0', '2', '4', '2', '1', '2021-05-13 13:34:58', null);
INSERT INTO `t_exam_paper_answer` VALUES ('3', '2', '大一下学期 高等数学 线上模拟考试', '4', '1', '70', '70', '710', '1', '4', '19', '1', '1', '2021-05-13 13:35:48', null);

-- ----------------------------
-- Table structure for t_exam_paper_question_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_question_customer_answer`;
CREATE TABLE `t_exam_paper_question_customer_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL COMMENT '题目Id',
  `exam_paper_id` int(11) DEFAULT NULL COMMENT '答案Id',
  `exam_paper_answer_id` int(11) DEFAULT NULL,
  `question_type` int(11) DEFAULT NULL COMMENT '题型',
  `subject_id` int(11) DEFAULT NULL COMMENT '学科',
  `customer_score` int(11) DEFAULT NULL COMMENT '得分',
  `question_score` int(11) DEFAULT NULL COMMENT '题目原始分数',
  `question_text_content_id` int(11) DEFAULT NULL COMMENT '问题内容',
  `answer` varchar(255) DEFAULT NULL COMMENT '做题答案',
  `text_content_id` int(11) DEFAULT NULL COMMENT '做题内容',
  `do_right` bit(1) DEFAULT NULL COMMENT '是否正确',
  `create_user` int(11) DEFAULT NULL COMMENT '做题人',
  `create_time` datetime DEFAULT NULL,
  `item_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_exam_paper_question_customer_answer
-- ----------------------------
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('1', '3', '3', '1', '1', '3', '100', '100', '5', 'C', null, '', '1', '2021-05-13 13:33:20', '1');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('2', '4', '3', '1', '3', '3', '100', '100', '6', 'B', null, '', '1', '2021-05-13 13:33:20', '2');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('3', '3', '3', '2', '1', '3', '0', '100', '5', 'B', null, '\0', '1', '2021-05-13 13:34:58', '1');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('4', '4', '3', '2', '3', '3', '0', '100', '6', 'A', null, '\0', '1', '2021-05-13 13:34:58', '2');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('5', '1', '2', '3', '1', '1', '0', '50', '1', 'B', null, '\0', '1', '2021-05-13 13:35:48', '1');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('6', '5', '2', '3', '1', '1', '70', '70', '7', 'B', null, '', '1', '2021-05-13 13:35:48', '2');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('7', '6', '2', '3', '5', '1', '0', '90', '8', null, '11', null, '1', '2021-05-13 13:35:48', '3');
INSERT INTO `t_exam_paper_question_customer_answer` VALUES ('8', '2', '2', '3', '5', '1', '0', '500', '2', null, '12', null, '1', '2021-05-13 13:35:48', '4');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT NULL,
  `send_user_id` int(11) DEFAULT NULL COMMENT '发送者用户ID',
  `send_user_name` varchar(255) DEFAULT NULL COMMENT '发送者用户名',
  `send_real_name` varchar(255) DEFAULT NULL COMMENT '发送者真实姓名',
  `receive_user_count` int(11) DEFAULT NULL COMMENT '接收人数',
  `read_count` int(11) DEFAULT NULL COMMENT '已读人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES ('1', '明天下午组织学院考试', '1.     出示学生证（或图书证、身份证）.\n\n2.     隔位就座\n\n3.     用蓝色或黑色钢笔、圆珠笔或签字笔，段落分明。\n\n4.     关闭手机。\n\n5.     可以饮水，不得进食。\n\n6.     及时交卷，迟交者要被扣掉5分。\n\n \n\n如果考试采用闭卷形式，\n\n7.     桌面上可以摆放文具盒、水瓶、时钟、计算器；\n\n8.     课本、参考书、笔记本、稿纸应置于书包内，拉上拉练。主考老师将提供草稿纸。\n\n \n\n9.     考试期间如需上厕所，应举手示意，一次只能有一人如厕。\n\n10.  考试成绩完全由答卷上的数学内容所决定, 任何考试之后的解释都是徒劳的,试图通过熟人来说情将视为作弊。\n\n11.  我保留在考场拍照的权力。', '2021-05-11 13:12:20', '2', 'admin', '管理员', '1', '1');

-- ----------------------------
-- Table structure for t_message_user
-- ----------------------------
DROP TABLE IF EXISTS `t_message_user`;
CREATE TABLE `t_message_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) DEFAULT NULL COMMENT '消息内容ID',
  `receive_user_id` int(11) DEFAULT NULL COMMENT '接收人ID',
  `receive_user_name` varchar(255) DEFAULT NULL COMMENT '接收人用户名',
  `receive_real_name` varchar(255) DEFAULT NULL COMMENT '接收人真实姓名',
  `readed` bit(1) DEFAULT NULL COMMENT '是否已读',
  `create_time` datetime DEFAULT NULL,
  `read_time` datetime DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_message_user
-- ----------------------------
INSERT INTO `t_message_user` VALUES ('1', '1', '1', 'student', '学生', '', '2021-05-11 13:12:20', '2021-05-11 13:12:36');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_type` int(11) DEFAULT NULL COMMENT '1.单选题  2.多选题  3.判断题 4.填空题 5.简答题',
  `subject_id` int(11) DEFAULT NULL COMMENT '学科',
  `score` int(11) DEFAULT NULL COMMENT '题目总分(千分制)',
  `grade_level` int(11) DEFAULT NULL COMMENT '级别',
  `difficult` int(11) DEFAULT NULL COMMENT '题目难度',
  `correct` text COMMENT '正确答案',
  `info_text_content_id` int(11) DEFAULT NULL COMMENT '题目  填空、 题干、解析、答案等信息',
  `create_user` int(11) DEFAULT NULL COMMENT '创建人',
  `status` int(11) DEFAULT NULL COMMENT '1.正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '1', '1', '50', '13', '2', 'C', '1', '2', '1', '2021-05-11 00:28:56', '\0');
INSERT INTO `t_question` VALUES ('2', '5', '1', '500', '13', '4', '见解析', '2', '2', '1', '2021-05-11 00:30:10', '\0');
INSERT INTO `t_question` VALUES ('3', '1', '3', '100', '13', '5', 'C', '5', '2', '1', '2021-05-11 13:10:19', '\0');
INSERT INTO `t_question` VALUES ('4', '3', '3', '100', '13', '4', 'B', '6', '2', '1', '2021-05-11 13:11:02', '\0');
INSERT INTO `t_question` VALUES ('5', '1', '1', '70', '13', '4', 'B', '7', '2', '1', '2021-05-13 13:08:49', '\0');
INSERT INTO `t_question` VALUES ('6', '5', '1', '90', '13', '4', '自己百度<br/>', '8', '2', '1', '2021-05-13 13:10:32', '\0');

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '语文 数学 英语 等',
  `level` int(11) DEFAULT NULL COMMENT '年级 (1-12) 小学 初中 高中  大学',
  `level_name` varchar(255) DEFAULT NULL COMMENT '一年级、二年级等',
  `item_order` int(11) DEFAULT NULL COMMENT '排序',
  `deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES ('1', '高等数学', '13', '大一', null, '\0');
INSERT INTO `t_subject` VALUES ('2', '离散数学', '13', '大一', null, '\0');
INSERT INTO `t_subject` VALUES ('3', '线性代数', '13', '大一', null, '\0');

-- ----------------------------
-- Table structure for t_task_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam`;
CREATE TABLE `t_task_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `grade_level` int(11) DEFAULT NULL COMMENT '级别',
  `frame_text_content_id` int(11) DEFAULT NULL COMMENT '任务框架 内容为JSON',
  `create_user` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL,
  `create_user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_task_exam
-- ----------------------------
INSERT INTO `t_task_exam` VALUES ('1', '模拟考试-课下作业', '13', '4', '2', '2021-05-11 00:42:33', '\0', 'admin');

-- ----------------------------
-- Table structure for t_task_exam_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam_customer_answer`;
CREATE TABLE `t_task_exam_customer_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_exam_id` int(11) DEFAULT NULL,
  `create_user` int(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `text_content_id` int(11) DEFAULT NULL COMMENT '任务完成情况(Json)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_task_exam_customer_answer
-- ----------------------------

-- ----------------------------
-- Table structure for t_text_content
-- ----------------------------
DROP TABLE IF EXISTS `t_text_content`;
CREATE TABLE `t_text_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
INSERT INTO `t_text_content` VALUES ('1', '{\"titleContent\":\"<p>已知A=1,B=2 求A+B</p>\",\"analyze\":\"<p>因为1=1，所以答案是3</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"1\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"2\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"3\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"4\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2021-05-11 00:28:56');
INSERT INTO `t_text_content` VALUES ('2', '{\"titleContent\":\"<span style=\\\"color: #333333; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; font-size: 14px; background-color: #FFFFFF;\\\">设z=z(x,y)由方程x次方＋2y次方+3z次方－yz=0。求求＆z比&amp;y</span>\",\"analyze\":\"<span style=\\\"color: #333333; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: #FFFFFF;\\\">解：∵x²+2y²+3z²-yz=0</span><br/><span style=\\\"color: #333333; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: #FFFFFF;\\\">==&gt;4y+6z(＆z/&amp;y)-z-y(＆z/&amp;y)=0 (等式两端对y求导数)</span><br/><span style=\\\"color: #333333; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: #FFFFFF;\\\">==&gt;6z(＆z/&amp;y)-y(＆z/&amp;y)=z-4y</span><br/><span style=\\\"color: #333333; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: #FFFFFF;\\\">==&gt;(6z-y)(＆z/&amp;y)=z-4y</span><br/><span style=\\\"color: #333333; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: #FFFFFF;\\\">==&gt;＆z/&amp;y=(z-4y)/(6z-y)</span><br/><span style=\\\"color: #333333; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: #FFFFFF;\\\">∴z关于y的偏导数：＆z比&amp;y=(z-4y)/(6z-y)。</span>\",\"questionItemObjects\":[],\"correct\":\"见解析\"}', '2021-05-11 00:30:10');
INSERT INTO `t_text_content` VALUES ('3', '[{\"name\":\"单选题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]},{\"name\":\"问答题\",\"questionItems\":[{\"id\":2,\"itemOrder\":2}]}]', '2021-05-11 00:31:15');
INSERT INTO `t_text_content` VALUES ('4', '[{\"examPaperId\":1,\"examPaperName\":\"高等数学 期末考试\",\"itemOrder\":null}]', '2021-05-11 00:42:33');
INSERT INTO `t_text_content` VALUES ('5', '{\"titleContent\":\"<p style=\\\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(18, 18, 18); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\">已知四位数&nbsp;<img src=\\\"https://www.zhihu.com/equation?tex=1508%2C1856%2C4205%2C2117\\\" alt=\\\"[公式]\\\"/>&nbsp;均为&nbsp;<img src=\\\"https://www.zhihu.com/equation?tex=29\\\" alt=\\\"[公式]\\\"/>&nbsp;的倍数，求证下列行列式的值为&nbsp;<img src=\\\"https://www.zhihu.com/equation?tex=29\\\" alt=\\\"[公式]\\\"/>&nbsp;的倍数：</p><p style=\\\"margin-top: 1.4em; margin-bottom: 1.4em; color: rgb(18, 18, 18); font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; white-space: normal; background-color: rgb(255, 255, 255);\\\"><img src=\\\"https://www.zhihu.com/equation?tex=D%3D%5Cleft%7C%5Cbegin%7Bmatrix%7D1%265%260%268%5C%5C1%268%265%266%5C%5C4%262%260%265%5C%5C2%261%261%267%5Cend%7Bmatrix%7D%5Cright%7C\\\" alt=\\\"[公式]\\\"/></p><p><br/></p>\",\"analyze\":\"<span style=\\\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: #FFFFFF;\\\">这题就是考察行列式的变形，比较容易发现只需要把第一列乘上&nbsp;</span><img src=\\\"https://www.zhihu.com/equation?tex=1000\\\" alt=\\\"[公式]\\\"/><span style=\\\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: #FFFFFF;\\\">&nbsp;加到第四列，第二列乘上&nbsp;</span><img src=\\\"https://www.zhihu.com/equation?tex=100\\\" alt=\\\"[公式]\\\"/><span style=\\\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: #FFFFFF;\\\">&nbsp;加到第四列，第二列乘上&nbsp;</span><img src=\\\"https://www.zhihu.com/equation?tex=10\\\" alt=\\\"[公式]\\\"/><span style=\\\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: #FFFFFF;\\\">&nbsp;加到第四列，第四列就可以提出一个&nbsp;</span><img src=\\\"https://www.zhihu.com/equation?tex=29\\\" alt=\\\"[公式]\\\"/><span style=\\\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: #FFFFFF;\\\">&nbsp;，从而这个行列式就是&nbsp;</span><img src=\\\"https://www.zhihu.com/equation?tex=29\\\" alt=\\\"[公式]\\\"/><span style=\\\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: #FFFFFF;\\\">&nbsp;倍数。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"13\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"14\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"33\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"44\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2021-05-11 13:10:19');
INSERT INTO `t_text_content` VALUES ('6', '{\"titleContent\":\"线性代数很简单？\",\"analyze\":\"想学好不简单<br/>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2021-05-11 13:11:02');
INSERT INTO `t_text_content` VALUES ('7', '{\"titleContent\":\"<span style=\\\"color: #333333; font-family: &quot;Microsoft YaHei&quot;, Verdana, sans-serif; background-color: #FFFFFF;\\\">y =x -1 （B ）y =-(x +1) （C ）y =(ln x -1)(x -1) （D ）y =x 4．设函数f (x )=|x |，则函数在点x =0处</span>\",\"analyze\":\"无\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<span style=\\\"color: #333333; font-family: &quot;Microsoft YaHei&quot;, Verdana, sans-serif; background-color: #FFFFFF;\\\">连续且可导</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<span style=\\\"color: #333333; font-family: &quot;Microsoft YaHei&quot;, Verdana, sans-serif; background-color: #FFFFFF;\\\">连续且可微</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<span style=\\\"color: #333333; font-family: &quot;Microsoft YaHei&quot;, Verdana, sans-serif; background-color: #FFFFFF;\\\">连续不可导</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<span style=\\\"color: #333333; font-family: &quot;Microsoft YaHei&quot;, Verdana, sans-serif; background-color: #FFFFFF;\\\">不连续不可微</span>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2021-05-13 13:08:49');
INSERT INTO `t_text_content` VALUES ('8', '{\"titleContent\":\"<img class=\\\"qimg\\\" src=\\\"https://gss0.baidu.com/-4o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/0b7b02087bf40ad1d62396775b2c11dfa8ecce5b.jpg\\\"/>\",\"analyze\":\"<span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">凑</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">微</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">分法，是国内盛行的、首选的方法。它</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">灵</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">活、快捷，\\n　　但是并不被国际接受。</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">我</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">们对凑微分法，没有严格定义，\\n　　</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">没</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">有向国际推广，百多年来，我们连一个英文名称都</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">没</span><span style=\\\"color: #3E3E3E; font-family: arial; font-size: 18px; white-space: pre-wrap;\\\">　　有能取出来。</span>\",\"questionItemObjects\":[],\"correct\":\"自己百度<br/>\"}', '2021-05-13 13:10:32');
INSERT INTO `t_text_content` VALUES ('9', '[{\"name\":\"单选题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1},{\"id\":5,\"itemOrder\":2}]},{\"name\":\"解答题\",\"questionItems\":[{\"id\":6,\"itemOrder\":3},{\"id\":2,\"itemOrder\":4}]}]', '2021-05-13 13:22:24');
INSERT INTO `t_text_content` VALUES ('10', '[{\"name\":\"必做题\",\"questionItems\":[{\"id\":3,\"itemOrder\":1},{\"id\":4,\"itemOrder\":2}]}]', '2021-05-13 13:24:48');
INSERT INTO `t_text_content` VALUES ('11', 'A=B=C=250', '2021-05-13 13:35:48');
INSERT INTO `t_text_content` VALUES ('12', '4A3Bdd', '2021-05-13 13:35:48');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `age` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '1.男 2女',
  `birth_day` datetime DEFAULT NULL,
  `user_level` int(11) DEFAULT NULL COMMENT '学生年级(1-12)',
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL COMMENT '1.学生 2.老师 3.管理员',
  `status` int(11) DEFAULT NULL COMMENT '1.启用 2禁用',
  `image_path` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `create_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `last_active_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT NULL COMMENT '是否删除',
  `wx_open_id` varchar(255) DEFAULT NULL COMMENT '微信openId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'd2d29da2-dcb3-4013-b874-727626236f47', 'student', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '毛羊薅', '18', '1', '2019-09-01 00:00:00', '13', '19171171610', '1', '1', 'http://xzs.file.mindskip.net/FsNLOuDw2PHiym2B7Y2CiqhXYAFy', '2021-05-11 03:55:02', '2021-05-11 22:09:43', null, '\0', null);
INSERT INTO `t_user` VALUES ('2', '52045f5f-a13f-4ccc-93dd-f7ee8270ad4c', 'admin', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '管理员', '30', '1', '2019-09-07 00:00:00', null, null, '3', '1', null, '2021-04-27 18:56:21', '2021-05-11 19:59:19', null, '\0', null);
INSERT INTO `t_user` VALUES ('3', '83a3992c-e349-4634-94be-a669385634a3', 'gayyh', 'M45xyXgE1URmxqMQgBEwqlN2HP0Im4lAzpEdgxqzIQPNQNg+YZRaGpjL966XB88388KTaWbVjpHGeuswg2tG8sMeLMr0PtuEPvZwj/9piXSSkSusG0neezIEWsPYwgvgN/cC6rk2Kx1bBWoG0YKdI3O7eAjgPG0Nf750zbFDFyY=', '羊昊', null, '2', null, '13', null, '1', '1', null, '2021-05-11 16:52:46', '2021-05-11 16:53:51', '2021-05-11 16:52:46', '\0', null);
INSERT INTO `t_user` VALUES ('4', '45237744-f23d-4a9d-a335-672b96558a0e', 'stu1', 'XV23uwEdv00kng5BJdzYU4wTj3vhm61+UReM/C0dq7XA/YsvHmV2nsZiKjluig49cb6mk+r9cR4uUyjwYYJ1n9dV8qH/uhUGD3Y6wIzCQAnAUQl8dBgGQ8CK//4aaAjzybGqTPHs/cS2p2jTdO8o21mjz5GBkgEDZu8D7YX0n2s=', null, null, null, null, '7', null, '1', '1', null, '2021-05-12 10:52:55', null, '2021-05-12 10:52:55', '\0', null);
INSERT INTO `t_user` VALUES ('5', '10c10de2-1f53-418f-b1ee-6b3aab48b604', 'typedef', 'DCkfsvNC6LpggaKsHC1Wk8c2gCPt2VZek/4CogiU6egL1dbe+mT80fI5MS92HsC0e9RpxCSi+hki9O7TwEUg8FrneIf+DAQi/T7OToQxNdscBDqXYT/E3Qo2X4vrVlLwCWlB7YFr/wIJA0zV1O8nHIQq2EupUQJwtSOXowZ+Zdc=', '123', '123', '1', null, '16', '123', '1', '1', null, '2021-05-12 23:16:21', '2021-05-12 23:19:30', '2021-05-12 23:16:21', '\0', null);

-- ----------------------------
-- Table structure for t_user_event_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_event_log`;
CREATE TABLE `t_user_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `content` text COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_event_log
-- ----------------------------
INSERT INTO `t_user_event_log` VALUES ('1', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-10 23:48:32');
INSERT INTO `t_user_event_log` VALUES ('2', '2', 'admin', '管理员', 'student 登录了考试系统', '2021-05-10 23:48:37');
INSERT INTO `t_user_event_log` VALUES ('3', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-10 23:50:10');
INSERT INTO `t_user_event_log` VALUES ('4', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-10 23:50:47');
INSERT INTO `t_user_event_log` VALUES ('5', '2', 'admin', '管理员', 'student 登录了考试系统', '2021-05-10 23:53:55');
INSERT INTO `t_user_event_log` VALUES ('6', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-10 23:56:43');
INSERT INTO `t_user_event_log` VALUES ('7', '2', 'admin', '管理员', 'student 登录了考试系统', '2021-05-10 23:57:07');
INSERT INTO `t_user_event_log` VALUES ('8', '2', 'admin', '管理员', 'student 登录了考试系统', '2021-05-10 23:57:21');
INSERT INTO `t_user_event_log` VALUES ('9', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-10 23:57:43');
INSERT INTO `t_user_event_log` VALUES ('10', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 00:12:25');
INSERT INTO `t_user_event_log` VALUES ('11', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 00:13:03');
INSERT INTO `t_user_event_log` VALUES ('12', '2', 'admin', '管理员', 'student 登录了考试系统', '2021-05-11 00:20:56');
INSERT INTO `t_user_event_log` VALUES ('13', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 00:42:01');
INSERT INTO `t_user_event_log` VALUES ('14', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 00:42:48');
INSERT INTO `t_user_event_log` VALUES ('15', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:03:03');
INSERT INTO `t_user_event_log` VALUES ('16', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:04:46');
INSERT INTO `t_user_event_log` VALUES ('17', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:08:55');
INSERT INTO `t_user_event_log` VALUES ('18', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:09:03');
INSERT INTO `t_user_event_log` VALUES ('19', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:09:05');
INSERT INTO `t_user_event_log` VALUES ('20', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:09:10');
INSERT INTO `t_user_event_log` VALUES ('21', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:09:15');
INSERT INTO `t_user_event_log` VALUES ('22', '2', 'admin', '管理员', 'student 登录了考试系统', '2021-05-11 09:09:49');
INSERT INTO `t_user_event_log` VALUES ('23', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:10:07');
INSERT INTO `t_user_event_log` VALUES ('24', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:12:47');
INSERT INTO `t_user_event_log` VALUES ('25', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:13:00');
INSERT INTO `t_user_event_log` VALUES ('26', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:32:44');
INSERT INTO `t_user_event_log` VALUES ('27', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:32:49');
INSERT INTO `t_user_event_log` VALUES ('28', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:33:09');
INSERT INTO `t_user_event_log` VALUES ('29', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:34:51');
INSERT INTO `t_user_event_log` VALUES ('30', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:35:05');
INSERT INTO `t_user_event_log` VALUES ('31', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 09:35:12');
INSERT INTO `t_user_event_log` VALUES ('32', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 13:00:59');
INSERT INTO `t_user_event_log` VALUES ('33', '2', 'admin', '管理员', 'student 登录了考试系统', '2021-05-11 13:03:16');
INSERT INTO `t_user_event_log` VALUES ('34', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 14:07:47');
INSERT INTO `t_user_event_log` VALUES ('35', '1', 'student', '学生', 'student 更新了个人资料', '2021-05-11 14:11:12');
INSERT INTO `t_user_event_log` VALUES ('36', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 14:50:16');
INSERT INTO `t_user_event_log` VALUES ('37', '1', 'student', '学生', 'student 登出了考试系统', '2021-05-11 16:42:17');
INSERT INTO `t_user_event_log` VALUES ('38', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 16:42:20');
INSERT INTO `t_user_event_log` VALUES ('39', '1', 'student', '学生', 'student 登出了考试系统', '2021-05-11 16:51:57');
INSERT INTO `t_user_event_log` VALUES ('40', '3', 'gayyh', null, '欢迎 gayyh 注册来到考试系统', '2021-05-11 16:52:46');
INSERT INTO `t_user_event_log` VALUES ('41', '3', 'gayyh', null, 'gayyh 登录了考试系统', '2021-05-11 16:52:52');
INSERT INTO `t_user_event_log` VALUES ('42', '3', 'gayyh', '羊昊', 'gayyh 更新了个人资料', '2021-05-11 16:53:51');
INSERT INTO `t_user_event_log` VALUES ('43', '3', 'gayyh', '羊昊', 'gayyh 登出了考试系统', '2021-05-11 16:54:17');
INSERT INTO `t_user_event_log` VALUES ('44', '3', 'gayyh', '羊昊', 'gayyh 登录了考试系统', '2021-05-11 16:54:38');
INSERT INTO `t_user_event_log` VALUES ('45', '3', 'gayyh', '羊昊', 'gayyh 登出了考试系统', '2021-05-11 16:54:46');
INSERT INTO `t_user_event_log` VALUES ('46', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 17:08:54');
INSERT INTO `t_user_event_log` VALUES ('47', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 17:48:28');
INSERT INTO `t_user_event_log` VALUES ('48', '1', 'student', '学生', 'student 登录了考试系统', '2021-05-11 17:49:17');
INSERT INTO `t_user_event_log` VALUES ('49', '1', 'student', '毛羊薅', 'student 更新了个人资料', '2021-05-11 17:58:46');
INSERT INTO `t_user_event_log` VALUES ('50', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-11 18:07:31');
INSERT INTO `t_user_event_log` VALUES ('51', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-11 19:59:09');
INSERT INTO `t_user_event_log` VALUES ('52', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 20:50:27');
INSERT INTO `t_user_event_log` VALUES ('53', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 20:57:35');
INSERT INTO `t_user_event_log` VALUES ('54', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 21:13:26');
INSERT INTO `t_user_event_log` VALUES ('55', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-11 21:26:34');
INSERT INTO `t_user_event_log` VALUES ('56', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-11 21:30:44');
INSERT INTO `t_user_event_log` VALUES ('57', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-11 21:31:53');
INSERT INTO `t_user_event_log` VALUES ('58', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 21:33:16');
INSERT INTO `t_user_event_log` VALUES ('59', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-11 21:36:40');
INSERT INTO `t_user_event_log` VALUES ('60', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-11 21:36:57');
INSERT INTO `t_user_event_log` VALUES ('61', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 21:37:33');
INSERT INTO `t_user_event_log` VALUES ('62', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-11 21:38:43');
INSERT INTO `t_user_event_log` VALUES ('63', '1', 'student', '毛羊薅', 'student 登出了考试系统', '2021-05-11 21:38:53');
INSERT INTO `t_user_event_log` VALUES ('64', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 21:53:44');
INSERT INTO `t_user_event_log` VALUES ('65', '1', 'student', '毛羊薅', 'student 登出了考试系统', '2021-05-11 21:54:01');
INSERT INTO `t_user_event_log` VALUES ('66', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 21:54:08');
INSERT INTO `t_user_event_log` VALUES ('67', '1', 'student', '毛羊薅', 'student 登出了考试系统', '2021-05-11 21:56:17');
INSERT INTO `t_user_event_log` VALUES ('68', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 22:07:49');
INSERT INTO `t_user_event_log` VALUES ('69', '1', 'student', '毛羊薅', 'student 更新了个人资料', '2021-05-11 22:09:38');
INSERT INTO `t_user_event_log` VALUES ('70', '1', 'student', '毛羊薅', 'student 更新了个人资料', '2021-05-11 22:09:43');
INSERT INTO `t_user_event_log` VALUES ('71', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-11 22:11:41');
INSERT INTO `t_user_event_log` VALUES ('72', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 10:31:01');
INSERT INTO `t_user_event_log` VALUES ('73', '4', 'stu1', null, '欢迎 stu1 注册来到考试系统', '2021-05-12 10:52:55');
INSERT INTO `t_user_event_log` VALUES ('74', '4', 'stu1', null, 'stu1 登录了考试系统', '2021-05-12 10:53:05');
INSERT INTO `t_user_event_log` VALUES ('75', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 10:57:49');
INSERT INTO `t_user_event_log` VALUES ('76', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-12 10:59:07');
INSERT INTO `t_user_event_log` VALUES ('77', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 11:15:10');
INSERT INTO `t_user_event_log` VALUES ('78', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 11:18:02');
INSERT INTO `t_user_event_log` VALUES ('79', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 11:18:23');
INSERT INTO `t_user_event_log` VALUES ('80', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-12 11:26:19');
INSERT INTO `t_user_event_log` VALUES ('81', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-12 12:27:13');
INSERT INTO `t_user_event_log` VALUES ('82', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 13:08:13');
INSERT INTO `t_user_event_log` VALUES ('83', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 13:19:06');
INSERT INTO `t_user_event_log` VALUES ('84', '1', 'student', '毛羊薅', 'student 登出了考试系统', '2021-05-12 13:20:41');
INSERT INTO `t_user_event_log` VALUES ('85', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 22:52:43');
INSERT INTO `t_user_event_log` VALUES ('86', '5', 'typedef', null, '欢迎 typedef 注册来到考试系统', '2021-05-12 23:16:21');
INSERT INTO `t_user_event_log` VALUES ('87', '5', 'typedef', null, 'typedef 登录了考试系统', '2021-05-12 23:16:25');
INSERT INTO `t_user_event_log` VALUES ('88', '5', 'typedef', null, 'typedef 登录了考试系统', '2021-05-12 23:16:25');
INSERT INTO `t_user_event_log` VALUES ('89', '5', 'typedef', '123', 'typedef 更新了个人资料', '2021-05-12 23:19:30');
INSERT INTO `t_user_event_log` VALUES ('90', '1', 'student', '毛羊薅', 'student 登出了考试系统', '2021-05-12 23:46:06');
INSERT INTO `t_user_event_log` VALUES ('91', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-12 23:46:09');
INSERT INTO `t_user_event_log` VALUES ('92', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-12 23:47:05');
INSERT INTO `t_user_event_log` VALUES ('93', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-12 23:49:05');
INSERT INTO `t_user_event_log` VALUES ('94', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-13 12:53:20');
INSERT INTO `t_user_event_log` VALUES ('95', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-13 12:53:39');
INSERT INTO `t_user_event_log` VALUES ('96', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-13 13:04:37');
INSERT INTO `t_user_event_log` VALUES ('97', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-13 13:04:44');
INSERT INTO `t_user_event_log` VALUES ('98', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-13 13:04:48');
INSERT INTO `t_user_event_log` VALUES ('99', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-13 13:22:32');
INSERT INTO `t_user_event_log` VALUES ('100', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-13 13:22:42');
INSERT INTO `t_user_event_log` VALUES ('101', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-13 13:22:48');
INSERT INTO `t_user_event_log` VALUES ('102', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-13 13:24:53');
INSERT INTO `t_user_event_log` VALUES ('103', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-13 13:28:02');
INSERT INTO `t_user_event_log` VALUES ('104', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-13 13:28:47');
INSERT INTO `t_user_event_log` VALUES ('105', '2', 'admin', '管理员', 'admin 登录了考试系统', '2021-05-13 13:32:43');
INSERT INTO `t_user_event_log` VALUES ('106', '1', 'student', '毛羊薅', 'student 登录了考试系统', '2021-05-13 13:33:14');
INSERT INTO `t_user_event_log` VALUES ('107', '1', 'student', '毛羊薅', 'student 提交试卷：线代第一学月考试 得分：20 耗时：2 秒', '2021-05-13 13:33:20');
INSERT INTO `t_user_event_log` VALUES ('108', '1', 'student', '毛羊薅', 'student 提交试卷：线代第一学月考试 得分：0 耗时：4 秒', '2021-05-13 13:34:58');
INSERT INTO `t_user_event_log` VALUES ('109', '1', 'student', '毛羊薅', 'student 提交试卷：大一下学期 高等数学 线上模拟考试 得分：7 耗时：19 秒', '2021-05-13 13:35:48');

-- ----------------------------
-- Table structure for t_user_token
-- ----------------------------
DROP TABLE IF EXISTS `t_user_token`;
CREATE TABLE `t_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(36) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户Id',
  `wx_open_id` varchar(255) DEFAULT NULL COMMENT '微信openId',
  `create_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of t_user_token
-- ----------------------------
