package com.mystudy.command.qa;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.command.Command;

import java.io.IOException;

public class QAWriteCommand implements Command{
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // QAInsert.jsp 페이지로 이동
        return "qa/QAInsert.jsp";


    }
}
