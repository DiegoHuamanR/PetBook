package com.example.vetappointment.ui.consulta;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProvider;

import com.example.vetappointment.databinding.FragmentConsultaBinding;
import com.example.vetappointment.ui.consulta.ConsultaViewModel;

public class ConsultaFragment extends Fragment {

    private FragmentConsultaBinding binding;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        ConsultaViewModel consultaViewModel =
                new ViewModelProvider(this).get(ConsultaViewModel.class);

        binding = FragmentConsultaBinding.inflate(inflater, container, false);
        View root = binding.getRoot();
        return root;
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }

}