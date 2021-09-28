package com.epam.kborodin.bored.data

import com.epam.kborodin.bored.data.remote.api.BoredApi
import com.epam.kborodin.bored.domain.model.Action
import com.epam.kborodin.bored.domain.model.converter.toDomain
import com.epam.kborodin.bored.domain.repository.ActionRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import javax.inject.Inject

class ActionRepositoryImpl @Inject constructor(
    private val remote: BoredApi,
) : ActionRepository {

    override fun getAction(): Flow<Action> = flow {
        emit(remote.fetchAction().toDomain())
    }
}