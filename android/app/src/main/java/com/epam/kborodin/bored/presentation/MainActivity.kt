package com.epam.kborodin.bored.presentation

import android.os.Bundle
import android.view.View
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
        initProgressBar()
    }

    private fun initText() {
        viewModel.viewData.action.observe(this) {
            binding.tvAction.text = it.result
        }
    }

    private fun initButton() {
        binding.btnAction.setOnClickListener {
            viewModel.getAction()
        }
    }

    private fun initProgressBar() {
        viewModel.viewData.isLoading.observe(this) { isLoading ->
            binding.pbLoading.visibility = if (isLoading) View.VISIBLE else View.GONE
            binding.tvAction.visibility = if (isLoading) View.GONE else View.VISIBLE
        }
    }
}