package com.example.vetappointment.ui.registro;

import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;
import com.example.vetappointment.ui.registro.RegistroViewModel;
import com.example.vetappointment.databinding.FragmentRegistroBinding;


public class RegistroFragment extends Fragment {

    private FragmentRegistroBinding binding;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        RegistroViewModel consultaViewModel =
                new ViewModelProvider(this).get(RegistroViewModel.class);

        binding = FragmentRegistroBinding.inflate(inflater, container, false);
        View root = binding.getRoot();
        return root;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}