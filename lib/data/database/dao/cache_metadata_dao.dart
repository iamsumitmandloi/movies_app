import 'package:drift/drift.dart';

import '../app_database.dart';
import '../entities/cache_metadata_entity.dart';

part 'cache_metadata_dao.g.dart';

@DriftAccessor(tables: [CacheMetadata])
class CacheMetadataDao extends DatabaseAccessor<AppDatabase>
    with _$CacheMetadataDaoMixin {
  CacheMetadataDao(super.db);

  Future<CacheMetadataEntity?> getCacheMetadata(String key) => (select(
    cacheMetadata,
  )..where((c) => c.key.equals(key))).getSingleOrNull();

  Future<int> insertOrUpdateCacheMetadata(CacheMetadataCompanion metadata) =>
      into(cacheMetadata).insertOnConflictUpdate(metadata);

  Future<bool> isCacheValid(String key) async {
    final metadata = await getCacheMetadata(key);
    if (metadata == null) return false;
    return DateTime.now().isBefore(metadata.expiresAt);
  }

  Future<int> clearExpiredCache() => (delete(
    cacheMetadata,
  )..where((c) => c.expiresAt.isSmallerThanValue(DateTime.now()))).go();

  Future<int> clearAllCache() => delete(cacheMetadata).go();
}
