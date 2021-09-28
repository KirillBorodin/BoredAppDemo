package com.epam.kborodin.bored.data.local.dao

import androidx.room.*
import com.epam.kborodin.bored.data.local.entity.ActionEntity

@Dao
abstract class ActionDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    abstract suspend fun insertAction(entity: ActionEntity)

    @Query("SELECT * FROM `action`")
    abstract suspend fun getAction(): ActionEntity?

    @Query("DELETE FROM `action`")
    abstract suspend fun delete()

    @Transaction
    open suspend fun update(
        entity: ActionEntity,
    ) {
        delete()
        insertAction(entity)
    }
}