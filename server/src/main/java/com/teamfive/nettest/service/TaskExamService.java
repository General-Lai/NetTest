package com.teamfive.nettest.service;

import com.teamfive.nettest.domain.TaskExam;
import com.teamfive.nettest.domain.User;
import com.teamfive.nettest.viewmodel.admin.task.TaskPageRequestVM;
import com.teamfive.nettest.viewmodel.admin.task.TaskRequestVM;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TaskExamService extends BaseService<TaskExam> {

    PageInfo<TaskExam> page(TaskPageRequestVM requestVM);

    void edit(TaskRequestVM model, User user);

    TaskRequestVM taskExamToVM(Integer id);

    List<TaskExam> getByGradeLevel(Integer gradeLevel);
}
