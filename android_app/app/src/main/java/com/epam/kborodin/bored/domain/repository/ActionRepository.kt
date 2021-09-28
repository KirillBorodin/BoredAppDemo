package com.epam.kborodin.bored.domain.repository

import com.epam.kborodin.bored.domain.model.Action
import kotlinx.coroutines.flow.Flow

interface ActionRepository {

    fun getAction(): Flow<Action?>
}