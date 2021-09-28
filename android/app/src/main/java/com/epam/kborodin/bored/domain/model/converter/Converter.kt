package com.epam.kborodin.bored.domain.model.converter

import com.epam.kborodin.bored.data.local.entity.ActionEntity
import com.epam.kborodin.bored.data.remote.model.ActionResponse
import com.epam.kborodin.bored.domain.model.Action

fun ActionEntity.toDomain() =
    Action(
        id = id,
        result = result
    )

fun ActionResponse.toEntity() =
    ActionEntity(
        id = id,
        result = result
    )