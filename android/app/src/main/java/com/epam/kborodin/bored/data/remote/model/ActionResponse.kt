package com.epam.kborodin.bored.data.remote.model

import com.google.gson.annotations.SerializedName

data class ActionResponse(
    @SerializedName("key")
    val id: Int,
    @SerializedName("activity")
    val result: String
)