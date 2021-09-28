package com.epam.kborodin.bored.domain.model.converter

import com.epam.kborodin.bored.data.remote.model.ActionResponse
import com.epam.kborodin.bored.domain.model.Action

fun ActionResponse.toDomain() =
    Action(
        result = result
    )