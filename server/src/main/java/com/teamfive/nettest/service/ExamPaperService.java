package com.teamfive.nettest.service;

import com.teamfive.nettest.domain.ExamPaper;
import com.teamfive.nettest.domain.User;
import com.teamfive.nettest.viewmodel.admin.exam.ExamPaperEditRequestVM;
import com.teamfive.nettest.viewmodel.admin.exam.ExamPaperPageRequestVM;
import com.teamfive.nettest.viewmodel.student.dashboard.PaperFilter;
import com.teamfive.nettest.viewmodel.student.dashboard.PaperInfo;
import com.teamfive.nettest.viewmodel.student.exam.ExamPaperPageVM;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface ExamPaperService extends BaseService<ExamPaper> {

    PageInfo<ExamPaper> page(ExamPaperPageRequestVM requestVM);

    PageInfo<ExamPaper> taskExamPage(ExamPaperPageRequestVM requestVM);

    PageInfo<ExamPaper> studentPage(ExamPaperPageVM requestVM);

    ExamPaper savePaperFromVM(ExamPaperEditRequestVM examPaperEditRequestVM, User user);

    ExamPaperEditRequestVM examPaperToVM(Integer id);

    List<PaperInfo> indexPaper(PaperFilter paperFilter);

    Integer selectAllCount();

    List<Integer> selectMothCount();
}
