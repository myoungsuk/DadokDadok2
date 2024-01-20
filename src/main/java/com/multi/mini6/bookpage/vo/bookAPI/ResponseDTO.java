package com.multi.mini6.bookpage.vo.bookAPI;

import lombok.Data;
import java.util.List;

@Data
public class ResponseDTO {
    private RequestDTO request;
    private List<DetailDTO> detailDTO;
    private List<LoanInfoDTO> loanInfo;
}
