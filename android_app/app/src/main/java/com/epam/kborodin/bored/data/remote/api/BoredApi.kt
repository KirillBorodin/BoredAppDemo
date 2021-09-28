package com.epam.kborodin.bored.data.remote.api

import com.epam.kborodin.bored.data.remote.model.ActionResponse
import retrofit2.http.GET

interface BoredApi {
    @GET("activity")
    suspend fun fetchAction(): ActionResponse
}