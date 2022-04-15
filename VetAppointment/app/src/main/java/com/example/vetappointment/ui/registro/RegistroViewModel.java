package com.example.vetappointment.ui.registro;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class RegistroViewModel extends ViewModel {

    private final MutableLiveData<String> mText;

    public RegistroViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("This is consulta fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }
}