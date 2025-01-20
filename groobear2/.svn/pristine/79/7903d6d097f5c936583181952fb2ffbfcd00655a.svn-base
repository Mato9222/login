package com.teamtodev.employees.vo;

import java.io.Serializable;
import java.util.List;

import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.sanction.vo.SanctionDocVO;
import com.teamtodev.sanction.vo.SanctionLineVO;
import com.teamtodev.schedule.vo.ScheduleVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"emplNo", "emplId"})
public class EmployeeVO implements Serializable {
    private static final long serialVersionUID = 1L;

    private int emplNo;
    private String emplNm;
    private String emplId;
    private String emplPw;
    private String ihidnum;
    private String cmmnCode;
    private String cmmnCodeNm;
    private String ofcpsCode;
    private String ofcpsCodeNm;
    private String rspofcCode;
    private String rspofcCodeNm;
    private int lxtnNo;
    private String emgncContactNtwkNo;
    private String moblphonNo;
    private String bassAdres;
    private String detailAdres;
    private int zip;
    private String emailAdres;
    private String encpnDe;
    private String retireDe;
    private int cnwkYycnt;
    private String proflPhotoCours;
    private String acntLockAt;
    private int loginFailrCo;
    private int deptNo;
    private String deptNm;
    private String sanctnCtpntUrl;
    
    private List<SanctionLineVO> sclineList; // 결재라인 Has Many
    private CommonVO comVO;
}