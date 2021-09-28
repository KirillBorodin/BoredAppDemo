package com.epam.kborodin.bored.presentation

import androidx.lifecycle.MutableLiveData
import com.epam.kborodin.bored.domain.model.Action

class MainActivityViewData {
    val action = MutableLiveData<Action>()
}