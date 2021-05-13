package com.teamfive.nettest.viewmodel;

import com.teamfive.nettest.utility.ModelMapperSingle;
import org.modelmapper.ModelMapper;

/**
 * @author TeamFive|LYL\LMX\GYD
 */

public class BaseVM {
    protected static ModelMapper modelMapper = ModelMapperSingle.Instance();


    public static ModelMapper getModelMapper() {
        return modelMapper;
    }

    public static void setModelMapper(ModelMapper modelMapper) {
        BaseVM.modelMapper = modelMapper;
    }
}
