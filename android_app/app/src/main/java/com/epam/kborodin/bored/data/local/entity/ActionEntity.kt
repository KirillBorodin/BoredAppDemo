package com.epam.kborodin.bored.data.local.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "action")
data class ActionEntity(
    @PrimaryKey
    val id: String,
    @ColumnInfo(name = "result")
    val result: String
)