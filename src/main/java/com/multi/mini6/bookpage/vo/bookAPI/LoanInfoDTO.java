package com.multi.mini6.bookpage.vo.bookAPI;

import lombok.Data;

@Data
public class LoanInfoDTO {
    private TotalDTO Total;
    private RegionResultDTO regionResult;
    private AgeResultDTO ageResult;
    private GenderResultDTO genderResult;
}