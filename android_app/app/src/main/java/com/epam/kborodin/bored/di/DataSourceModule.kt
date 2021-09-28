package com.epam.kborodin.bored.di

import com.epam.kborodin.bored.data.ActionRepositoryImpl
import com.epam.kborodin.bored.data.local.dao.ActionDao
import com.epam.kborodin.bored.data.remote.api.BoredApi
import com.epam.kborodin.bored.domain.repository.ActionRepository
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class DataSourceModule {

    @Provides
    @Singleton
    fun provideActionRepository(remote: BoredApi, local: ActionDao): ActionRepository =
        ActionRepositoryImpl(remote, local)
}