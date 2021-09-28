package com.epam.kborodin.bored.di

import android.content.Context
import androidx.room.Room
import com.epam.kborodin.bored.data.local.BoredDatabase
import com.epam.kborodin.bored.data.local.dao.ActionDao
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
class DatabaseModule {

    @Provides
    @Singleton
    fun initRoom(@ApplicationContext context: Context): BoredDatabase =
        Room.databaseBuilder(context, BoredDatabase::class.java, "bored_database")
            .build()

    @Provides
    @Singleton
    fun provideActionDao(appDatabase: BoredDatabase): ActionDao = appDatabase.actionDao()
}