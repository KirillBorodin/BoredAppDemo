package com.epam.kborodin.bored.presentation

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
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
    val viewData = MainActivityViewData()

    fun getAction() {
        setActionIsLoading(true)
        actionRepository.getAction()
            .mapLatest {
                viewData.action.postValue(it)
                setActionIsLoading(false)
            }
            .catch {
                print(it.stackTrace)
                viewData.isLoading.postValue(false)
            }
            .launchIn(viewModelScope)
    }

    private fun setActionIsLoading(isLoading: Boolean) {
        viewData.isLoading.postValue(isLoading)
    }
}