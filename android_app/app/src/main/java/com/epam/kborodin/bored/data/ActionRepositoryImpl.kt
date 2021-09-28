package com.epam.kborodin.bored.data

import com.epam.kborodin.bored.data.local.dao.ActionDao
import com.epam.kborodin.bored.data.remote.api.BoredApi
import com.epam.kborodin.bored.domain.model.Action
import com.epam.kborodin.bored.domain.model.converter.toDomain
import com.epam.kborodin.bored.domain.model.converter.toEntity
import com.epam.kborodin.bored.domain.repository.ActionRepository
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import javax.inject.Inject

class ActionRepositoryImpl @Inject constructor(
    private val remote: BoredApi,
    private val local: ActionDao
) : ActionRepository {

    override fun getAction(): Flow<Action?> = flow {
        emit(local.getAction()?.toDomain())
        val response = remote.fetchAction()
        local.update(response.toEntity())
        emit(local.getAction()?.toDomain())
    }
}