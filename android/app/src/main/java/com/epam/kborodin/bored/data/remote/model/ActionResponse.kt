package com.epam.kborodin.bored.data.remote.model

import com.google.gson.annotations.SerializedName

data class ActionResponse(
    @SerializedName("activity")
    val result: String
)