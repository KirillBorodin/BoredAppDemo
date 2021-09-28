package com.epam.kborodin.bored.data.local

import androidx.room.Database
import androidx.room.RoomDatabase
import com.epam.kborodin.bored.data.local.dao.ActionDao
import com.epam.kborodin.bored.data.local.entity.ActionEntity

@Database(
    entities = [
        ActionEntity::class
    ],
    version = 1
)
abstract class BoredDatabase : RoomDatabase() {

    abstract fun actionDao(): ActionDao
}