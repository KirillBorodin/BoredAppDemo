package com.epam.kborodin.bored.presentation

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.epam.kborodin.bored.domain.model.Action
import com.epam.kborodin.bored.domain.repository.ActionRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.catch
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.mapLatest
import javax.inject.Inject

@HiltViewModel
class MainActivityViewModel @Inject constructor(
    private val actionRepository: ActionRepository
) : ViewModel() {

    private val _action = MutableLiveData<Action>()
    val action: LiveData<Action>
        get() = _action

    init {
        getAction()
    }

    fun getAction() =
        actionRepository.getAction()
            .mapLatest { _action.postValue(it) }
            .catch { print(it.stackTrace) }
            .launchIn(viewModelScope)
}