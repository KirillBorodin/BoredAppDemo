package com.epam.kborodin.bored.presentation

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.ViewModelProvider
import com.epam.kborodin.bored.databinding.ActivityMainBinding
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding
    private lateinit var viewModel: MainActivityViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        viewModel = ViewModelProvider(this)[MainActivityViewModel::class.java]
        setContentView(binding.root)
        initText()
        initButton()
    }

    private fun initText() =
        viewModel.action.observe(this) { action ->
            binding.tvAction.text = action?.result
        }

    private fun initButton() =
        binding.btnAction.setOnClickListener {
            viewModel.getAction()
        }
}