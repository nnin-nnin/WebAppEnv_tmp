--
-- PostgreSQL database dump
--

\restrict pSFV2KPyaJ9y1tK6jIruAjdEQTrnVHtcv3aZpSWHOlhmud3NdjmnVwOxSPZdy1Y

-- Dumped from database version 16.15
-- Dumped by pg_dump version 16.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.spree_option_type_translations DROP CONSTRAINT IF EXISTS fk_rails_ef425c2e25;
ALTER TABLE IF EXISTS ONLY public.solid_queue_scheduled_executions DROP CONSTRAINT IF EXISTS fk_rails_c4316f352d;
ALTER TABLE IF EXISTS ONLY public.active_storage_attachments DROP CONSTRAINT IF EXISTS fk_rails_c3b3935057;
ALTER TABLE IF EXISTS ONLY public.spree_taxonomy_translations DROP CONSTRAINT IF EXISTS fk_rails_b306143421;
ALTER TABLE IF EXISTS ONLY public.spree_payment_sources DROP CONSTRAINT IF EXISTS fk_rails_a344a41636;
ALTER TABLE IF EXISTS ONLY public.solid_queue_claimed_executions DROP CONSTRAINT IF EXISTS fk_rails_9cfe4d4944;
ALTER TABLE IF EXISTS ONLY public.active_storage_variant_records DROP CONSTRAINT IF EXISTS fk_rails_993965df05;
ALTER TABLE IF EXISTS ONLY public.solid_queue_ready_executions DROP CONSTRAINT IF EXISTS fk_rails_81fcbd66af;
ALTER TABLE IF EXISTS ONLY public.spree_product_translations DROP CONSTRAINT IF EXISTS fk_rails_7eb5601038;
ALTER TABLE IF EXISTS ONLY public.spree_option_value_translations DROP CONSTRAINT IF EXISTS fk_rails_70138a1aef;
ALTER TABLE IF EXISTS ONLY public.solid_queue_blocked_executions DROP CONSTRAINT IF EXISTS fk_rails_4cd34e2228;
ALTER TABLE IF EXISTS ONLY public.solid_queue_failed_executions DROP CONSTRAINT IF EXISTS fk_rails_39bbc7a631;
ALTER TABLE IF EXISTS ONLY public.spree_category_translations DROP CONSTRAINT IF EXISTS fk_rails_32e85b445d;
ALTER TABLE IF EXISTS ONLY public.solid_queue_recurring_executions DROP CONSTRAINT IF EXISTS fk_rails_318a5533ed;
ALTER TABLE IF EXISTS ONLY public.spree_store_translations DROP CONSTRAINT IF EXISTS fk_rails_197d0c4bbd;
DROP INDEX IF EXISTS public.unique_spree_shipping_method_categories;
DROP INDEX IF EXISTS public.unique_slug_per_locale;
DROP INDEX IF EXISTS public.unique_product_id_per_locale;
DROP INDEX IF EXISTS public.unique_option_value_id_per_locale;
DROP INDEX IF EXISTS public.unique_option_type_id_per_locale;
DROP INDEX IF EXISTS public.stock_level_by_loc_var_id_deleted_at;
DROP INDEX IF EXISTS public.stock_level_by_loc_and_var_id;
DROP INDEX IF EXISTS public.spree_taggings_taggable_context_idx;
DROP INDEX IF EXISTS public.spree_taggings_idy;
DROP INDEX IF EXISTS public.spree_taggings_idx;
DROP INDEX IF EXISTS public.spree_store_credits_originator;
DROP INDEX IF EXISTS public.spree_store_credit_events_originator;
DROP INDEX IF EXISTS public.spree_delivery_rates_join_index;
DROP INDEX IF EXISTS public.payment_mentod_id_store_id_unique_index;
DROP INDEX IF EXISTS public.index_taxons_on_taxonomy_id;
DROP INDEX IF EXISTS public.index_taxons_on_permalink;
DROP INDEX IF EXISTS public.index_taxons_on_parent_id;
DROP INDEX IF EXISTS public.index_stock_movements_on_originator_id_and_originator_type;
DROP INDEX IF EXISTS public.index_spree_zones_on_kind;
DROP INDEX IF EXISTS public.index_spree_zones_on_default_tax;
DROP INDEX IF EXISTS public.index_spree_zone_members_uniqueness;
DROP INDEX IF EXISTS public.index_spree_zone_members_on_zone_id;
DROP INDEX IF EXISTS public.index_spree_wishlists_on_token;
DROP INDEX IF EXISTS public.index_spree_wishlists_on_store_id;
DROP INDEX IF EXISTS public.index_spree_wishlists_on_customer_id_and_is_default;
DROP INDEX IF EXISTS public.index_spree_wishlists_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_wishlist_items_on_wishlist_id;
DROP INDEX IF EXISTS public.index_spree_wishlist_items_on_variant_id_and_wishlist_id;
DROP INDEX IF EXISTS public.index_spree_wishlist_items_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_webhook_endpoints_on_store_id;
DROP INDEX IF EXISTS public.index_spree_webhook_endpoints_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_webhook_endpoints_on_active;
DROP INDEX IF EXISTS public.index_spree_webhook_deliveries_on_webhook_endpoint_id;
DROP INDEX IF EXISTS public.index_spree_webhook_deliveries_on_success;
DROP INDEX IF EXISTS public.index_spree_webhook_deliveries_on_response_code;
DROP INDEX IF EXISTS public.index_spree_webhook_deliveries_on_event_name;
DROP INDEX IF EXISTS public.index_spree_webhook_deliveries_on_endpoint_and_event;
DROP INDEX IF EXISTS public.index_spree_webhook_deliveries_on_delivered_at;
DROP INDEX IF EXISTS public.index_spree_variants_on_track_inventory;
DROP INDEX IF EXISTS public.index_spree_variants_on_tax_category_id;
DROP INDEX IF EXISTS public.index_spree_variants_on_sku;
DROP INDEX IF EXISTS public.index_spree_variants_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_variants_on_product_id;
DROP INDEX IF EXISTS public.index_spree_variants_on_primary_media_id;
DROP INDEX IF EXISTS public.index_spree_variants_on_position;
DROP INDEX IF EXISTS public.index_spree_variants_on_media_count;
DROP INDEX IF EXISTS public.index_spree_variants_on_is_master;
DROP INDEX IF EXISTS public.index_spree_variants_on_discontinue_on;
DROP INDEX IF EXISTS public.index_spree_variants_on_delivery_profile_id;
DROP INDEX IF EXISTS public.index_spree_variants_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_variants_on_carton_package_type_id;
DROP INDEX IF EXISTS public.index_spree_variants_on_barcode;
DROP INDEX IF EXISTS public.index_spree_user_identities_on_user;
DROP INDEX IF EXISTS public.index_spree_user_identities_on_provider_uid_user_type;
DROP INDEX IF EXISTS public.index_spree_trackers_on_active;
DROP INDEX IF EXISTS public.index_spree_taxonomy_translations_on_spree_taxonomy_id_locale;
DROP INDEX IF EXISTS public.index_spree_taxonomy_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_taxonomies_on_store_id;
DROP INDEX IF EXISTS public.index_spree_taxonomies_on_position;
DROP INDEX IF EXISTS public.index_spree_taxonomies_on_name_and_store_id;
DROP INDEX IF EXISTS public.index_spree_taxon_rules_on_taxon_id;
DROP INDEX IF EXISTS public.index_spree_tax_rates_on_zone_id;
DROP INDEX IF EXISTS public.index_spree_tax_rates_on_tax_category_id;
DROP INDEX IF EXISTS public.index_spree_tax_rates_on_store_id;
DROP INDEX IF EXISTS public.index_spree_tax_rates_on_show_rate_in_label;
DROP INDEX IF EXISTS public.index_spree_tax_rates_on_included_in_price;
DROP INDEX IF EXISTS public.index_spree_tax_rates_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_tax_rates_on_country_code_and_state_code;
DROP INDEX IF EXISTS public.index_spree_tax_lines_on_taxability_reason;
DROP INDEX IF EXISTS public.index_spree_tax_lines_on_tax_rate_id;
DROP INDEX IF EXISTS public.index_spree_tax_lines_on_order_id;
DROP INDEX IF EXISTS public.index_spree_tax_lines_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_tax_lines_on_fulfillment_id;
DROP INDEX IF EXISTS public.index_spree_tax_lines_on_fee_id;
DROP INDEX IF EXISTS public.index_spree_tax_lines_on_country_code_and_state_code;
DROP INDEX IF EXISTS public.index_spree_tax_lines_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_tax_identifiers_on_owner_and_kind;
DROP INDEX IF EXISTS public.index_spree_tax_identifiers_on_owner;
DROP INDEX IF EXISTS public.index_spree_tax_exemption_certificates_on_verified_by_id;
DROP INDEX IF EXISTS public.index_spree_tax_exemption_certificates_on_company_id;
DROP INDEX IF EXISTS public.index_spree_tax_categories_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_tax_categories_on_store_id;
DROP INDEX IF EXISTS public.index_spree_tax_categories_on_is_default;
DROP INDEX IF EXISTS public.index_spree_tax_categories_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_tags_on_name;
DROP INDEX IF EXISTS public.index_spree_tags_on_lower_name;
DROP INDEX IF EXISTS public.index_spree_taggings_on_tenant;
DROP INDEX IF EXISTS public.index_spree_taggings_on_tagger_type_and_tagger_id;
DROP INDEX IF EXISTS public.index_spree_taggings_on_tagger_id_and_tagger_type;
DROP INDEX IF EXISTS public.index_spree_taggings_on_tagger_id;
DROP INDEX IF EXISTS public.index_spree_taggings_on_taggable_type_and_taggable_id;
DROP INDEX IF EXISTS public.index_spree_taggings_on_taggable_type;
DROP INDEX IF EXISTS public.index_spree_taggings_on_taggable_id;
DROP INDEX IF EXISTS public.index_spree_taggings_on_tag_id;
DROP INDEX IF EXISTS public.index_spree_taggings_on_context;
DROP INDEX IF EXISTS public.index_spree_suppliers_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_suppliers_on_store_id;
DROP INDEX IF EXISTS public.index_spree_suppliers_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_stripe_webhook_keys_on_stripe_id;
DROP INDEX IF EXISTS public.index_spree_stripe_webhook_keys_on_signing_secret;
DROP INDEX IF EXISTS public.index_spree_stripe_payment_intents_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_stripe_payment_intents_on_order_id_and_stripe_id;
DROP INDEX IF EXISTS public.index_spree_stripe_payment_intents_on_order_id;
DROP INDEX IF EXISTS public.index_spree_stores_on_url;
DROP INDEX IF EXISTS public.index_spree_stores_on_setup_token;
DROP INDEX IF EXISTS public.index_spree_stores_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_stores_on_default;
DROP INDEX IF EXISTS public.index_spree_stores_on_code;
DROP INDEX IF EXISTS public.index_spree_store_translations_on_spree_store_id_locale;
DROP INDEX IF EXISTS public.index_spree_store_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_store_translations_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_store_credits_on_type_id;
DROP INDEX IF EXISTS public.index_spree_store_credits_on_store_id;
DROP INDEX IF EXISTS public.index_spree_store_credits_on_refunded_order_id;
DROP INDEX IF EXISTS public.index_spree_store_credits_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_store_credits_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_store_credit_types_on_priority;
DROP INDEX IF EXISTS public.index_spree_store_credit_events_on_store_credit_id;
DROP INDEX IF EXISTS public.index_spree_stock_transfers_on_store_id;
DROP INDEX IF EXISTS public.index_spree_stock_transfers_on_status;
DROP INDEX IF EXISTS public.index_spree_stock_transfers_on_source_location_id;
DROP INDEX IF EXISTS public.index_spree_stock_transfers_on_number;
DROP INDEX IF EXISTS public.index_spree_stock_transfers_on_destination_location_id;
DROP INDEX IF EXISTS public.index_spree_stock_transfers_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_stock_transfer_items_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_stock_transfer_items_on_stock_transfer_id;
DROP INDEX IF EXISTS public.index_spree_stock_reservations_on_order_id;
DROP INDEX IF EXISTS public.index_spree_stock_reservations_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_stock_reservations_on_expires_at;
DROP INDEX IF EXISTS public.index_spree_stock_reservations_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_stock_receipts_on_store_id;
DROP INDEX IF EXISTS public.index_spree_stock_receipts_on_received_by_id;
DROP INDEX IF EXISTS public.index_spree_stock_receipts_on_received_by_actor;
DROP INDEX IF EXISTS public.index_spree_stock_receipts_on_receivable;
DROP INDEX IF EXISTS public.index_spree_stock_receipts_on_number;
DROP INDEX IF EXISTS public.index_spree_stock_receipt_items_on_stock_receipt_id;
DROP INDEX IF EXISTS public.index_spree_stock_receipt_items_on_line;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_stock_transfer_id;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_stock_receipt_id;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_stock_level_id_and_created_at;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_stock_level_id;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_return_id;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_purchase_order_id;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_order_id;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_kind;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_fulfillment_id;
DROP INDEX IF EXISTS public.index_spree_stock_movements_on_exchange_id;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_store_id;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_state_id;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_returns_enabled;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_propagate_all_variants;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_pickup_enabled;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_kind;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_country_id;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_backorderable_default;
DROP INDEX IF EXISTS public.index_spree_stock_locations_on_active;
DROP INDEX IF EXISTS public.index_spree_stock_levels_unique_without_deleted_at;
DROP INDEX IF EXISTS public.index_spree_stock_levels_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_stock_levels_on_stock_location_id;
DROP INDEX IF EXISTS public.index_spree_stock_levels_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_stock_levels_on_backorderable;
DROP INDEX IF EXISTS public.index_spree_states_on_country_id_and_abbr;
DROP INDEX IF EXISTS public.index_spree_states_on_country_id;
DROP INDEX IF EXISTS public.index_spree_state_changes_on_stateful_id_and_stateful_type;
DROP INDEX IF EXISTS public.index_spree_shipping_method_categories_on_shipping_method_id;
DROP INDEX IF EXISTS public.index_spree_shipping_method_categories_on_shipping_category_id;
DROP INDEX IF EXISTS public.index_spree_shipping_labels_on_store_id;
DROP INDEX IF EXISTS public.index_spree_shipping_labels_on_owner_type_and_owner_id;
DROP INDEX IF EXISTS public.index_spree_shipping_labels_on_owner;
DROP INDEX IF EXISTS public.index_spree_shipping_labels_on_integration_id;
DROP INDEX IF EXISTS public.index_spree_shipping_labels_on_active_owner;
DROP INDEX IF EXISTS public.index_spree_sellers_on_store_id_and_status;
DROP INDEX IF EXISTS public.index_spree_sellers_on_store_id_and_slug;
DROP INDEX IF EXISTS public.index_spree_sellers_on_store_id;
DROP INDEX IF EXISTS public.index_spree_sellers_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_sellers_on_billing_address_id;
DROP INDEX IF EXISTS public.index_spree_seller_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_seller_transfers_on_store_id;
DROP INDEX IF EXISTS public.index_spree_seller_transfers_on_seller_id_and_created_at;
DROP INDEX IF EXISTS public.index_spree_seller_transfers_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_seller_transfers_on_reversed_from_id;
DROP INDEX IF EXISTS public.index_spree_seller_transfers_on_payout_id;
DROP INDEX IF EXISTS public.index_spree_seller_transfers_on_order_id;
DROP INDEX IF EXISTS public.index_spree_seller_requirements_on_store_id_and_type;
DROP INDEX IF EXISTS public.index_spree_seller_requirements_on_store_id_and_position;
DROP INDEX IF EXISTS public.index_spree_seller_requirements_on_store_id;
DROP INDEX IF EXISTS public.index_spree_seller_requirement_submissions_on_submitted_by_id;
DROP INDEX IF EXISTS public.index_spree_seller_requirement_submissions_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_seller_requirement_submissions_on_reviewed_by_id;
DROP INDEX IF EXISTS public.index_spree_seller_payouts_on_store_id;
DROP INDEX IF EXISTS public.index_spree_seller_payouts_on_seller_id_and_created_at;
DROP INDEX IF EXISTS public.index_spree_seller_payouts_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_saved_reports_on_user_id;
DROP INDEX IF EXISTS public.index_spree_saved_reports_on_store_and_lower_name;
DROP INDEX IF EXISTS public.index_spree_roles_on_resource_and_name;
DROP INDEX IF EXISTS public.index_spree_role_users_on_user_type;
DROP INDEX IF EXISTS public.index_spree_role_users_on_user_id;
DROP INDEX IF EXISTS public.index_spree_role_users_on_user_and_role;
DROP INDEX IF EXISTS public.index_spree_role_users_on_role_id;
DROP INDEX IF EXISTS public.index_spree_role_users_on_invitation_id;
DROP INDEX IF EXISTS public.index_spree_returns_on_store_id;
DROP INDEX IF EXISTS public.index_spree_returns_on_stock_location_id;
DROP INDEX IF EXISTS public.index_spree_returns_on_status;
DROP INDEX IF EXISTS public.index_spree_returns_on_reason_id;
DROP INDEX IF EXISTS public.index_spree_returns_on_order_id;
DROP INDEX IF EXISTS public.index_spree_returns_on_number;
DROP INDEX IF EXISTS public.index_spree_returns_on_created_by_id;
DROP INDEX IF EXISTS public.index_spree_returns_on_created_by_actor;
DROP INDEX IF EXISTS public.index_spree_return_reasons_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_return_reasons_on_store_id;
DROP INDEX IF EXISTS public.index_spree_return_line_items_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_return_line_items_on_return_id;
DROP INDEX IF EXISTS public.index_spree_return_line_items_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_return_line_items_on_fulfillment_item_id;
DROP INDEX IF EXISTS public.index_spree_return_items_on_return_authorization_id;
DROP INDEX IF EXISTS public.index_spree_return_items_on_reimbursement_id;
DROP INDEX IF EXISTS public.index_spree_return_items_on_preferred_reimbursement_type_id;
DROP INDEX IF EXISTS public.index_spree_return_items_on_override_reimbursement_type_id;
DROP INDEX IF EXISTS public.index_spree_return_items_on_fulfillment_item_id;
DROP INDEX IF EXISTS public.index_spree_return_items_on_exchange_variant_id;
DROP INDEX IF EXISTS public.index_spree_return_authorizations_on_stock_location_id;
DROP INDEX IF EXISTS public.index_spree_return_authorizations_on_order_id;
DROP INDEX IF EXISTS public.index_spree_return_authorizations_on_number;
DROP INDEX IF EXISTS public.index_spree_reports_on_user_id;
DROP INDEX IF EXISTS public.index_spree_reports_on_store_id;
DROP INDEX IF EXISTS public.index_spree_reimbursements_on_performed_by_id;
DROP INDEX IF EXISTS public.index_spree_reimbursements_on_order_id;
DROP INDEX IF EXISTS public.index_spree_reimbursements_on_number;
DROP INDEX IF EXISTS public.index_spree_reimbursements_on_customer_return_id;
DROP INDEX IF EXISTS public.index_spree_reimbursement_types_on_type;
DROP INDEX IF EXISTS public.index_spree_reimbursement_types_on_name;
DROP INDEX IF EXISTS public.index_spree_reimbursement_credits_on_reimbursement_id;
DROP INDEX IF EXISTS public.index_spree_refunds_on_reimbursement_id;
DROP INDEX IF EXISTS public.index_spree_refunds_on_refunder_id;
DROP INDEX IF EXISTS public.index_spree_refunds_on_refunder_actor;
DROP INDEX IF EXISTS public.index_spree_refunds_on_payment_id;
DROP INDEX IF EXISTS public.index_spree_refunds_on_originator;
DROP INDEX IF EXISTS public.index_spree_refunds_on_order_id;
DROP INDEX IF EXISTS public.index_spree_refund_reasons_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_refund_reasons_on_store_id;
DROP INDEX IF EXISTS public.index_spree_refresh_tokens_on_user;
DROP INDEX IF EXISTS public.index_spree_refresh_tokens_on_token;
DROP INDEX IF EXISTS public.index_spree_refresh_tokens_on_expires_at;
DROP INDEX IF EXISTS public.index_spree_purchase_orders_on_supplier_id;
DROP INDEX IF EXISTS public.index_spree_purchase_orders_on_store_id;
DROP INDEX IF EXISTS public.index_spree_purchase_orders_on_status;
DROP INDEX IF EXISTS public.index_spree_purchase_orders_on_number;
DROP INDEX IF EXISTS public.index_spree_purchase_orders_on_destination_location_id;
DROP INDEX IF EXISTS public.index_spree_purchase_order_items_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_purchase_order_items_on_purchase_order_id;
DROP INDEX IF EXISTS public.index_spree_promotions_stores_on_store_id;
DROP INDEX IF EXISTS public.index_spree_promotions_stores_on_promotion_id_and_store_id;
DROP INDEX IF EXISTS public.index_spree_promotions_stores_on_promotion_id;
DROP INDEX IF EXISTS public.index_spree_promotions_on_store_id;
DROP INDEX IF EXISTS public.index_spree_promotions_on_starts_at;
DROP INDEX IF EXISTS public.index_spree_promotions_on_promotion_category_id;
DROP INDEX IF EXISTS public.index_spree_promotions_on_path;
DROP INDEX IF EXISTS public.index_spree_promotions_on_kind;
DROP INDEX IF EXISTS public.index_spree_promotions_on_id_and_type;
DROP INDEX IF EXISTS public.index_spree_promotions_on_expires_at;
DROP INDEX IF EXISTS public.index_spree_promotions_on_code;
DROP INDEX IF EXISTS public.index_spree_promotions_on_advertise;
DROP INDEX IF EXISTS public.index_spree_promotion_rules_on_promotion_id_and_type;
DROP INDEX IF EXISTS public.index_spree_promotion_rules_on_promotion_id;
DROP INDEX IF EXISTS public.index_spree_promotion_rule_categories_on_promotion_rule_id;
DROP INDEX IF EXISTS public.index_spree_promotion_rule_categories_on_category_id;
DROP INDEX IF EXISTS public.index_spree_promotion_actions_on_promotion_id;
DROP INDEX IF EXISTS public.index_spree_promotion_actions_on_id_and_type;
DROP INDEX IF EXISTS public.index_spree_promotion_actions_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_promotion_action_line_items_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_promotion_action_line_items_on_promotion_action_id;
DROP INDEX IF EXISTS public.index_spree_products_stores_on_store_id;
DROP INDEX IF EXISTS public.index_spree_products_stores_on_product_id_and_store_id;
DROP INDEX IF EXISTS public.index_spree_products_stores_on_product_id;
DROP INDEX IF EXISTS public.index_spree_products_on_variant_count;
DROP INDEX IF EXISTS public.index_spree_products_on_tax_category_id;
DROP INDEX IF EXISTS public.index_spree_products_on_store_id_and_units_sold_count;
DROP INDEX IF EXISTS public.index_spree_products_on_store_id;
DROP INDEX IF EXISTS public.index_spree_products_on_status_and_deleted_at;
DROP INDEX IF EXISTS public.index_spree_products_on_status;
DROP INDEX IF EXISTS public.index_spree_products_on_slug;
DROP INDEX IF EXISTS public.index_spree_products_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_products_on_promotionable;
DROP INDEX IF EXISTS public.index_spree_products_on_product_type_id;
DROP INDEX IF EXISTS public.index_spree_products_on_primary_media_id;
DROP INDEX IF EXISTS public.index_spree_products_on_name;
DROP INDEX IF EXISTS public.index_spree_products_on_media_count;
DROP INDEX IF EXISTS public.index_spree_products_on_make_active_at;
DROP INDEX IF EXISTS public.index_spree_products_on_discontinue_on;
DROP INDEX IF EXISTS public.index_spree_products_on_delivery_profile_id;
DROP INDEX IF EXISTS public.index_spree_products_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_products_on_default_variant_id;
DROP INDEX IF EXISTS public.index_spree_products_on_categories_count;
DROP INDEX IF EXISTS public.index_spree_products_on_available_on;
DROP INDEX IF EXISTS public.index_spree_product_types_on_store_id;
DROP INDEX IF EXISTS public.index_spree_product_types_on_delivery_profile_id;
DROP INDEX IF EXISTS public.index_spree_product_type_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_product_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_product_translations_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_product_submissions_on_submitted_by_id;
DROP INDEX IF EXISTS public.index_spree_product_submissions_on_reviewed_by_id;
DROP INDEX IF EXISTS public.index_spree_product_submissions_on_product_id_and_created_at;
DROP INDEX IF EXISTS public.index_spree_product_submissions_on_product_id;
DROP INDEX IF EXISTS public.index_spree_product_publications_on_product_id;
DROP INDEX IF EXISTS public.index_spree_product_publications_on_product_and_channel;
DROP INDEX IF EXISTS public.index_spree_product_publications_on_channel_id;
DROP INDEX IF EXISTS public.index_spree_product_option_types_on_product_id;
DROP INDEX IF EXISTS public.index_spree_product_option_types_on_position;
DROP INDEX IF EXISTS public.index_spree_product_option_types_on_option_type_id;
DROP INDEX IF EXISTS public.index_spree_product_collections_on_product_id;
DROP INDEX IF EXISTS public.index_spree_product_collections_on_collection_id;
DROP INDEX IF EXISTS public.index_spree_product_categories_on_product_id_and_category_id;
DROP INDEX IF EXISTS public.index_spree_product_categories_on_product_id;
DROP INDEX IF EXISTS public.index_spree_product_categories_on_position;
DROP INDEX IF EXISTS public.index_spree_product_categories_on_category_id;
DROP INDEX IF EXISTS public.index_spree_prices_on_variant_id_and_currency;
DROP INDEX IF EXISTS public.index_spree_prices_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_prices_on_variant_currency_list_quantity;
DROP INDEX IF EXISTS public.index_spree_prices_on_price_list_id;
DROP INDEX IF EXISTS public.index_spree_prices_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_price_rules_on_type;
DROP INDEX IF EXISTS public.index_spree_price_rules_on_price_list_id_and_type;
DROP INDEX IF EXISTS public.index_spree_price_rules_on_price_list_id;
DROP INDEX IF EXISTS public.index_spree_price_lists_one_per_catalog;
DROP INDEX IF EXISTS public.index_spree_price_lists_on_store_id_and_status_and_position;
DROP INDEX IF EXISTS public.index_spree_price_lists_on_store_id;
DROP INDEX IF EXISTS public.index_spree_price_lists_on_status;
DROP INDEX IF EXISTS public.index_spree_price_lists_on_starts_at_and_ends_at;
DROP INDEX IF EXISTS public.index_spree_price_lists_on_position;
DROP INDEX IF EXISTS public.index_spree_price_lists_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_price_adjustment_tiers_on_list_and_quantity;
DROP INDEX IF EXISTS public.index_spree_preferences_on_key;
DROP INDEX IF EXISTS public.index_spree_policy_translations_on_spree_policy_id_and_locale;
DROP INDEX IF EXISTS public.index_spree_policy_translations_on_spree_policy_id;
DROP INDEX IF EXISTS public.index_spree_policies_on_owner_id_and_owner_type_and_slug;
DROP INDEX IF EXISTS public.index_spree_policies_on_owner;
DROP INDEX IF EXISTS public.index_spree_paypal_checkout_orders_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_paypal_checkout_orders_on_order_id_and_paypal_id;
DROP INDEX IF EXISTS public.index_spree_paypal_checkout_orders_on_order_id;
DROP INDEX IF EXISTS public.index_spree_payments_on_source_id_and_source_type;
DROP INDEX IF EXISTS public.index_spree_payments_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_payments_on_order_id;
DROP INDEX IF EXISTS public.index_spree_payments_on_order_group_id;
DROP INDEX IF EXISTS public.index_spree_payments_on_number;
DROP INDEX IF EXISTS public.index_spree_payments_on_created_at;
DROP INDEX IF EXISTS public.index_spree_payments_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_payment_splits_on_payment_id_and_order_id;
DROP INDEX IF EXISTS public.index_spree_payment_splits_on_order_id;
DROP INDEX IF EXISTS public.index_spree_payment_sources_on_type;
DROP INDEX IF EXISTS public.index_spree_payment_sources_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_payment_sources_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_payment_setup_sessions_on_type;
DROP INDEX IF EXISTS public.index_spree_payment_setup_sessions_on_status;
DROP INDEX IF EXISTS public.index_spree_payment_setup_sessions_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_payment_setup_sessions_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_payment_setup_sessions_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_type;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_status;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_order_id;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_external_id;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_expires_at;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_payment_sessions_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_payment_methods_stores_on_store_id;
DROP INDEX IF EXISTS public.index_spree_payment_methods_stores_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_payment_methods_on_store_id;
DROP INDEX IF EXISTS public.index_spree_payment_methods_on_id_and_type;
DROP INDEX IF EXISTS public.index_spree_payment_capture_events_on_payment_id;
DROP INDEX IF EXISTS public.index_spree_package_types_seller_name;
DROP INDEX IF EXISTS public.index_spree_package_types_seller_default;
DROP INDEX IF EXISTS public.index_spree_package_types_on_store_id;
DROP INDEX IF EXISTS public.index_spree_package_types_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_package_types_marketplace_name;
DROP INDEX IF EXISTS public.index_spree_package_types_marketplace_default;
DROP INDEX IF EXISTS public.index_spree_orders_on_token;
DROP INDEX IF EXISTS public.index_spree_orders_on_store_id_and_email;
DROP INDEX IF EXISTS public.index_spree_orders_on_store_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_status;
DROP INDEX IF EXISTS public.index_spree_orders_on_ship_address_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_preferred_stock_location_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_po_number;
DROP INDEX IF EXISTS public.index_spree_orders_on_payment_status;
DROP INDEX IF EXISTS public.index_spree_orders_on_order_group_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_number;
DROP INDEX IF EXISTS public.index_spree_orders_on_market_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_gift_card_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_fulfillment_status;
DROP INDEX IF EXISTS public.index_spree_orders_on_customer_id_and_created_by_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_created_by_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_created_by_actor;
DROP INDEX IF EXISTS public.index_spree_orders_on_coupon_code;
DROP INDEX IF EXISTS public.index_spree_orders_on_considered_risky;
DROP INDEX IF EXISTS public.index_spree_orders_on_confirmation_delivered;
DROP INDEX IF EXISTS public.index_spree_orders_on_completed_at;
DROP INDEX IF EXISTS public.index_spree_orders_on_company_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_channel_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_canceler_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_canceler_actor;
DROP INDEX IF EXISTS public.index_spree_orders_on_cancel_reason_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_bill_address_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_approver_id;
DROP INDEX IF EXISTS public.index_spree_orders_on_approver_actor;
DROP INDEX IF EXISTS public.index_spree_order_routing_rules_on_type;
DROP INDEX IF EXISTS public.index_spree_order_routing_rules_on_store_id;
DROP INDEX IF EXISTS public.index_spree_order_routing_rules_on_channel_id_and_position;
DROP INDEX IF EXISTS public.index_spree_order_routing_rules_on_channel_id;
DROP INDEX IF EXISTS public.index_spree_order_promotions_on_promotion_id_and_order_id;
DROP INDEX IF EXISTS public.index_spree_order_promotions_on_promotion_id;
DROP INDEX IF EXISTS public.index_spree_order_promotions_on_order_id;
DROP INDEX IF EXISTS public.index_spree_order_promotions_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_token;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_store_id_and_created_at;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_store_id;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_ship_address_id;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_number;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_confirmation_delivered;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_order_groups_on_bill_address_id;
DROP INDEX IF EXISTS public.index_spree_order_cancellation_reasons_on_store_id;
DROP INDEX IF EXISTS public.index_spree_option_values_on_position;
DROP INDEX IF EXISTS public.index_spree_option_values_on_option_type_id_and_name;
DROP INDEX IF EXISTS public.index_spree_option_values_on_option_type_id;
DROP INDEX IF EXISTS public.index_spree_option_values_on_name;
DROP INDEX IF EXISTS public.index_spree_option_value_variants_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_option_value_variants_on_option_value_id;
DROP INDEX IF EXISTS public.index_spree_option_value_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_option_types_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_option_types_on_store_id;
DROP INDEX IF EXISTS public.index_spree_option_types_on_position;
DROP INDEX IF EXISTS public.index_spree_option_types_on_kind;
DROP INDEX IF EXISTS public.index_spree_option_types_on_filterable;
DROP INDEX IF EXISTS public.index_spree_option_type_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_number_sequences_on_store_id;
DROP INDEX IF EXISTS public.index_spree_number_sequences_on_store_and_resource;
DROP INDEX IF EXISTS public.index_spree_newsletter_subscribers_on_verified_at;
DROP INDEX IF EXISTS public.index_spree_newsletter_subscribers_on_verification_token;
DROP INDEX IF EXISTS public.index_spree_newsletter_subscribers_on_store_id;
DROP INDEX IF EXISTS public.index_spree_newsletter_subscribers_on_email_and_store_id;
DROP INDEX IF EXISTS public.index_spree_newsletter_subscribers_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_metafields_on_resource;
DROP INDEX IF EXISTS public.index_spree_media_on_store_id;
DROP INDEX IF EXISTS public.index_spree_media_on_position;
DROP INDEX IF EXISTS public.index_spree_media_on_media_type;
DROP INDEX IF EXISTS public.index_spree_markets_on_store_id_and_position;
DROP INDEX IF EXISTS public.index_spree_markets_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_markets_on_store_id_and_default;
DROP INDEX IF EXISTS public.index_spree_markets_on_store_id;
DROP INDEX IF EXISTS public.index_spree_markets_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_market_countries_on_market_id_and_country_id;
DROP INDEX IF EXISTS public.index_spree_market_countries_on_market_id_and_country_code;
DROP INDEX IF EXISTS public.index_spree_market_countries_on_market_id;
DROP INDEX IF EXISTS public.index_spree_market_countries_on_country_id;
DROP INDEX IF EXISTS public.index_spree_log_entries_on_source_id_and_source_type;
DROP INDEX IF EXISTS public.index_spree_line_items_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_line_items_on_tax_category_id;
DROP INDEX IF EXISTS public.index_spree_line_items_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_line_items_on_price_list_id;
DROP INDEX IF EXISTS public.index_spree_line_items_on_order_id;
DROP INDEX IF EXISTS public.index_spree_line_items_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_invitations_on_token;
DROP INDEX IF EXISTS public.index_spree_invitations_on_status;
DROP INDEX IF EXISTS public.index_spree_invitations_on_role_id;
DROP INDEX IF EXISTS public.index_spree_invitations_on_resource;
DROP INDEX IF EXISTS public.index_spree_invitations_on_inviter;
DROP INDEX IF EXISTS public.index_spree_invitations_on_invitee;
DROP INDEX IF EXISTS public.index_spree_invitations_on_expires_at;
DROP INDEX IF EXISTS public.index_spree_invitations_on_email;
DROP INDEX IF EXISTS public.index_spree_invitations_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_integrations_on_type;
DROP INDEX IF EXISTS public.index_spree_integrations_on_store_id_and_type;
DROP INDEX IF EXISTS public.index_spree_integrations_on_store_id;
DROP INDEX IF EXISTS public.index_spree_integrations_on_active;
DROP INDEX IF EXISTS public.index_spree_imports_on_user_id;
DROP INDEX IF EXISTS public.index_spree_imports_on_type;
DROP INDEX IF EXISTS public.index_spree_imports_on_store_id_and_seller_id;
DROP INDEX IF EXISTS public.index_spree_imports_on_store_id;
DROP INDEX IF EXISTS public.index_spree_imports_on_status;
DROP INDEX IF EXISTS public.index_spree_imports_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_imports_on_owner;
DROP INDEX IF EXISTS public.index_spree_imports_on_number;
DROP INDEX IF EXISTS public.index_spree_import_rows_on_status;
DROP INDEX IF EXISTS public.index_spree_import_rows_on_item;
DROP INDEX IF EXISTS public.index_spree_import_rows_on_import_id_and_status;
DROP INDEX IF EXISTS public.index_spree_import_rows_on_import_id_and_row_number;
DROP INDEX IF EXISTS public.index_spree_import_rows_on_import_id;
DROP INDEX IF EXISTS public.index_spree_import_mappings_on_import_id_and_schema_field;
DROP INDEX IF EXISTS public.index_spree_import_mappings_on_import_id;
DROP INDEX IF EXISTS public.index_spree_import_mappings_on_file_column;
DROP INDEX IF EXISTS public.index_spree_gift_cards_on_store_id;
DROP INDEX IF EXISTS public.index_spree_gift_cards_on_status;
DROP INDEX IF EXISTS public.index_spree_gift_cards_on_redeemed_at;
DROP INDEX IF EXISTS public.index_spree_gift_cards_on_gift_card_batch_id;
DROP INDEX IF EXISTS public.index_spree_gift_cards_on_expires_at;
DROP INDEX IF EXISTS public.index_spree_gift_cards_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_gift_cards_on_created_by_id;
DROP INDEX IF EXISTS public.index_spree_gift_cards_on_code;
DROP INDEX IF EXISTS public.index_spree_gift_card_batches_on_store_id;
DROP INDEX IF EXISTS public.index_spree_gift_card_batches_on_created_by_id;
DROP INDEX IF EXISTS public.index_spree_gateways_on_test_mode;
DROP INDEX IF EXISTS public.index_spree_gateways_on_active;
DROP INDEX IF EXISTS public.index_spree_gateway_customers_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_gateway_customers_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_fulfillments_on_tracking;
DROP INDEX IF EXISTS public.index_spree_fulfillments_on_stock_location_id;
DROP INDEX IF EXISTS public.index_spree_fulfillments_on_status;
DROP INDEX IF EXISTS public.index_spree_fulfillments_on_order_id;
DROP INDEX IF EXISTS public.index_spree_fulfillments_on_number;
DROP INDEX IF EXISTS public.index_spree_fulfillments_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_fulfillments_on_address_id;
DROP INDEX IF EXISTS public.index_spree_fulfillment_items_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_fulfillment_items_on_original_return_item_id;
DROP INDEX IF EXISTS public.index_spree_fulfillment_items_on_order_id;
DROP INDEX IF EXISTS public.index_spree_fulfillment_items_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_fulfillment_items_on_fulfillment_id;
DROP INDEX IF EXISTS public.index_spree_fees_on_order_id_and_kind;
DROP INDEX IF EXISTS public.index_spree_fees_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_fees_on_fulfillment_id;
DROP INDEX IF EXISTS public.index_spree_fees_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_exports_on_user_id;
DROP INDEX IF EXISTS public.index_spree_exports_on_store_id_and_seller_id;
DROP INDEX IF EXISTS public.index_spree_exports_on_store_id;
DROP INDEX IF EXISTS public.index_spree_exports_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_exports_on_number;
DROP INDEX IF EXISTS public.index_spree_exports_on_format;
DROP INDEX IF EXISTS public.index_spree_exchanges_on_store_id;
DROP INDEX IF EXISTS public.index_spree_exchanges_on_stock_location_id;
DROP INDEX IF EXISTS public.index_spree_exchanges_on_status;
DROP INDEX IF EXISTS public.index_spree_exchanges_on_reason_id;
DROP INDEX IF EXISTS public.index_spree_exchanges_on_order_id;
DROP INDEX IF EXISTS public.index_spree_exchanges_on_number;
DROP INDEX IF EXISTS public.index_spree_exchanges_on_created_by_id;
DROP INDEX IF EXISTS public.index_spree_exchanges_on_created_by_actor;
DROP INDEX IF EXISTS public.index_spree_exchange_line_items_on_original_variant_id;
DROP INDEX IF EXISTS public.index_spree_exchange_line_items_on_new_variant_id;
DROP INDEX IF EXISTS public.index_spree_exchange_line_items_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_exchange_line_items_on_fulfillment_item_id;
DROP INDEX IF EXISTS public.index_spree_exchange_line_items_on_exchange_id;
DROP INDEX IF EXISTS public.index_spree_discounts_on_promotion_id;
DROP INDEX IF EXISTS public.index_spree_discounts_on_promotion_action_id;
DROP INDEX IF EXISTS public.index_spree_discounts_on_order_id;
DROP INDEX IF EXISTS public.index_spree_discounts_on_line_item_id_and_kind;
DROP INDEX IF EXISTS public.index_spree_discounts_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_discounts_on_fulfillment_id;
DROP INDEX IF EXISTS public.index_spree_discounts_on_code;
DROP INDEX IF EXISTS public.index_spree_discounts_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_digital_links_on_token;
DROP INDEX IF EXISTS public.index_spree_digital_links_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_digital_links_on_digital_asset_id;
DROP INDEX IF EXISTS public.index_spree_digital_assets_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_delivery_zones_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_delivery_zones_on_store_id;
DROP INDEX IF EXISTS public.index_spree_delivery_zones_on_delivery_profile_id;
DROP INDEX IF EXISTS public.index_spree_delivery_zones_on_delivery_origin_group_id;
DROP INDEX IF EXISTS public.index_spree_delivery_zone_members_on_state_id;
DROP INDEX IF EXISTS public.index_spree_delivery_zone_members_on_delivery_zone_id;
DROP INDEX IF EXISTS public.index_spree_delivery_zone_members_on_country_id;
DROP INDEX IF EXISTS public.index_spree_delivery_zone_members_on_country_code;
DROP INDEX IF EXISTS public.index_spree_delivery_rates_on_tax_rate_id;
DROP INDEX IF EXISTS public.index_spree_delivery_rates_on_selected;
DROP INDEX IF EXISTS public.index_spree_delivery_rates_on_fulfillment_id;
DROP INDEX IF EXISTS public.index_spree_delivery_rates_on_delivery_method_id;
DROP INDEX IF EXISTS public.index_spree_delivery_profiles_on_type;
DROP INDEX IF EXISTS public.index_spree_delivery_profiles_on_store_id;
DROP INDEX IF EXISTS public.index_spree_delivery_profiles_on_name;
DROP INDEX IF EXISTS public.index_spree_delivery_origin_groups_on_delivery_profile_id;
DROP INDEX IF EXISTS public.index_spree_delivery_methods_on_tax_category_id;
DROP INDEX IF EXISTS public.index_spree_delivery_methods_on_store_id;
DROP INDEX IF EXISTS public.index_spree_delivery_methods_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_delivery_methods_on_delivery_zone_id;
DROP INDEX IF EXISTS public.index_spree_delivery_methods_on_delivery_profile_id;
DROP INDEX IF EXISTS public.index_spree_delivery_methods_on_delivery_origin_group_id;
DROP INDEX IF EXISTS public.index_spree_delivery_methods_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_delivery_method_services_on_delivery_method_id;
DROP INDEX IF EXISTS public.index_spree_delivery_method_rules_on_delivery_method_id;
DROP INDEX IF EXISTS public.index_spree_delivery_method_rule_products_on_product_id;
DROP INDEX IF EXISTS public.index_spree_deliveries_on_store_id_and_tracking_number;
DROP INDEX IF EXISTS public.index_spree_deliveries_on_store_id;
DROP INDEX IF EXISTS public.index_spree_deliveries_on_shipping_label_id;
DROP INDEX IF EXISTS public.index_spree_deliveries_on_owner_and_tracking_number;
DROP INDEX IF EXISTS public.index_spree_deliveries_on_owner;
DROP INDEX IF EXISTS public.index_spree_data_requests_on_store_id_and_number;
DROP INDEX IF EXISTS public.index_spree_data_requests_on_store_id;
DROP INDEX IF EXISTS public.index_spree_data_requests_on_requested_by_id;
DROP INDEX IF EXISTS public.index_spree_data_requests_on_download_token;
DROP INDEX IF EXISTS public.index_spree_data_requests_on_customer_kind_status;
DROP INDEX IF EXISTS public.index_spree_data_requests_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_data_feeds_on_store_id_and_slug_and_type;
DROP INDEX IF EXISTS public.index_spree_data_feeds_on_store_id_and_slug;
DROP INDEX IF EXISTS public.index_spree_data_feeds_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_data_feeds_on_store_id;
DROP INDEX IF EXISTS public.index_spree_customers_on_ship_address_id;
DROP INDEX IF EXISTS public.index_spree_customers_on_email;
DROP INDEX IF EXISTS public.index_spree_customers_on_bill_address_id;
DROP INDEX IF EXISTS public.index_spree_customers_on_anonymized_at;
DROP INDEX IF EXISTS public.index_spree_customers_on_accepts_email_marketing;
DROP INDEX IF EXISTS public.index_spree_customer_returns_on_store_id;
DROP INDEX IF EXISTS public.index_spree_customer_returns_on_stock_location_id;
DROP INDEX IF EXISTS public.index_spree_customer_returns_on_number;
DROP INDEX IF EXISTS public.index_spree_customer_groups_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_customer_groups_on_store_id;
DROP INDEX IF EXISTS public.index_spree_customer_groups_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_customer_group_users_unique;
DROP INDEX IF EXISTS public.index_spree_customer_group_users_on_user;
DROP INDEX IF EXISTS public.index_spree_customer_group_users_on_customer_group_id;
DROP INDEX IF EXISTS public.index_spree_custom_fields_on_type;
DROP INDEX IF EXISTS public.index_spree_custom_fields_on_custom_field_definition_id;
DROP INDEX IF EXISTS public.index_spree_custom_field_definitions_on_store_id;
DROP INDEX IF EXISTS public.index_spree_custom_field_definitions_on_resource_type;
DROP INDEX IF EXISTS public.index_spree_custom_field_definitions_on_namespace_and_key;
DROP INDEX IF EXISTS public.index_spree_custom_domains_on_url;
DROP INDEX IF EXISTS public.index_spree_custom_domains_on_store_id;
DROP INDEX IF EXISTS public.index_spree_credit_cards_unique_fingerprint;
DROP INDEX IF EXISTS public.index_spree_credit_cards_on_payment_method_id;
DROP INDEX IF EXISTS public.index_spree_credit_cards_on_gateway_customer_id;
DROP INDEX IF EXISTS public.index_spree_credit_cards_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_credit_cards_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_credit_cards_on_address_id;
DROP INDEX IF EXISTS public.index_spree_coupon_codes_on_state;
DROP INDEX IF EXISTS public.index_spree_coupon_codes_on_promotion_id;
DROP INDEX IF EXISTS public.index_spree_coupon_codes_on_order_id;
DROP INDEX IF EXISTS public.index_spree_coupon_codes_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_coupon_codes_on_code;
DROP INDEX IF EXISTS public.index_spree_coupon_codes_on_cart_id;
DROP INDEX IF EXISTS public.index_spree_countries_on_name;
DROP INDEX IF EXISTS public.index_spree_countries_on_iso_name;
DROP INDEX IF EXISTS public.index_spree_countries_on_iso3;
DROP INDEX IF EXISTS public.index_spree_countries_on_iso;
DROP INDEX IF EXISTS public.index_spree_consent_records_on_store_purpose_recorded;
DROP INDEX IF EXISTS public.index_spree_consent_records_on_store_id;
DROP INDEX IF EXISTS public.index_spree_consent_records_on_owner;
DROP INDEX IF EXISTS public.index_spree_consent_records_on_lower_email;
DROP INDEX IF EXISTS public.index_spree_company_memberships_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_company_memberships_on_company_id;
DROP INDEX IF EXISTS public.index_spree_company_invitations_on_token;
DROP INDEX IF EXISTS public.index_spree_company_invitations_on_inviter_id;
DROP INDEX IF EXISTS public.index_spree_company_invitations_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_company_invitations_on_company_id_and_email;
DROP INDEX IF EXISTS public.index_spree_company_invitations_on_company_id;
DROP INDEX IF EXISTS public.index_spree_companies_on_store_id;
DROP INDEX IF EXISTS public.index_spree_companies_on_parent_id;
DROP INDEX IF EXISTS public.index_spree_commission_rules_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_commission_rules_on_commission_rate_id;
DROP INDEX IF EXISTS public.index_spree_commission_rule_products_on_product_id;
DROP INDEX IF EXISTS public.index_spree_commission_rule_products_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_commission_rule_products_on_commission_rule_id;
DROP INDEX IF EXISTS public.index_spree_commission_rates_on_store_id_and_code;
DROP INDEX IF EXISTS public.index_spree_commission_rates_on_store_id;
DROP INDEX IF EXISTS public.index_spree_commission_rates_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_commission_rate_values_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_commission_rate_values_on_commission_rate_id;
DROP INDEX IF EXISTS public.index_spree_commission_lines_on_taxability_reason;
DROP INDEX IF EXISTS public.index_spree_commission_lines_on_seller_id_and_created_at;
DROP INDEX IF EXISTS public.index_spree_commission_lines_on_seller_id;
DROP INDEX IF EXISTS public.index_spree_commission_lines_on_order_id;
DROP INDEX IF EXISTS public.index_spree_commission_lines_on_country_code_and_state_code;
DROP INDEX IF EXISTS public.index_spree_commission_lines_on_commission_rate_id;
DROP INDEX IF EXISTS public.index_spree_collections_on_store_id_and_permalink;
DROP INDEX IF EXISTS public.index_spree_collections_on_store_id;
DROP INDEX IF EXISTS public.index_spree_collection_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_collection_rules_on_collection_id_and_type;
DROP INDEX IF EXISTS public.index_spree_collection_rules_on_collection_id;
DROP INDEX IF EXISTS public.index_spree_claims_on_store_id;
DROP INDEX IF EXISTS public.index_spree_claims_on_status;
DROP INDEX IF EXISTS public.index_spree_claims_on_reason_id;
DROP INDEX IF EXISTS public.index_spree_claims_on_order_id;
DROP INDEX IF EXISTS public.index_spree_claims_on_number;
DROP INDEX IF EXISTS public.index_spree_claims_on_created_by_id;
DROP INDEX IF EXISTS public.index_spree_claims_on_created_by_actor;
DROP INDEX IF EXISTS public.index_spree_claim_reasons_on_store_id_and_name;
DROP INDEX IF EXISTS public.index_spree_claim_reasons_on_store_id;
DROP INDEX IF EXISTS public.index_spree_claim_line_items_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_claim_line_items_on_replacement_variant_id;
DROP INDEX IF EXISTS public.index_spree_claim_line_items_on_line_item_id;
DROP INDEX IF EXISTS public.index_spree_claim_line_items_on_claim_id;
DROP INDEX IF EXISTS public.index_spree_channels_on_store_id_and_code;
DROP INDEX IF EXISTS public.index_spree_channels_on_store_id;
DROP INDEX IF EXISTS public.index_spree_channels_on_default_catalog_id;
DROP INDEX IF EXISTS public.index_spree_channels_default_per_store;
DROP INDEX IF EXISTS public.index_spree_channel_stock_locations_on_stock_location_id;
DROP INDEX IF EXISTS public.index_spree_channel_stock_locations_on_channel_id;
DROP INDEX IF EXISTS public.index_spree_category_translations_on_pretty_name;
DROP INDEX IF EXISTS public.index_spree_category_translations_on_locale;
DROP INDEX IF EXISTS public.index_spree_categories_on_store_id;
DROP INDEX IF EXISTS public.index_spree_categories_on_rgt;
DROP INDEX IF EXISTS public.index_spree_categories_on_products_count;
DROP INDEX IF EXISTS public.index_spree_categories_on_pretty_name;
DROP INDEX IF EXISTS public.index_spree_categories_on_position;
DROP INDEX IF EXISTS public.index_spree_categories_on_permalink_and_store_id;
DROP INDEX IF EXISTS public.index_spree_categories_on_name;
DROP INDEX IF EXISTS public.index_spree_categories_on_lft;
DROP INDEX IF EXISTS public.index_spree_categories_on_children_count;
DROP INDEX IF EXISTS public.index_spree_catalogs_on_store_id;
DROP INDEX IF EXISTS public.index_spree_catalog_quantity_rules_on_variant_id;
DROP INDEX IF EXISTS public.index_spree_catalog_products_on_product_id;
DROP INDEX IF EXISTS public.index_spree_catalog_products_on_catalog_id;
DROP INDEX IF EXISTS public.index_spree_catalog_assignments_on_catalog_id;
DROP INDEX IF EXISTS public.index_spree_catalog_assignments_on_assignable;
DROP INDEX IF EXISTS public.index_spree_carts_on_updated_at;
DROP INDEX IF EXISTS public.index_spree_carts_on_token;
DROP INDEX IF EXISTS public.index_spree_carts_on_store_id_and_created_at;
DROP INDEX IF EXISTS public.index_spree_carts_on_store_id;
DROP INDEX IF EXISTS public.index_spree_carts_on_market_id;
DROP INDEX IF EXISTS public.index_spree_carts_on_gift_card_id;
DROP INDEX IF EXISTS public.index_spree_carts_on_customer_id;
DROP INDEX IF EXISTS public.index_spree_carts_on_completed_at;
DROP INDEX IF EXISTS public.index_spree_carts_on_company_id;
DROP INDEX IF EXISTS public.index_spree_carts_on_channel_id;
DROP INDEX IF EXISTS public.index_spree_calculators_on_id_and_type;
DROP INDEX IF EXISTS public.index_spree_calculators_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_calculators_on_calculable_id_and_calculable_type;
DROP INDEX IF EXISTS public.index_spree_brands_on_store_id_and_slug;
DROP INDEX IF EXISTS public.index_spree_brands_on_store_id;
DROP INDEX IF EXISTS public.index_spree_brands_on_name;
DROP INDEX IF EXISTS public.index_spree_api_keys_on_token_digest;
DROP INDEX IF EXISTS public.index_spree_api_keys_on_token;
DROP INDEX IF EXISTS public.index_spree_api_keys_on_store_id_and_key_type;
DROP INDEX IF EXISTS public.index_spree_api_keys_on_store_id;
DROP INDEX IF EXISTS public.index_spree_api_keys_on_revoked_by;
DROP INDEX IF EXISTS public.index_spree_api_keys_on_key_type;
DROP INDEX IF EXISTS public.index_spree_api_keys_on_created_by;
DROP INDEX IF EXISTS public.index_spree_api_keys_on_channel_id;
DROP INDEX IF EXISTS public.index_spree_allowed_origins_on_store_id_and_origin;
DROP INDEX IF EXISTS public.index_spree_allowed_origins_on_store_id;
DROP INDEX IF EXISTS public.index_spree_admin_users_on_email;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_source_type;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_source_id_and_source_type;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_order_id_and_state;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_order_id;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_order_eligible_source_type;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_eligible;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_amount;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_adjustable_id_and_adjustable_type;
DROP INDEX IF EXISTS public.index_spree_adjustments_on_adjustable_and_source_type;
DROP INDEX IF EXISTS public.index_spree_addresses_on_state_id;
DROP INDEX IF EXISTS public.index_spree_addresses_on_quick_checkout;
DROP INDEX IF EXISTS public.index_spree_addresses_on_owner;
DROP INDEX IF EXISTS public.index_spree_addresses_on_deleted_at;
DROP INDEX IF EXISTS public.index_spree_addresses_on_country_id;
DROP INDEX IF EXISTS public.index_spree_addresses_on_country_code;
DROP INDEX IF EXISTS public.index_solid_queue_semaphores_on_key_and_value;
DROP INDEX IF EXISTS public.index_solid_queue_semaphores_on_key;
DROP INDEX IF EXISTS public.index_solid_queue_semaphores_on_expires_at;
DROP INDEX IF EXISTS public.index_solid_queue_scheduled_executions_on_job_id;
DROP INDEX IF EXISTS public.index_solid_queue_recurring_tasks_on_static;
DROP INDEX IF EXISTS public.index_solid_queue_recurring_tasks_on_key;
DROP INDEX IF EXISTS public.index_solid_queue_recurring_executions_on_task_key_and_run_at;
DROP INDEX IF EXISTS public.index_solid_queue_recurring_executions_on_job_id;
DROP INDEX IF EXISTS public.index_solid_queue_ready_executions_on_job_id;
DROP INDEX IF EXISTS public.index_solid_queue_processes_on_supervisor_id;
DROP INDEX IF EXISTS public.index_solid_queue_processes_on_name_and_supervisor_id;
DROP INDEX IF EXISTS public.index_solid_queue_processes_on_last_heartbeat_at;
DROP INDEX IF EXISTS public.index_solid_queue_poll_by_queue;
DROP INDEX IF EXISTS public.index_solid_queue_poll_all;
DROP INDEX IF EXISTS public.index_solid_queue_pauses_on_queue_name;
DROP INDEX IF EXISTS public.index_solid_queue_jobs_on_finished_at;
DROP INDEX IF EXISTS public.index_solid_queue_jobs_on_class_name;
DROP INDEX IF EXISTS public.index_solid_queue_jobs_on_active_job_id;
DROP INDEX IF EXISTS public.index_solid_queue_jobs_for_filtering;
DROP INDEX IF EXISTS public.index_solid_queue_jobs_for_alerting;
DROP INDEX IF EXISTS public.index_solid_queue_failed_executions_on_job_id;
DROP INDEX IF EXISTS public.index_solid_queue_dispatch_all;
DROP INDEX IF EXISTS public.index_solid_queue_claimed_executions_on_process_id_and_job_id;
DROP INDEX IF EXISTS public.index_solid_queue_claimed_executions_on_job_id;
DROP INDEX IF EXISTS public.index_solid_queue_blocked_executions_on_job_id;
DROP INDEX IF EXISTS public.index_solid_queue_blocked_executions_for_release;
DROP INDEX IF EXISTS public.index_solid_queue_blocked_executions_for_maintenance;
DROP INDEX IF EXISTS public.index_solid_cache_entries_on_key_hash_and_byte_size;
DROP INDEX IF EXISTS public.index_solid_cache_entries_on_key_hash;
DROP INDEX IF EXISTS public.index_solid_cache_entries_on_byte_size;
DROP INDEX IF EXISTS public.index_solid_cable_messages_on_created_at;
DROP INDEX IF EXISTS public.index_solid_cable_messages_on_channel_hash;
DROP INDEX IF EXISTS public.index_solid_cable_messages_on_channel;
DROP INDEX IF EXISTS public.index_seller_translations_on_seller_and_locale;
DROP INDEX IF EXISTS public.index_seller_transfers_on_seller_and_settled_currency;
DROP INDEX IF EXISTS public.index_seller_transfers_on_refund;
DROP INDEX IF EXISTS public.index_seller_transfers_on_provider_reference;
DROP INDEX IF EXISTS public.index_seller_transfers_on_order_earning;
DROP INDEX IF EXISTS public.index_seller_requirement_submissions_on_pair_and_date;
DROP INDEX IF EXISTS public.index_seller_payouts_on_provider_reference;
DROP INDEX IF EXISTS public.index_return_items_on_customer_return_id;
DROP INDEX IF EXISTS public.index_return_authorizations_on_return_authorization_reason_id;
DROP INDEX IF EXISTS public.index_reimbursement_credits_on_creditable_id_and_type;
DROP INDEX IF EXISTS public.index_refunds_on_refund_reason_id;
DROP INDEX IF EXISTS public.index_promotion_rules_users_on_user_id_and_promotion_rule_id;
DROP INDEX IF EXISTS public.index_promotion_rules_users_on_promotion_rule_id;
DROP INDEX IF EXISTS public.index_promotion_rules_on_user_id;
DROP INDEX IF EXISTS public.index_promotion_rules_on_product_group_id;
DROP INDEX IF EXISTS public.index_products_stores_on_store_and_units_sold;
DROP INDEX IF EXISTS public.index_products_stores_on_store_and_revenue;
DROP INDEX IF EXISTS public.index_products_promotion_rules_on_promotion_rule_and_product;
DROP INDEX IF EXISTS public.index_products_promotion_rules_on_product_id;
DROP INDEX IF EXISTS public.index_product_type_translations_on_product_type_and_locale;
DROP INDEX IF EXISTS public.index_product_type_categories_uniqueness;
DROP INDEX IF EXISTS public.index_product_type_categories_on_category_id;
DROP INDEX IF EXISTS public.index_product_collections_on_collection_and_product;
DROP INDEX IF EXISTS public.index_payment_sources_on_type_and_gateway_payment_profile_id;
DROP INDEX IF EXISTS public.index_payment_methods_webhook_keys_on_webhook_key_id;
DROP INDEX IF EXISTS public.index_payment_methods_webhook_keys_on_payment_method_id;
DROP INDEX IF EXISTS public.index_payment_method_id_webhook_key_id_uniqueness;
DROP INDEX IF EXISTS public.index_option_values_variants_on_variant_id_and_option_value_id;
DROP INDEX IF EXISTS public.index_option_type_product_types_uniqueness;
DROP INDEX IF EXISTS public.index_option_type_product_types_on_option_type_id;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_unique;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_sluggable_type;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_sluggable_id;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_slug_and_sluggable_type_and_locale;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_locale;
DROP INDEX IF EXISTS public.index_friendly_id_slugs_on_deleted_at;
DROP INDEX IF EXISTS public.index_custom_fields_on_resource_and_definition;
DROP INDEX IF EXISTS public.index_custom_field_definitions_on_store_and_key;
DROP INDEX IF EXISTS public.index_custom_field_definitions_on_store_and_filter_key;
DROP INDEX IF EXISTS public.index_commission_rules_on_rate_and_type;
DROP INDEX IF EXISTS public.index_commission_rule_products_on_rule_and_product;
DROP INDEX IF EXISTS public.index_commission_rate_values_on_rate_and_currency;
DROP INDEX IF EXISTS public.index_commission_lines_on_line_item;
DROP INDEX IF EXISTS public.index_commission_lines_on_fulfillment;
DROP INDEX IF EXISTS public.index_collection_translations_on_collection_and_locale;
DROP INDEX IF EXISTS public.index_assets_on_viewable_type_and_type;
DROP INDEX IF EXISTS public.index_assets_on_viewable_id;
DROP INDEX IF EXISTS public.index_addresses_on_last_name;
DROP INDEX IF EXISTS public.index_addresses_on_first_name;
DROP INDEX IF EXISTS public.index_active_storage_variant_records_uniqueness;
DROP INDEX IF EXISTS public.index_active_storage_blobs_on_key;
DROP INDEX IF EXISTS public.index_active_storage_attachments_uniqueness;
DROP INDEX IF EXISTS public.index_active_storage_attachments_on_blob_id;
DROP INDEX IF EXISTS public.index_action_text_rich_texts_uniqueness;
DROP INDEX IF EXISTS public.idx_variant_media_unique;
DROP INDEX IF EXISTS public.idx_variant_media_media;
DROP INDEX IF EXISTS public.idx_stock_transfer_items_unique;
DROP INDEX IF EXISTS public.idx_stock_reservations_level_line_item;
DROP INDEX IF EXISTS public.idx_spree_pss_unique_external_id_per_pm;
DROP INDEX IF EXISTS public.idx_spree_pss_on_payment_source;
DROP INDEX IF EXISTS public.idx_seller_requirement_custom_fields_uniqueness;
DROP INDEX IF EXISTS public.idx_refresh_tokens_user;
DROP INDEX IF EXISTS public.idx_purchase_order_items_unique;
DROP INDEX IF EXISTS public.idx_product_type_cf_defs_unique;
DROP INDEX IF EXISTS public.idx_price_histories_variant_currency_recorded;
DROP INDEX IF EXISTS public.idx_price_histories_recorded_at;
DROP INDEX IF EXISTS public.idx_price_histories_price_recorded;
DROP INDEX IF EXISTS public.idx_payments_order_method_response_code;
DROP INDEX IF EXISTS public.idx_payment_sessions_order_method_external;
DROP INDEX IF EXISTS public.idx_order_routing_rules_lookup;
DROP INDEX IF EXISTS public.idx_order_routing_rules_channel_type;
DROP INDEX IF EXISTS public.idx_order_cancellation_reasons_on_store_and_name;
DROP INDEX IF EXISTS public.idx_on_store_id_enabled_position_2e416afa00;
DROP INDEX IF EXISTS public.idx_on_stock_location_id_74b70de887;
DROP INDEX IF EXISTS public.idx_on_stock_location_id_7029c947c2;
DROP INDEX IF EXISTS public.idx_on_stock_level_id_expires_at_e64b0c98f8;
DROP INDEX IF EXISTS public.idx_on_spree_category_id_locale_5fb02d0070;
DROP INDEX IF EXISTS public.idx_on_seller_requirement_id_9d30ae5c62;
DROP INDEX IF EXISTS public.idx_on_seller_id_currency_status_fefa3626f6;
DROP INDEX IF EXISTS public.idx_on_seller_id_currency_status_2cb0739591;
DROP INDEX IF EXISTS public.idx_on_promotion_action_id_variant_id_90d181a88a;
DROP INDEX IF EXISTS public.idx_on_product_id_promotion_rule_id_aaea0385c9;
DROP INDEX IF EXISTS public.idx_on_delivery_origin_group_id_01bd160cac;
DROP INDEX IF EXISTS public.idx_on_customer_id_promotion_rule_id_90bd732c00;
DROP INDEX IF EXISTS public.idx_on_customer_id_payment_method_id_75005644af;
DROP INDEX IF EXISTS public.idx_on_custom_field_definition_id_8b23a96514;
DROP INDEX IF EXISTS public.idx_on_custom_field_definition_id_7687001add;
DROP INDEX IF EXISTS public.idx_on_country_code_state_code_21132110e7;
DROP INDEX IF EXISTS public.idx_on_company_id_status_9f9c6d73b6;
DROP INDEX IF EXISTS public.idx_on_category_id_promotion_rule_id_530c96f872;
DROP INDEX IF EXISTS public.idx_external_references_on_resource_lookup;
DROP INDEX IF EXISTS public.idx_external_references_on_resource;
DROP INDEX IF EXISTS public.idx_external_references_on_external_id;
DROP INDEX IF EXISTS public.idx_delivery_origin_group_locations_uniqueness;
DROP INDEX IF EXISTS public.idx_delivery_method_stock_locations_uniqueness;
DROP INDEX IF EXISTS public.idx_delivery_method_services_uniqueness;
DROP INDEX IF EXISTS public.idx_delivery_method_rules_uniqueness;
DROP INDEX IF EXISTS public.idx_delivery_method_rule_products_uniqueness;
DROP INDEX IF EXISTS public.idx_company_memberships_on_company_and_customer;
DROP INDEX IF EXISTS public.idx_channel_stock_locations_uniqueness;
DROP INDEX IF EXISTS public.idx_catalog_quantity_rules_on_catalog_and_variant;
DROP INDEX IF EXISTS public.idx_catalog_products_on_catalog_and_product;
DROP INDEX IF EXISTS public.idx_catalog_order_minimums_on_catalog_and_currency;
DROP INDEX IF EXISTS public.idx_catalog_assignments_uniqueness;
ALTER TABLE IF EXISTS ONLY public.spree_zones DROP CONSTRAINT IF EXISTS spree_zones_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_zone_members DROP CONSTRAINT IF EXISTS spree_zone_members_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_wishlists DROP CONSTRAINT IF EXISTS spree_wishlists_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_wishlist_items DROP CONSTRAINT IF EXISTS spree_wishlist_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_webhook_endpoints DROP CONSTRAINT IF EXISTS spree_webhook_endpoints_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_webhook_deliveries DROP CONSTRAINT IF EXISTS spree_webhook_deliveries_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_variants DROP CONSTRAINT IF EXISTS spree_variants_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_variant_media DROP CONSTRAINT IF EXISTS spree_variant_media_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_users DROP CONSTRAINT IF EXISTS spree_users_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_user_identities DROP CONSTRAINT IF EXISTS spree_user_identities_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_trackers DROP CONSTRAINT IF EXISTS spree_trackers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_taxonomy_translations DROP CONSTRAINT IF EXISTS spree_taxonomy_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_taxonomies DROP CONSTRAINT IF EXISTS spree_taxonomies_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_taxon_rules DROP CONSTRAINT IF EXISTS spree_taxon_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_tax_rates DROP CONSTRAINT IF EXISTS spree_tax_rates_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_tax_lines DROP CONSTRAINT IF EXISTS spree_tax_lines_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_tax_identifiers DROP CONSTRAINT IF EXISTS spree_tax_identifiers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_tax_exemption_certificates DROP CONSTRAINT IF EXISTS spree_tax_exemption_certificates_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_tax_categories DROP CONSTRAINT IF EXISTS spree_tax_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_tags DROP CONSTRAINT IF EXISTS spree_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_taggings DROP CONSTRAINT IF EXISTS spree_taggings_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_suppliers DROP CONSTRAINT IF EXISTS spree_suppliers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stripe_webhook_keys DROP CONSTRAINT IF EXISTS spree_stripe_webhook_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stripe_payment_methods_webhook_keys DROP CONSTRAINT IF EXISTS spree_stripe_payment_methods_webhook_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stripe_payment_intents DROP CONSTRAINT IF EXISTS spree_stripe_payment_intents_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stores DROP CONSTRAINT IF EXISTS spree_stores_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_store_translations DROP CONSTRAINT IF EXISTS spree_store_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_store_credits DROP CONSTRAINT IF EXISTS spree_store_credits_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_store_credit_types DROP CONSTRAINT IF EXISTS spree_store_credit_types_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_store_credit_events DROP CONSTRAINT IF EXISTS spree_store_credit_events_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_store_credit_categories DROP CONSTRAINT IF EXISTS spree_store_credit_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stock_transfers DROP CONSTRAINT IF EXISTS spree_stock_transfers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stock_transfer_items DROP CONSTRAINT IF EXISTS spree_stock_transfer_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stock_reservations DROP CONSTRAINT IF EXISTS spree_stock_reservations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stock_receipts DROP CONSTRAINT IF EXISTS spree_stock_receipts_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stock_receipt_items DROP CONSTRAINT IF EXISTS spree_stock_receipt_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stock_movements DROP CONSTRAINT IF EXISTS spree_stock_movements_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stock_locations DROP CONSTRAINT IF EXISTS spree_stock_locations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_stock_levels DROP CONSTRAINT IF EXISTS spree_stock_levels_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_states DROP CONSTRAINT IF EXISTS spree_states_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_state_changes DROP CONSTRAINT IF EXISTS spree_state_changes_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_shipping_method_categories DROP CONSTRAINT IF EXISTS spree_shipping_method_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_shipping_labels DROP CONSTRAINT IF EXISTS spree_shipping_labels_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_sellers DROP CONSTRAINT IF EXISTS spree_sellers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_seller_translations DROP CONSTRAINT IF EXISTS spree_seller_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_seller_transfers DROP CONSTRAINT IF EXISTS spree_seller_transfers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_seller_requirements DROP CONSTRAINT IF EXISTS spree_seller_requirements_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_seller_requirement_submissions DROP CONSTRAINT IF EXISTS spree_seller_requirement_submissions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_seller_requirement_custom_fields DROP CONSTRAINT IF EXISTS spree_seller_requirement_custom_fields_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_seller_payouts DROP CONSTRAINT IF EXISTS spree_seller_payouts_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_saved_reports DROP CONSTRAINT IF EXISTS spree_saved_reports_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_roles DROP CONSTRAINT IF EXISTS spree_roles_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_role_users DROP CONSTRAINT IF EXISTS spree_role_users_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_returns DROP CONSTRAINT IF EXISTS spree_returns_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_return_reasons DROP CONSTRAINT IF EXISTS spree_return_reasons_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_return_line_items DROP CONSTRAINT IF EXISTS spree_return_line_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_return_items DROP CONSTRAINT IF EXISTS spree_return_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_return_authorizations DROP CONSTRAINT IF EXISTS spree_return_authorizations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_reports DROP CONSTRAINT IF EXISTS spree_reports_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_reimbursements DROP CONSTRAINT IF EXISTS spree_reimbursements_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_reimbursement_types DROP CONSTRAINT IF EXISTS spree_reimbursement_types_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_reimbursement_credits DROP CONSTRAINT IF EXISTS spree_reimbursement_credits_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_refunds DROP CONSTRAINT IF EXISTS spree_refunds_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_refund_reasons DROP CONSTRAINT IF EXISTS spree_refund_reasons_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_refresh_tokens DROP CONSTRAINT IF EXISTS spree_refresh_tokens_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_purchase_orders DROP CONSTRAINT IF EXISTS spree_purchase_orders_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_purchase_order_items DROP CONSTRAINT IF EXISTS spree_purchase_order_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_promotions_stores DROP CONSTRAINT IF EXISTS spree_promotions_stores_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_promotions DROP CONSTRAINT IF EXISTS spree_promotions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_promotion_rules DROP CONSTRAINT IF EXISTS spree_promotion_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_promotion_rule_users DROP CONSTRAINT IF EXISTS spree_promotion_rule_users_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_promotion_rule_categories DROP CONSTRAINT IF EXISTS spree_promotion_rule_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_promotion_categories DROP CONSTRAINT IF EXISTS spree_promotion_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_promotion_actions DROP CONSTRAINT IF EXISTS spree_promotion_actions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_promotion_action_line_items DROP CONSTRAINT IF EXISTS spree_promotion_action_line_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_products_stores DROP CONSTRAINT IF EXISTS spree_products_stores_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_products DROP CONSTRAINT IF EXISTS spree_products_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_types DROP CONSTRAINT IF EXISTS spree_product_types_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_type_translations DROP CONSTRAINT IF EXISTS spree_product_type_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_type_custom_field_definitions DROP CONSTRAINT IF EXISTS spree_product_type_custom_field_definitions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_type_categories DROP CONSTRAINT IF EXISTS spree_product_type_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_translations DROP CONSTRAINT IF EXISTS spree_product_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_submissions DROP CONSTRAINT IF EXISTS spree_product_submissions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_publications DROP CONSTRAINT IF EXISTS spree_product_publications_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_promotion_rules DROP CONSTRAINT IF EXISTS spree_product_promotion_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_option_types DROP CONSTRAINT IF EXISTS spree_product_option_types_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_collections DROP CONSTRAINT IF EXISTS spree_product_collections_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_product_categories DROP CONSTRAINT IF EXISTS spree_product_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_prices DROP CONSTRAINT IF EXISTS spree_prices_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_price_rules DROP CONSTRAINT IF EXISTS spree_price_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_price_lists DROP CONSTRAINT IF EXISTS spree_price_lists_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_price_histories DROP CONSTRAINT IF EXISTS spree_price_histories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_price_adjustment_tiers DROP CONSTRAINT IF EXISTS spree_price_adjustment_tiers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_preferences DROP CONSTRAINT IF EXISTS spree_preferences_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_policy_translations DROP CONSTRAINT IF EXISTS spree_policy_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_policies DROP CONSTRAINT IF EXISTS spree_policies_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_paypal_checkout_orders DROP CONSTRAINT IF EXISTS spree_paypal_checkout_orders_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_payments DROP CONSTRAINT IF EXISTS spree_payments_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_payment_splits DROP CONSTRAINT IF EXISTS spree_payment_splits_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_payment_sources DROP CONSTRAINT IF EXISTS spree_payment_sources_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_payment_setup_sessions DROP CONSTRAINT IF EXISTS spree_payment_setup_sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_payment_sessions DROP CONSTRAINT IF EXISTS spree_payment_sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_payment_methods DROP CONSTRAINT IF EXISTS spree_payment_methods_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_payment_capture_events DROP CONSTRAINT IF EXISTS spree_payment_capture_events_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_package_types DROP CONSTRAINT IF EXISTS spree_package_types_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_orders DROP CONSTRAINT IF EXISTS spree_orders_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_order_routing_rules DROP CONSTRAINT IF EXISTS spree_order_routing_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_order_promotions DROP CONSTRAINT IF EXISTS spree_order_promotions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_order_groups DROP CONSTRAINT IF EXISTS spree_order_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_order_cancellation_reasons DROP CONSTRAINT IF EXISTS spree_order_cancellation_reasons_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_option_values DROP CONSTRAINT IF EXISTS spree_option_values_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_option_value_variants DROP CONSTRAINT IF EXISTS spree_option_value_variants_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_option_value_translations DROP CONSTRAINT IF EXISTS spree_option_value_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_option_types DROP CONSTRAINT IF EXISTS spree_option_types_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_option_type_translations DROP CONSTRAINT IF EXISTS spree_option_type_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_option_type_product_types DROP CONSTRAINT IF EXISTS spree_option_type_product_types_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_number_sequences DROP CONSTRAINT IF EXISTS spree_number_sequences_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_newsletter_subscribers DROP CONSTRAINT IF EXISTS spree_newsletter_subscribers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_media DROP CONSTRAINT IF EXISTS spree_media_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_markets DROP CONSTRAINT IF EXISTS spree_markets_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_market_countries DROP CONSTRAINT IF EXISTS spree_market_countries_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_log_entries DROP CONSTRAINT IF EXISTS spree_log_entries_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_line_items DROP CONSTRAINT IF EXISTS spree_line_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_invitations DROP CONSTRAINT IF EXISTS spree_invitations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_integrations DROP CONSTRAINT IF EXISTS spree_integrations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_imports DROP CONSTRAINT IF EXISTS spree_imports_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_import_rows DROP CONSTRAINT IF EXISTS spree_import_rows_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_import_mappings DROP CONSTRAINT IF EXISTS spree_import_mappings_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_gift_cards DROP CONSTRAINT IF EXISTS spree_gift_cards_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_gift_card_batches DROP CONSTRAINT IF EXISTS spree_gift_card_batches_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_gateways DROP CONSTRAINT IF EXISTS spree_gateways_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_gateway_customers DROP CONSTRAINT IF EXISTS spree_gateway_customers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_fulfillments DROP CONSTRAINT IF EXISTS spree_fulfillments_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_fulfillment_items DROP CONSTRAINT IF EXISTS spree_fulfillment_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_fees DROP CONSTRAINT IF EXISTS spree_fees_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_external_references DROP CONSTRAINT IF EXISTS spree_external_references_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_exports DROP CONSTRAINT IF EXISTS spree_exports_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_exchanges DROP CONSTRAINT IF EXISTS spree_exchanges_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_exchange_line_items DROP CONSTRAINT IF EXISTS spree_exchange_line_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_discounts DROP CONSTRAINT IF EXISTS spree_discounts_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_digital_links DROP CONSTRAINT IF EXISTS spree_digital_links_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_digital_assets DROP CONSTRAINT IF EXISTS spree_digital_assets_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_zones DROP CONSTRAINT IF EXISTS spree_delivery_zones_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_zone_members DROP CONSTRAINT IF EXISTS spree_delivery_zone_members_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_rates DROP CONSTRAINT IF EXISTS spree_delivery_rates_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_profiles DROP CONSTRAINT IF EXISTS spree_delivery_profiles_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_origin_groups DROP CONSTRAINT IF EXISTS spree_delivery_origin_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_origin_group_locations DROP CONSTRAINT IF EXISTS spree_delivery_origin_group_locations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_methods DROP CONSTRAINT IF EXISTS spree_delivery_methods_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_method_stock_locations DROP CONSTRAINT IF EXISTS spree_delivery_method_stock_locations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_method_services DROP CONSTRAINT IF EXISTS spree_delivery_method_services_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_method_rules DROP CONSTRAINT IF EXISTS spree_delivery_method_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_delivery_method_rule_products DROP CONSTRAINT IF EXISTS spree_delivery_method_rule_products_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_deliveries DROP CONSTRAINT IF EXISTS spree_deliveries_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_data_requests DROP CONSTRAINT IF EXISTS spree_data_requests_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_data_feeds DROP CONSTRAINT IF EXISTS spree_data_feeds_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_customers DROP CONSTRAINT IF EXISTS spree_customers_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_customer_returns DROP CONSTRAINT IF EXISTS spree_customer_returns_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_customer_groups DROP CONSTRAINT IF EXISTS spree_customer_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_customer_group_users DROP CONSTRAINT IF EXISTS spree_customer_group_users_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_custom_fields DROP CONSTRAINT IF EXISTS spree_custom_fields_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_custom_field_definitions DROP CONSTRAINT IF EXISTS spree_custom_field_definitions_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_custom_domains DROP CONSTRAINT IF EXISTS spree_custom_domains_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_credit_cards DROP CONSTRAINT IF EXISTS spree_credit_cards_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_coupon_codes DROP CONSTRAINT IF EXISTS spree_coupon_codes_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_countries DROP CONSTRAINT IF EXISTS spree_countries_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_consolidated_metadata_tables DROP CONSTRAINT IF EXISTS spree_consolidated_metadata_tables_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_consent_records DROP CONSTRAINT IF EXISTS spree_consent_records_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_company_memberships DROP CONSTRAINT IF EXISTS spree_company_memberships_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_company_invitations DROP CONSTRAINT IF EXISTS spree_company_invitations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_companies DROP CONSTRAINT IF EXISTS spree_companies_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_commission_rules DROP CONSTRAINT IF EXISTS spree_commission_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_commission_rule_products DROP CONSTRAINT IF EXISTS spree_commission_rule_products_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_commission_rates DROP CONSTRAINT IF EXISTS spree_commission_rates_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_commission_rate_values DROP CONSTRAINT IF EXISTS spree_commission_rate_values_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_commission_lines DROP CONSTRAINT IF EXISTS spree_commission_lines_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_collections DROP CONSTRAINT IF EXISTS spree_collections_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_collection_translations DROP CONSTRAINT IF EXISTS spree_collection_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_collection_rules DROP CONSTRAINT IF EXISTS spree_collection_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_claims DROP CONSTRAINT IF EXISTS spree_claims_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_claim_reasons DROP CONSTRAINT IF EXISTS spree_claim_reasons_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_claim_line_items DROP CONSTRAINT IF EXISTS spree_claim_line_items_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_channels DROP CONSTRAINT IF EXISTS spree_channels_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_channel_stock_locations DROP CONSTRAINT IF EXISTS spree_channel_stock_locations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_category_translations DROP CONSTRAINT IF EXISTS spree_category_translations_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_categories DROP CONSTRAINT IF EXISTS spree_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_catalogs DROP CONSTRAINT IF EXISTS spree_catalogs_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_catalog_quantity_rules DROP CONSTRAINT IF EXISTS spree_catalog_quantity_rules_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_catalog_products DROP CONSTRAINT IF EXISTS spree_catalog_products_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_catalog_order_minimums DROP CONSTRAINT IF EXISTS spree_catalog_order_minimums_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_catalog_assignments DROP CONSTRAINT IF EXISTS spree_catalog_assignments_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_carts DROP CONSTRAINT IF EXISTS spree_carts_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_calculators DROP CONSTRAINT IF EXISTS spree_calculators_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_brands DROP CONSTRAINT IF EXISTS spree_brands_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_api_keys DROP CONSTRAINT IF EXISTS spree_api_keys_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_allowed_origins DROP CONSTRAINT IF EXISTS spree_allowed_origins_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_admin_users DROP CONSTRAINT IF EXISTS spree_admin_users_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_adjustments DROP CONSTRAINT IF EXISTS spree_adjustments_pkey;
ALTER TABLE IF EXISTS ONLY public.spree_addresses DROP CONSTRAINT IF EXISTS spree_addresses_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_semaphores DROP CONSTRAINT IF EXISTS solid_queue_semaphores_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_scheduled_executions DROP CONSTRAINT IF EXISTS solid_queue_scheduled_executions_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_recurring_tasks DROP CONSTRAINT IF EXISTS solid_queue_recurring_tasks_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_recurring_executions DROP CONSTRAINT IF EXISTS solid_queue_recurring_executions_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_ready_executions DROP CONSTRAINT IF EXISTS solid_queue_ready_executions_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_processes DROP CONSTRAINT IF EXISTS solid_queue_processes_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_pauses DROP CONSTRAINT IF EXISTS solid_queue_pauses_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_jobs DROP CONSTRAINT IF EXISTS solid_queue_jobs_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_failed_executions DROP CONSTRAINT IF EXISTS solid_queue_failed_executions_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_claimed_executions DROP CONSTRAINT IF EXISTS solid_queue_claimed_executions_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_queue_blocked_executions DROP CONSTRAINT IF EXISTS solid_queue_blocked_executions_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_cache_entries DROP CONSTRAINT IF EXISTS solid_cache_entries_pkey;
ALTER TABLE IF EXISTS ONLY public.solid_cable_messages DROP CONSTRAINT IF EXISTS solid_cable_messages_pkey;
ALTER TABLE IF EXISTS ONLY public.schema_migrations DROP CONSTRAINT IF EXISTS schema_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.friendly_id_slugs DROP CONSTRAINT IF EXISTS friendly_id_slugs_pkey;
ALTER TABLE IF EXISTS ONLY public.ar_internal_metadata DROP CONSTRAINT IF EXISTS ar_internal_metadata_pkey;
ALTER TABLE IF EXISTS ONLY public.active_storage_variant_records DROP CONSTRAINT IF EXISTS active_storage_variant_records_pkey;
ALTER TABLE IF EXISTS ONLY public.active_storage_blobs DROP CONSTRAINT IF EXISTS active_storage_blobs_pkey;
ALTER TABLE IF EXISTS ONLY public.active_storage_attachments DROP CONSTRAINT IF EXISTS active_storage_attachments_pkey;
ALTER TABLE IF EXISTS ONLY public.action_text_rich_texts DROP CONSTRAINT IF EXISTS action_text_rich_texts_pkey;
ALTER TABLE IF EXISTS public.spree_zones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_zone_members ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_wishlists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_wishlist_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_webhook_endpoints ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_webhook_deliveries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_variants ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_variant_media ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_user_identities ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_trackers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_taxonomy_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_taxonomies ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_taxon_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_tax_rates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_tax_lines ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_tax_identifiers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_tax_exemption_certificates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_tax_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_tags ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_taggings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_suppliers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stripe_webhook_keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stripe_payment_methods_webhook_keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stripe_payment_intents ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stores ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_store_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_store_credits ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_store_credit_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_store_credit_events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_store_credit_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stock_transfers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stock_transfer_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stock_reservations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stock_receipts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stock_receipt_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stock_movements ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stock_locations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_stock_levels ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_states ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_state_changes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_shipping_method_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_shipping_labels ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_sellers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_seller_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_seller_transfers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_seller_requirements ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_seller_requirement_submissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_seller_requirement_custom_fields ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_seller_payouts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_saved_reports ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_roles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_role_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_returns ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_return_reasons ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_return_line_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_return_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_return_authorizations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_reports ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_reimbursements ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_reimbursement_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_reimbursement_credits ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_refunds ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_refund_reasons ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_refresh_tokens ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_purchase_orders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_purchase_order_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_promotions_stores ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_promotions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_promotion_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_promotion_rule_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_promotion_rule_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_promotion_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_promotion_actions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_promotion_action_line_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_products_stores ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_type_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_type_custom_field_definitions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_type_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_submissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_publications ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_promotion_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_option_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_collections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_product_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_prices ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_price_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_price_lists ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_price_histories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_price_adjustment_tiers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_preferences ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_policy_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_policies ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_paypal_checkout_orders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_payments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_payment_splits ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_payment_sources ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_payment_setup_sessions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_payment_sessions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_payment_methods ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_payment_capture_events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_package_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_orders ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_order_routing_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_order_promotions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_order_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_order_cancellation_reasons ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_option_values ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_option_value_variants ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_option_value_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_option_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_option_type_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_option_type_product_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_number_sequences ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_newsletter_subscribers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_media ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_markets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_market_countries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_log_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_line_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_invitations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_integrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_imports ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_import_rows ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_import_mappings ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_gift_cards ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_gift_card_batches ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_gateways ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_gateway_customers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_fulfillments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_fulfillment_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_fees ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_external_references ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_exports ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_exchanges ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_exchange_line_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_discounts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_digital_links ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_digital_assets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_zones ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_zone_members ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_rates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_profiles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_origin_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_origin_group_locations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_methods ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_method_stock_locations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_method_services ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_method_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_delivery_method_rule_products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_deliveries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_data_requests ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_data_feeds ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_customers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_customer_returns ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_customer_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_customer_group_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_custom_fields ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_custom_field_definitions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_custom_domains ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_credit_cards ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_coupon_codes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_countries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_consolidated_metadata_tables ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_consent_records ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_company_memberships ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_company_invitations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_companies ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_commission_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_commission_rule_products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_commission_rates ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_commission_rate_values ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_commission_lines ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_collections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_collection_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_collection_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_claims ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_claim_reasons ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_claim_line_items ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_channels ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_channel_stock_locations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_category_translations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_categories ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_catalogs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_catalog_quantity_rules ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_catalog_products ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_catalog_order_minimums ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_catalog_assignments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_carts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_calculators ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_brands ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_api_keys ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_allowed_origins ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_admin_users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_adjustments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.spree_addresses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_semaphores ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_scheduled_executions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_recurring_tasks ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_recurring_executions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_ready_executions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_processes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_pauses ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_failed_executions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_claimed_executions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_queue_blocked_executions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_cache_entries ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.solid_cable_messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.friendly_id_slugs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.active_storage_variant_records ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.active_storage_blobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.active_storage_attachments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.action_text_rich_texts ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.spree_zones_id_seq;
DROP TABLE IF EXISTS public.spree_zones;
DROP SEQUENCE IF EXISTS public.spree_zone_members_id_seq;
DROP TABLE IF EXISTS public.spree_zone_members;
DROP SEQUENCE IF EXISTS public.spree_wishlists_id_seq;
DROP TABLE IF EXISTS public.spree_wishlists;
DROP SEQUENCE IF EXISTS public.spree_wishlist_items_id_seq;
DROP TABLE IF EXISTS public.spree_wishlist_items;
DROP SEQUENCE IF EXISTS public.spree_webhook_endpoints_id_seq;
DROP TABLE IF EXISTS public.spree_webhook_endpoints;
DROP SEQUENCE IF EXISTS public.spree_webhook_deliveries_id_seq;
DROP TABLE IF EXISTS public.spree_webhook_deliveries;
DROP SEQUENCE IF EXISTS public.spree_variants_id_seq;
DROP TABLE IF EXISTS public.spree_variants;
DROP SEQUENCE IF EXISTS public.spree_variant_media_id_seq;
DROP TABLE IF EXISTS public.spree_variant_media;
DROP SEQUENCE IF EXISTS public.spree_users_id_seq;
DROP TABLE IF EXISTS public.spree_users;
DROP SEQUENCE IF EXISTS public.spree_user_identities_id_seq;
DROP TABLE IF EXISTS public.spree_user_identities;
DROP SEQUENCE IF EXISTS public.spree_trackers_id_seq;
DROP TABLE IF EXISTS public.spree_trackers;
DROP SEQUENCE IF EXISTS public.spree_taxonomy_translations_id_seq;
DROP TABLE IF EXISTS public.spree_taxonomy_translations;
DROP SEQUENCE IF EXISTS public.spree_taxonomies_id_seq;
DROP TABLE IF EXISTS public.spree_taxonomies;
DROP SEQUENCE IF EXISTS public.spree_taxon_rules_id_seq;
DROP TABLE IF EXISTS public.spree_taxon_rules;
DROP SEQUENCE IF EXISTS public.spree_tax_rates_id_seq;
DROP TABLE IF EXISTS public.spree_tax_rates;
DROP SEQUENCE IF EXISTS public.spree_tax_lines_id_seq;
DROP TABLE IF EXISTS public.spree_tax_lines;
DROP SEQUENCE IF EXISTS public.spree_tax_identifiers_id_seq;
DROP TABLE IF EXISTS public.spree_tax_identifiers;
DROP SEQUENCE IF EXISTS public.spree_tax_exemption_certificates_id_seq;
DROP TABLE IF EXISTS public.spree_tax_exemption_certificates;
DROP SEQUENCE IF EXISTS public.spree_tax_categories_id_seq;
DROP TABLE IF EXISTS public.spree_tax_categories;
DROP SEQUENCE IF EXISTS public.spree_tags_id_seq;
DROP TABLE IF EXISTS public.spree_tags;
DROP SEQUENCE IF EXISTS public.spree_taggings_id_seq;
DROP TABLE IF EXISTS public.spree_taggings;
DROP SEQUENCE IF EXISTS public.spree_suppliers_id_seq;
DROP TABLE IF EXISTS public.spree_suppliers;
DROP SEQUENCE IF EXISTS public.spree_stripe_webhook_keys_id_seq;
DROP TABLE IF EXISTS public.spree_stripe_webhook_keys;
DROP SEQUENCE IF EXISTS public.spree_stripe_payment_methods_webhook_keys_id_seq;
DROP TABLE IF EXISTS public.spree_stripe_payment_methods_webhook_keys;
DROP SEQUENCE IF EXISTS public.spree_stripe_payment_intents_id_seq;
DROP TABLE IF EXISTS public.spree_stripe_payment_intents;
DROP SEQUENCE IF EXISTS public.spree_stores_id_seq;
DROP TABLE IF EXISTS public.spree_stores;
DROP SEQUENCE IF EXISTS public.spree_store_translations_id_seq;
DROP TABLE IF EXISTS public.spree_store_translations;
DROP SEQUENCE IF EXISTS public.spree_store_credits_id_seq;
DROP TABLE IF EXISTS public.spree_store_credits;
DROP SEQUENCE IF EXISTS public.spree_store_credit_types_id_seq;
DROP TABLE IF EXISTS public.spree_store_credit_types;
DROP SEQUENCE IF EXISTS public.spree_store_credit_events_id_seq;
DROP TABLE IF EXISTS public.spree_store_credit_events;
DROP SEQUENCE IF EXISTS public.spree_store_credit_categories_id_seq;
DROP TABLE IF EXISTS public.spree_store_credit_categories;
DROP SEQUENCE IF EXISTS public.spree_stock_transfers_id_seq;
DROP TABLE IF EXISTS public.spree_stock_transfers;
DROP SEQUENCE IF EXISTS public.spree_stock_transfer_items_id_seq;
DROP TABLE IF EXISTS public.spree_stock_transfer_items;
DROP SEQUENCE IF EXISTS public.spree_stock_reservations_id_seq;
DROP TABLE IF EXISTS public.spree_stock_reservations;
DROP SEQUENCE IF EXISTS public.spree_stock_receipts_id_seq;
DROP TABLE IF EXISTS public.spree_stock_receipts;
DROP SEQUENCE IF EXISTS public.spree_stock_receipt_items_id_seq;
DROP TABLE IF EXISTS public.spree_stock_receipt_items;
DROP SEQUENCE IF EXISTS public.spree_stock_movements_id_seq;
DROP TABLE IF EXISTS public.spree_stock_movements;
DROP SEQUENCE IF EXISTS public.spree_stock_locations_id_seq;
DROP TABLE IF EXISTS public.spree_stock_locations;
DROP SEQUENCE IF EXISTS public.spree_stock_levels_id_seq;
DROP TABLE IF EXISTS public.spree_stock_levels;
DROP SEQUENCE IF EXISTS public.spree_states_id_seq;
DROP TABLE IF EXISTS public.spree_states;
DROP SEQUENCE IF EXISTS public.spree_state_changes_id_seq;
DROP TABLE IF EXISTS public.spree_state_changes;
DROP SEQUENCE IF EXISTS public.spree_shipping_method_categories_id_seq;
DROP TABLE IF EXISTS public.spree_shipping_method_categories;
DROP SEQUENCE IF EXISTS public.spree_shipping_labels_id_seq;
DROP TABLE IF EXISTS public.spree_shipping_labels;
DROP SEQUENCE IF EXISTS public.spree_sellers_id_seq;
DROP TABLE IF EXISTS public.spree_sellers;
DROP SEQUENCE IF EXISTS public.spree_seller_translations_id_seq;
DROP TABLE IF EXISTS public.spree_seller_translations;
DROP SEQUENCE IF EXISTS public.spree_seller_transfers_id_seq;
DROP TABLE IF EXISTS public.spree_seller_transfers;
DROP SEQUENCE IF EXISTS public.spree_seller_requirements_id_seq;
DROP TABLE IF EXISTS public.spree_seller_requirements;
DROP SEQUENCE IF EXISTS public.spree_seller_requirement_submissions_id_seq;
DROP TABLE IF EXISTS public.spree_seller_requirement_submissions;
DROP SEQUENCE IF EXISTS public.spree_seller_requirement_custom_fields_id_seq;
DROP TABLE IF EXISTS public.spree_seller_requirement_custom_fields;
DROP SEQUENCE IF EXISTS public.spree_seller_payouts_id_seq;
DROP TABLE IF EXISTS public.spree_seller_payouts;
DROP SEQUENCE IF EXISTS public.spree_saved_reports_id_seq;
DROP TABLE IF EXISTS public.spree_saved_reports;
DROP SEQUENCE IF EXISTS public.spree_roles_id_seq;
DROP TABLE IF EXISTS public.spree_roles;
DROP SEQUENCE IF EXISTS public.spree_role_users_id_seq;
DROP TABLE IF EXISTS public.spree_role_users;
DROP SEQUENCE IF EXISTS public.spree_returns_id_seq;
DROP TABLE IF EXISTS public.spree_returns;
DROP SEQUENCE IF EXISTS public.spree_return_reasons_id_seq;
DROP TABLE IF EXISTS public.spree_return_reasons;
DROP SEQUENCE IF EXISTS public.spree_return_line_items_id_seq;
DROP TABLE IF EXISTS public.spree_return_line_items;
DROP SEQUENCE IF EXISTS public.spree_return_items_id_seq;
DROP TABLE IF EXISTS public.spree_return_items;
DROP SEQUENCE IF EXISTS public.spree_return_authorizations_id_seq;
DROP TABLE IF EXISTS public.spree_return_authorizations;
DROP SEQUENCE IF EXISTS public.spree_reports_id_seq;
DROP TABLE IF EXISTS public.spree_reports;
DROP SEQUENCE IF EXISTS public.spree_reimbursements_id_seq;
DROP TABLE IF EXISTS public.spree_reimbursements;
DROP SEQUENCE IF EXISTS public.spree_reimbursement_types_id_seq;
DROP TABLE IF EXISTS public.spree_reimbursement_types;
DROP SEQUENCE IF EXISTS public.spree_reimbursement_credits_id_seq;
DROP TABLE IF EXISTS public.spree_reimbursement_credits;
DROP SEQUENCE IF EXISTS public.spree_refunds_id_seq;
DROP TABLE IF EXISTS public.spree_refunds;
DROP SEQUENCE IF EXISTS public.spree_refund_reasons_id_seq;
DROP TABLE IF EXISTS public.spree_refund_reasons;
DROP SEQUENCE IF EXISTS public.spree_refresh_tokens_id_seq;
DROP TABLE IF EXISTS public.spree_refresh_tokens;
DROP SEQUENCE IF EXISTS public.spree_purchase_orders_id_seq;
DROP TABLE IF EXISTS public.spree_purchase_orders;
DROP SEQUENCE IF EXISTS public.spree_purchase_order_items_id_seq;
DROP TABLE IF EXISTS public.spree_purchase_order_items;
DROP SEQUENCE IF EXISTS public.spree_promotions_stores_id_seq;
DROP TABLE IF EXISTS public.spree_promotions_stores;
DROP SEQUENCE IF EXISTS public.spree_promotions_id_seq;
DROP TABLE IF EXISTS public.spree_promotions;
DROP SEQUENCE IF EXISTS public.spree_promotion_rules_id_seq;
DROP TABLE IF EXISTS public.spree_promotion_rules;
DROP SEQUENCE IF EXISTS public.spree_promotion_rule_users_id_seq;
DROP TABLE IF EXISTS public.spree_promotion_rule_users;
DROP SEQUENCE IF EXISTS public.spree_promotion_rule_categories_id_seq;
DROP TABLE IF EXISTS public.spree_promotion_rule_categories;
DROP SEQUENCE IF EXISTS public.spree_promotion_categories_id_seq;
DROP TABLE IF EXISTS public.spree_promotion_categories;
DROP SEQUENCE IF EXISTS public.spree_promotion_actions_id_seq;
DROP TABLE IF EXISTS public.spree_promotion_actions;
DROP SEQUENCE IF EXISTS public.spree_promotion_action_line_items_id_seq;
DROP TABLE IF EXISTS public.spree_promotion_action_line_items;
DROP SEQUENCE IF EXISTS public.spree_products_stores_id_seq;
DROP TABLE IF EXISTS public.spree_products_stores;
DROP SEQUENCE IF EXISTS public.spree_products_id_seq;
DROP TABLE IF EXISTS public.spree_products;
DROP SEQUENCE IF EXISTS public.spree_product_types_id_seq;
DROP TABLE IF EXISTS public.spree_product_types;
DROP SEQUENCE IF EXISTS public.spree_product_type_translations_id_seq;
DROP TABLE IF EXISTS public.spree_product_type_translations;
DROP SEQUENCE IF EXISTS public.spree_product_type_custom_field_definitions_id_seq;
DROP TABLE IF EXISTS public.spree_product_type_custom_field_definitions;
DROP SEQUENCE IF EXISTS public.spree_product_type_categories_id_seq;
DROP TABLE IF EXISTS public.spree_product_type_categories;
DROP SEQUENCE IF EXISTS public.spree_product_translations_id_seq;
DROP TABLE IF EXISTS public.spree_product_translations;
DROP SEQUENCE IF EXISTS public.spree_product_submissions_id_seq;
DROP TABLE IF EXISTS public.spree_product_submissions;
DROP SEQUENCE IF EXISTS public.spree_product_publications_id_seq;
DROP TABLE IF EXISTS public.spree_product_publications;
DROP SEQUENCE IF EXISTS public.spree_product_promotion_rules_id_seq;
DROP TABLE IF EXISTS public.spree_product_promotion_rules;
DROP SEQUENCE IF EXISTS public.spree_product_option_types_id_seq;
DROP TABLE IF EXISTS public.spree_product_option_types;
DROP SEQUENCE IF EXISTS public.spree_product_collections_id_seq;
DROP TABLE IF EXISTS public.spree_product_collections;
DROP SEQUENCE IF EXISTS public.spree_product_categories_id_seq;
DROP TABLE IF EXISTS public.spree_product_categories;
DROP SEQUENCE IF EXISTS public.spree_prices_id_seq;
DROP TABLE IF EXISTS public.spree_prices;
DROP SEQUENCE IF EXISTS public.spree_price_rules_id_seq;
DROP TABLE IF EXISTS public.spree_price_rules;
DROP SEQUENCE IF EXISTS public.spree_price_lists_id_seq;
DROP TABLE IF EXISTS public.spree_price_lists;
DROP SEQUENCE IF EXISTS public.spree_price_histories_id_seq;
DROP TABLE IF EXISTS public.spree_price_histories;
DROP SEQUENCE IF EXISTS public.spree_price_adjustment_tiers_id_seq;
DROP TABLE IF EXISTS public.spree_price_adjustment_tiers;
DROP SEQUENCE IF EXISTS public.spree_preferences_id_seq;
DROP TABLE IF EXISTS public.spree_preferences;
DROP SEQUENCE IF EXISTS public.spree_policy_translations_id_seq;
DROP TABLE IF EXISTS public.spree_policy_translations;
DROP SEQUENCE IF EXISTS public.spree_policies_id_seq;
DROP TABLE IF EXISTS public.spree_policies;
DROP SEQUENCE IF EXISTS public.spree_paypal_checkout_orders_id_seq;
DROP TABLE IF EXISTS public.spree_paypal_checkout_orders;
DROP SEQUENCE IF EXISTS public.spree_payments_id_seq;
DROP TABLE IF EXISTS public.spree_payments;
DROP SEQUENCE IF EXISTS public.spree_payment_splits_id_seq;
DROP TABLE IF EXISTS public.spree_payment_splits;
DROP SEQUENCE IF EXISTS public.spree_payment_sources_id_seq;
DROP TABLE IF EXISTS public.spree_payment_sources;
DROP SEQUENCE IF EXISTS public.spree_payment_setup_sessions_id_seq;
DROP TABLE IF EXISTS public.spree_payment_setup_sessions;
DROP SEQUENCE IF EXISTS public.spree_payment_sessions_id_seq;
DROP TABLE IF EXISTS public.spree_payment_sessions;
DROP TABLE IF EXISTS public.spree_payment_methods_stores;
DROP SEQUENCE IF EXISTS public.spree_payment_methods_id_seq;
DROP TABLE IF EXISTS public.spree_payment_methods;
DROP SEQUENCE IF EXISTS public.spree_payment_capture_events_id_seq;
DROP TABLE IF EXISTS public.spree_payment_capture_events;
DROP SEQUENCE IF EXISTS public.spree_package_types_id_seq;
DROP TABLE IF EXISTS public.spree_package_types;
DROP SEQUENCE IF EXISTS public.spree_orders_id_seq;
DROP TABLE IF EXISTS public.spree_orders;
DROP SEQUENCE IF EXISTS public.spree_order_routing_rules_id_seq;
DROP TABLE IF EXISTS public.spree_order_routing_rules;
DROP SEQUENCE IF EXISTS public.spree_order_promotions_id_seq;
DROP TABLE IF EXISTS public.spree_order_promotions;
DROP SEQUENCE IF EXISTS public.spree_order_groups_id_seq;
DROP TABLE IF EXISTS public.spree_order_groups;
DROP SEQUENCE IF EXISTS public.spree_order_cancellation_reasons_id_seq;
DROP TABLE IF EXISTS public.spree_order_cancellation_reasons;
DROP SEQUENCE IF EXISTS public.spree_option_values_id_seq;
DROP TABLE IF EXISTS public.spree_option_values;
DROP SEQUENCE IF EXISTS public.spree_option_value_variants_id_seq;
DROP TABLE IF EXISTS public.spree_option_value_variants;
DROP SEQUENCE IF EXISTS public.spree_option_value_translations_id_seq;
DROP TABLE IF EXISTS public.spree_option_value_translations;
DROP SEQUENCE IF EXISTS public.spree_option_types_id_seq;
DROP TABLE IF EXISTS public.spree_option_types;
DROP SEQUENCE IF EXISTS public.spree_option_type_translations_id_seq;
DROP TABLE IF EXISTS public.spree_option_type_translations;
DROP SEQUENCE IF EXISTS public.spree_option_type_product_types_id_seq;
DROP TABLE IF EXISTS public.spree_option_type_product_types;
DROP SEQUENCE IF EXISTS public.spree_number_sequences_id_seq;
DROP TABLE IF EXISTS public.spree_number_sequences;
DROP SEQUENCE IF EXISTS public.spree_newsletter_subscribers_id_seq;
DROP TABLE IF EXISTS public.spree_newsletter_subscribers;
DROP SEQUENCE IF EXISTS public.spree_media_id_seq;
DROP TABLE IF EXISTS public.spree_media;
DROP SEQUENCE IF EXISTS public.spree_markets_id_seq;
DROP TABLE IF EXISTS public.spree_markets;
DROP SEQUENCE IF EXISTS public.spree_market_countries_id_seq;
DROP TABLE IF EXISTS public.spree_market_countries;
DROP SEQUENCE IF EXISTS public.spree_log_entries_id_seq;
DROP TABLE IF EXISTS public.spree_log_entries;
DROP SEQUENCE IF EXISTS public.spree_line_items_id_seq;
DROP TABLE IF EXISTS public.spree_line_items;
DROP SEQUENCE IF EXISTS public.spree_invitations_id_seq;
DROP TABLE IF EXISTS public.spree_invitations;
DROP SEQUENCE IF EXISTS public.spree_integrations_id_seq;
DROP TABLE IF EXISTS public.spree_integrations;
DROP SEQUENCE IF EXISTS public.spree_imports_id_seq;
DROP TABLE IF EXISTS public.spree_imports;
DROP SEQUENCE IF EXISTS public.spree_import_rows_id_seq;
DROP TABLE IF EXISTS public.spree_import_rows;
DROP SEQUENCE IF EXISTS public.spree_import_mappings_id_seq;
DROP TABLE IF EXISTS public.spree_import_mappings;
DROP SEQUENCE IF EXISTS public.spree_gift_cards_id_seq;
DROP TABLE IF EXISTS public.spree_gift_cards;
DROP SEQUENCE IF EXISTS public.spree_gift_card_batches_id_seq;
DROP TABLE IF EXISTS public.spree_gift_card_batches;
DROP SEQUENCE IF EXISTS public.spree_gateways_id_seq;
DROP TABLE IF EXISTS public.spree_gateways;
DROP SEQUENCE IF EXISTS public.spree_gateway_customers_id_seq;
DROP TABLE IF EXISTS public.spree_gateway_customers;
DROP SEQUENCE IF EXISTS public.spree_fulfillments_id_seq;
DROP TABLE IF EXISTS public.spree_fulfillments;
DROP SEQUENCE IF EXISTS public.spree_fulfillment_items_id_seq;
DROP TABLE IF EXISTS public.spree_fulfillment_items;
DROP SEQUENCE IF EXISTS public.spree_fees_id_seq;
DROP TABLE IF EXISTS public.spree_fees;
DROP SEQUENCE IF EXISTS public.spree_external_references_id_seq;
DROP TABLE IF EXISTS public.spree_external_references;
DROP SEQUENCE IF EXISTS public.spree_exports_id_seq;
DROP TABLE IF EXISTS public.spree_exports;
DROP SEQUENCE IF EXISTS public.spree_exchanges_id_seq;
DROP TABLE IF EXISTS public.spree_exchanges;
DROP SEQUENCE IF EXISTS public.spree_exchange_line_items_id_seq;
DROP TABLE IF EXISTS public.spree_exchange_line_items;
DROP SEQUENCE IF EXISTS public.spree_discounts_id_seq;
DROP TABLE IF EXISTS public.spree_discounts;
DROP SEQUENCE IF EXISTS public.spree_digital_links_id_seq;
DROP TABLE IF EXISTS public.spree_digital_links;
DROP SEQUENCE IF EXISTS public.spree_digital_assets_id_seq;
DROP TABLE IF EXISTS public.spree_digital_assets;
DROP SEQUENCE IF EXISTS public.spree_delivery_zones_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_zones;
DROP SEQUENCE IF EXISTS public.spree_delivery_zone_members_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_zone_members;
DROP SEQUENCE IF EXISTS public.spree_delivery_rates_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_rates;
DROP SEQUENCE IF EXISTS public.spree_delivery_profiles_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_profiles;
DROP SEQUENCE IF EXISTS public.spree_delivery_origin_groups_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_origin_groups;
DROP SEQUENCE IF EXISTS public.spree_delivery_origin_group_locations_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_origin_group_locations;
DROP SEQUENCE IF EXISTS public.spree_delivery_methods_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_methods;
DROP SEQUENCE IF EXISTS public.spree_delivery_method_stock_locations_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_method_stock_locations;
DROP SEQUENCE IF EXISTS public.spree_delivery_method_services_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_method_services;
DROP SEQUENCE IF EXISTS public.spree_delivery_method_rules_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_method_rules;
DROP SEQUENCE IF EXISTS public.spree_delivery_method_rule_products_id_seq;
DROP TABLE IF EXISTS public.spree_delivery_method_rule_products;
DROP SEQUENCE IF EXISTS public.spree_deliveries_id_seq;
DROP TABLE IF EXISTS public.spree_deliveries;
DROP SEQUENCE IF EXISTS public.spree_data_requests_id_seq;
DROP TABLE IF EXISTS public.spree_data_requests;
DROP SEQUENCE IF EXISTS public.spree_data_feeds_id_seq;
DROP TABLE IF EXISTS public.spree_data_feeds;
DROP SEQUENCE IF EXISTS public.spree_customers_id_seq;
DROP TABLE IF EXISTS public.spree_customers;
DROP SEQUENCE IF EXISTS public.spree_customer_returns_id_seq;
DROP TABLE IF EXISTS public.spree_customer_returns;
DROP SEQUENCE IF EXISTS public.spree_customer_groups_id_seq;
DROP TABLE IF EXISTS public.spree_customer_groups;
DROP SEQUENCE IF EXISTS public.spree_customer_group_users_id_seq;
DROP TABLE IF EXISTS public.spree_customer_group_users;
DROP SEQUENCE IF EXISTS public.spree_custom_fields_id_seq;
DROP TABLE IF EXISTS public.spree_custom_fields;
DROP SEQUENCE IF EXISTS public.spree_custom_field_definitions_id_seq;
DROP TABLE IF EXISTS public.spree_custom_field_definitions;
DROP SEQUENCE IF EXISTS public.spree_custom_domains_id_seq;
DROP TABLE IF EXISTS public.spree_custom_domains;
DROP SEQUENCE IF EXISTS public.spree_credit_cards_id_seq;
DROP TABLE IF EXISTS public.spree_credit_cards;
DROP SEQUENCE IF EXISTS public.spree_coupon_codes_id_seq;
DROP TABLE IF EXISTS public.spree_coupon_codes;
DROP SEQUENCE IF EXISTS public.spree_countries_id_seq;
DROP TABLE IF EXISTS public.spree_countries;
DROP SEQUENCE IF EXISTS public.spree_consolidated_metadata_tables_id_seq;
DROP TABLE IF EXISTS public.spree_consolidated_metadata_tables;
DROP SEQUENCE IF EXISTS public.spree_consent_records_id_seq;
DROP TABLE IF EXISTS public.spree_consent_records;
DROP SEQUENCE IF EXISTS public.spree_company_memberships_id_seq;
DROP TABLE IF EXISTS public.spree_company_memberships;
DROP SEQUENCE IF EXISTS public.spree_company_invitations_id_seq;
DROP TABLE IF EXISTS public.spree_company_invitations;
DROP SEQUENCE IF EXISTS public.spree_companies_id_seq;
DROP TABLE IF EXISTS public.spree_companies;
DROP SEQUENCE IF EXISTS public.spree_commission_rules_id_seq;
DROP TABLE IF EXISTS public.spree_commission_rules;
DROP SEQUENCE IF EXISTS public.spree_commission_rule_products_id_seq;
DROP TABLE IF EXISTS public.spree_commission_rule_products;
DROP SEQUENCE IF EXISTS public.spree_commission_rates_id_seq;
DROP TABLE IF EXISTS public.spree_commission_rates;
DROP SEQUENCE IF EXISTS public.spree_commission_rate_values_id_seq;
DROP TABLE IF EXISTS public.spree_commission_rate_values;
DROP SEQUENCE IF EXISTS public.spree_commission_lines_id_seq;
DROP TABLE IF EXISTS public.spree_commission_lines;
DROP SEQUENCE IF EXISTS public.spree_collections_id_seq;
DROP TABLE IF EXISTS public.spree_collections;
DROP SEQUENCE IF EXISTS public.spree_collection_translations_id_seq;
DROP TABLE IF EXISTS public.spree_collection_translations;
DROP SEQUENCE IF EXISTS public.spree_collection_rules_id_seq;
DROP TABLE IF EXISTS public.spree_collection_rules;
DROP SEQUENCE IF EXISTS public.spree_claims_id_seq;
DROP TABLE IF EXISTS public.spree_claims;
DROP SEQUENCE IF EXISTS public.spree_claim_reasons_id_seq;
DROP TABLE IF EXISTS public.spree_claim_reasons;
DROP SEQUENCE IF EXISTS public.spree_claim_line_items_id_seq;
DROP TABLE IF EXISTS public.spree_claim_line_items;
DROP SEQUENCE IF EXISTS public.spree_channels_id_seq;
DROP TABLE IF EXISTS public.spree_channels;
DROP SEQUENCE IF EXISTS public.spree_channel_stock_locations_id_seq;
DROP TABLE IF EXISTS public.spree_channel_stock_locations;
DROP SEQUENCE IF EXISTS public.spree_category_translations_id_seq;
DROP TABLE IF EXISTS public.spree_category_translations;
DROP SEQUENCE IF EXISTS public.spree_categories_id_seq;
DROP TABLE IF EXISTS public.spree_categories;
DROP SEQUENCE IF EXISTS public.spree_catalogs_id_seq;
DROP TABLE IF EXISTS public.spree_catalogs;
DROP SEQUENCE IF EXISTS public.spree_catalog_quantity_rules_id_seq;
DROP TABLE IF EXISTS public.spree_catalog_quantity_rules;
DROP SEQUENCE IF EXISTS public.spree_catalog_products_id_seq;
DROP TABLE IF EXISTS public.spree_catalog_products;
DROP SEQUENCE IF EXISTS public.spree_catalog_order_minimums_id_seq;
DROP TABLE IF EXISTS public.spree_catalog_order_minimums;
DROP SEQUENCE IF EXISTS public.spree_catalog_assignments_id_seq;
DROP TABLE IF EXISTS public.spree_catalog_assignments;
DROP SEQUENCE IF EXISTS public.spree_carts_id_seq;
DROP TABLE IF EXISTS public.spree_carts;
DROP SEQUENCE IF EXISTS public.spree_calculators_id_seq;
DROP TABLE IF EXISTS public.spree_calculators;
DROP SEQUENCE IF EXISTS public.spree_brands_id_seq;
DROP TABLE IF EXISTS public.spree_brands;
DROP SEQUENCE IF EXISTS public.spree_api_keys_id_seq;
DROP TABLE IF EXISTS public.spree_api_keys;
DROP SEQUENCE IF EXISTS public.spree_allowed_origins_id_seq;
DROP TABLE IF EXISTS public.spree_allowed_origins;
DROP SEQUENCE IF EXISTS public.spree_admin_users_id_seq;
DROP TABLE IF EXISTS public.spree_admin_users;
DROP SEQUENCE IF EXISTS public.spree_adjustments_id_seq;
DROP TABLE IF EXISTS public.spree_adjustments;
DROP SEQUENCE IF EXISTS public.spree_addresses_id_seq;
DROP TABLE IF EXISTS public.spree_addresses;
DROP SEQUENCE IF EXISTS public.solid_queue_semaphores_id_seq;
DROP TABLE IF EXISTS public.solid_queue_semaphores;
DROP SEQUENCE IF EXISTS public.solid_queue_scheduled_executions_id_seq;
DROP TABLE IF EXISTS public.solid_queue_scheduled_executions;
DROP SEQUENCE IF EXISTS public.solid_queue_recurring_tasks_id_seq;
DROP TABLE IF EXISTS public.solid_queue_recurring_tasks;
DROP SEQUENCE IF EXISTS public.solid_queue_recurring_executions_id_seq;
DROP TABLE IF EXISTS public.solid_queue_recurring_executions;
DROP SEQUENCE IF EXISTS public.solid_queue_ready_executions_id_seq;
DROP TABLE IF EXISTS public.solid_queue_ready_executions;
DROP SEQUENCE IF EXISTS public.solid_queue_processes_id_seq;
DROP TABLE IF EXISTS public.solid_queue_processes;
DROP SEQUENCE IF EXISTS public.solid_queue_pauses_id_seq;
DROP TABLE IF EXISTS public.solid_queue_pauses;
DROP SEQUENCE IF EXISTS public.solid_queue_jobs_id_seq;
DROP TABLE IF EXISTS public.solid_queue_jobs;
DROP SEQUENCE IF EXISTS public.solid_queue_failed_executions_id_seq;
DROP TABLE IF EXISTS public.solid_queue_failed_executions;
DROP SEQUENCE IF EXISTS public.solid_queue_claimed_executions_id_seq;
DROP TABLE IF EXISTS public.solid_queue_claimed_executions;
DROP SEQUENCE IF EXISTS public.solid_queue_blocked_executions_id_seq;
DROP TABLE IF EXISTS public.solid_queue_blocked_executions;
DROP SEQUENCE IF EXISTS public.solid_cache_entries_id_seq;
DROP TABLE IF EXISTS public.solid_cache_entries;
DROP SEQUENCE IF EXISTS public.solid_cable_messages_id_seq;
DROP TABLE IF EXISTS public.solid_cable_messages;
DROP TABLE IF EXISTS public.schema_migrations;
DROP SEQUENCE IF EXISTS public.friendly_id_slugs_id_seq;
DROP TABLE IF EXISTS public.friendly_id_slugs;
DROP TABLE IF EXISTS public.ar_internal_metadata;
DROP SEQUENCE IF EXISTS public.active_storage_variant_records_id_seq;
DROP TABLE IF EXISTS public.active_storage_variant_records;
DROP SEQUENCE IF EXISTS public.active_storage_blobs_id_seq;
DROP TABLE IF EXISTS public.active_storage_blobs;
DROP SEQUENCE IF EXISTS public.active_storage_attachments_id_seq;
DROP TABLE IF EXISTS public.active_storage_attachments;
DROP SEQUENCE IF EXISTS public.action_text_rich_texts_id_seq;
DROP TABLE IF EXISTS public.action_text_rich_texts;
DROP EXTENSION IF EXISTS pg_trgm;
--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    body text,
    created_at timestamp(6) without time zone NOT NULL,
    locale character varying NOT NULL,
    name character varying NOT NULL,
    record_id bigint NOT NULL,
    record_type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.action_text_rich_texts OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNER TO postgres;

--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying NOT NULL,
    record_id bigint NOT NULL,
    record_type character varying NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_attachments_id_seq OWNER TO postgres;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    content_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    filename character varying NOT NULL,
    key character varying NOT NULL,
    metadata text,
    service_name character varying NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_blobs_id_seq OWNER TO postgres;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNER TO postgres;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.friendly_id_slugs (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    locale character varying,
    scope character varying,
    slug character varying NOT NULL,
    sluggable_id bigint NOT NULL,
    sluggable_type character varying(50)
);


ALTER TABLE public.friendly_id_slugs OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNER TO postgres;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: solid_cable_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_cable_messages (
    id bigint NOT NULL,
    channel bytea NOT NULL,
    channel_hash bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    payload bytea NOT NULL
);


ALTER TABLE public.solid_cable_messages OWNER TO postgres;

--
-- Name: solid_cable_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_cable_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_cable_messages_id_seq OWNER TO postgres;

--
-- Name: solid_cable_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_cable_messages_id_seq OWNED BY public.solid_cable_messages.id;


--
-- Name: solid_cache_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_cache_entries (
    id bigint NOT NULL,
    byte_size integer NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    key bytea NOT NULL,
    key_hash bigint NOT NULL,
    value bytea NOT NULL
);


ALTER TABLE public.solid_cache_entries OWNER TO postgres;

--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_cache_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_cache_entries_id_seq OWNER TO postgres;

--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_cache_entries_id_seq OWNED BY public.solid_cache_entries.id;


--
-- Name: solid_queue_blocked_executions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_blocked_executions (
    id bigint NOT NULL,
    concurrency_key character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    job_id bigint NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    queue_name character varying NOT NULL
);


ALTER TABLE public.solid_queue_blocked_executions OWNER TO postgres;

--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_blocked_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_blocked_executions_id_seq OWNER TO postgres;

--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_blocked_executions_id_seq OWNED BY public.solid_queue_blocked_executions.id;


--
-- Name: solid_queue_claimed_executions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_claimed_executions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    job_id bigint NOT NULL,
    process_id bigint
);


ALTER TABLE public.solid_queue_claimed_executions OWNER TO postgres;

--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_claimed_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_claimed_executions_id_seq OWNER TO postgres;

--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_claimed_executions_id_seq OWNED BY public.solid_queue_claimed_executions.id;


--
-- Name: solid_queue_failed_executions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_failed_executions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    error text,
    job_id bigint NOT NULL
);


ALTER TABLE public.solid_queue_failed_executions OWNER TO postgres;

--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_failed_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_failed_executions_id_seq OWNER TO postgres;

--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_failed_executions_id_seq OWNED BY public.solid_queue_failed_executions.id;


--
-- Name: solid_queue_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_jobs (
    id bigint NOT NULL,
    active_job_id character varying,
    arguments text,
    class_name character varying NOT NULL,
    concurrency_key character varying,
    created_at timestamp(6) without time zone NOT NULL,
    finished_at timestamp(6) without time zone,
    priority integer DEFAULT 0 NOT NULL,
    queue_name character varying NOT NULL,
    scheduled_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_jobs OWNER TO postgres;

--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_jobs_id_seq OWNER TO postgres;

--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_jobs_id_seq OWNED BY public.solid_queue_jobs.id;


--
-- Name: solid_queue_pauses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_pauses (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    queue_name character varying NOT NULL
);


ALTER TABLE public.solid_queue_pauses OWNER TO postgres;

--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_pauses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_pauses_id_seq OWNER TO postgres;

--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_pauses_id_seq OWNED BY public.solid_queue_pauses.id;


--
-- Name: solid_queue_processes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_processes (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    hostname character varying,
    kind character varying NOT NULL,
    last_heartbeat_at timestamp(6) without time zone NOT NULL,
    metadata text,
    name character varying NOT NULL,
    pid integer NOT NULL,
    supervisor_id bigint
);


ALTER TABLE public.solid_queue_processes OWNER TO postgres;

--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_processes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_processes_id_seq OWNER TO postgres;

--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_processes_id_seq OWNED BY public.solid_queue_processes.id;


--
-- Name: solid_queue_ready_executions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_ready_executions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    job_id bigint NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    queue_name character varying NOT NULL
);


ALTER TABLE public.solid_queue_ready_executions OWNER TO postgres;

--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_ready_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_ready_executions_id_seq OWNER TO postgres;

--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_ready_executions_id_seq OWNED BY public.solid_queue_ready_executions.id;


--
-- Name: solid_queue_recurring_executions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_recurring_executions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    job_id bigint NOT NULL,
    run_at timestamp(6) without time zone NOT NULL,
    task_key character varying NOT NULL
);


ALTER TABLE public.solid_queue_recurring_executions OWNER TO postgres;

--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_recurring_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_recurring_executions_id_seq OWNER TO postgres;

--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_recurring_executions_id_seq OWNED BY public.solid_queue_recurring_executions.id;


--
-- Name: solid_queue_recurring_tasks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_recurring_tasks (
    id bigint NOT NULL,
    arguments text,
    class_name character varying,
    command character varying(2048),
    created_at timestamp(6) without time zone NOT NULL,
    description text,
    key character varying NOT NULL,
    priority integer DEFAULT 0,
    queue_name character varying,
    schedule character varying NOT NULL,
    static boolean DEFAULT true NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_recurring_tasks OWNER TO postgres;

--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_recurring_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_recurring_tasks_id_seq OWNER TO postgres;

--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_recurring_tasks_id_seq OWNED BY public.solid_queue_recurring_tasks.id;


--
-- Name: solid_queue_scheduled_executions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_scheduled_executions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    job_id bigint NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    queue_name character varying NOT NULL,
    scheduled_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.solid_queue_scheduled_executions OWNER TO postgres;

--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_scheduled_executions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_scheduled_executions_id_seq OWNER TO postgres;

--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_scheduled_executions_id_seq OWNED BY public.solid_queue_scheduled_executions.id;


--
-- Name: solid_queue_semaphores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solid_queue_semaphores (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    key character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    value integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.solid_queue_semaphores OWNER TO postgres;

--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solid_queue_semaphores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solid_queue_semaphores_id_seq OWNER TO postgres;

--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solid_queue_semaphores_id_seq OWNED BY public.solid_queue_semaphores.id;


--
-- Name: spree_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_addresses (
    id bigint NOT NULL,
    address1 character varying,
    address2 character varying,
    alternative_phone character varying,
    city character varying,
    company character varying,
    country_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    first_name character varying,
    label character varying,
    last_name character varying,
    latitude numeric,
    longitude numeric,
    phone character varying,
    metadata jsonb,
    quick_checkout boolean DEFAULT false,
    state_id bigint,
    state_name character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    postal_code character varying,
    country_code character varying,
    state_code character varying,
    owner_type character varying,
    owner_id bigint
);


ALTER TABLE public.spree_addresses OWNER TO postgres;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_addresses_id_seq OWNER TO postgres;

--
-- Name: spree_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_addresses_id_seq OWNED BY public.spree_addresses.id;


--
-- Name: spree_adjustments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_adjustments (
    id bigint NOT NULL,
    adjustable_id bigint,
    adjustable_type character varying,
    amount numeric(10,2),
    created_at timestamp(6) without time zone NOT NULL,
    eligible boolean DEFAULT true,
    included boolean DEFAULT false,
    label character varying,
    mandatory boolean,
    order_id bigint NOT NULL,
    source_id bigint,
    source_type character varying,
    state character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_adjustments OWNER TO postgres;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_adjustments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_adjustments_id_seq OWNER TO postgres;

--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_adjustments_id_seq OWNED BY public.spree_adjustments.id;


--
-- Name: spree_admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_admin_users (
    id bigint NOT NULL,
    email character varying NOT NULL,
    password_digest character varying,
    first_name character varying,
    last_name character varying,
    selected_locale character varying,
    failed_attempts integer,
    locked_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_admin_users OWNER TO postgres;

--
-- Name: spree_admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_admin_users_id_seq OWNER TO postgres;

--
-- Name: spree_admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_admin_users_id_seq OWNED BY public.spree_admin_users.id;


--
-- Name: spree_allowed_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_allowed_origins (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    origin character varying NOT NULL,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_allowed_origins OWNER TO postgres;

--
-- Name: spree_allowed_origins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_allowed_origins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_allowed_origins_id_seq OWNER TO postgres;

--
-- Name: spree_allowed_origins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_allowed_origins_id_seq OWNED BY public.spree_allowed_origins.id;


--
-- Name: spree_api_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_api_keys (
    id bigint NOT NULL,
    channel_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    created_by_id bigint,
    created_by_type character varying,
    key_type character varying NOT NULL,
    last_used_at timestamp(6) without time zone,
    name character varying NOT NULL,
    revoked_at timestamp(6) without time zone,
    revoked_by_id bigint,
    revoked_by_type character varying,
    scopes jsonb,
    store_id bigint NOT NULL,
    token character varying,
    token_digest character varying,
    token_prefix character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_api_keys OWNER TO postgres;

--
-- Name: spree_api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_api_keys_id_seq OWNER TO postgres;

--
-- Name: spree_api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_api_keys_id_seq OWNED BY public.spree_api_keys.id;


--
-- Name: spree_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_brands (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    active boolean NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_brands OWNER TO postgres;

--
-- Name: spree_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_brands_id_seq OWNER TO postgres;

--
-- Name: spree_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_brands_id_seq OWNED BY public.spree_brands.id;


--
-- Name: spree_calculators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_calculators (
    id bigint NOT NULL,
    calculable_id bigint,
    calculable_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    preferences text,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_calculators OWNER TO postgres;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_calculators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_calculators_id_seq OWNER TO postgres;

--
-- Name: spree_calculators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_calculators_id_seq OWNED BY public.spree_calculators.id;


--
-- Name: spree_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_carts (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    market_id bigint NOT NULL,
    channel_id bigint NOT NULL,
    customer_id bigint,
    currency character varying NOT NULL,
    locale character varying NOT NULL,
    email character varying,
    ship_address_id bigint,
    bill_address_id bigint,
    accept_marketing boolean,
    customer_note text,
    last_ip_address character varying,
    token character varying NOT NULL,
    lock_version integer DEFAULT 0,
    completed_at timestamp(6) without time zone,
    completing_at timestamp(6) without time zone,
    coupon_code character varying,
    gift_card_id bigint,
    preferred_stock_location_id bigint,
    item_total numeric(10,2) DEFAULT 0.0,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    included_tax_total numeric(10,2) DEFAULT 0.0,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    taxable_adjustment_total numeric(10,2) DEFAULT 0.0,
    non_taxable_adjustment_total numeric(10,2) DEFAULT 0.0,
    discount_total numeric(10,2) DEFAULT 0.0,
    fee_total numeric(10,2) DEFAULT 0.0,
    delivery_total numeric(10,2) DEFAULT 0.0,
    total numeric(10,2) DEFAULT 0.0,
    payment_total numeric(10,2) DEFAULT 0.0,
    total_quantity integer DEFAULT 0,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    company_id bigint,
    po_number character varying
);


ALTER TABLE public.spree_carts OWNER TO postgres;

--
-- Name: spree_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_carts_id_seq OWNER TO postgres;

--
-- Name: spree_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_carts_id_seq OWNED BY public.spree_carts.id;


--
-- Name: spree_catalog_assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_catalog_assignments (
    id bigint NOT NULL,
    catalog_id bigint NOT NULL,
    assignable_type character varying NOT NULL,
    assignable_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_catalog_assignments OWNER TO postgres;

--
-- Name: spree_catalog_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_catalog_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_catalog_assignments_id_seq OWNER TO postgres;

--
-- Name: spree_catalog_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_catalog_assignments_id_seq OWNED BY public.spree_catalog_assignments.id;


--
-- Name: spree_catalog_order_minimums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_catalog_order_minimums (
    id bigint NOT NULL,
    catalog_id bigint NOT NULL,
    currency character varying NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_catalog_order_minimums OWNER TO postgres;

--
-- Name: spree_catalog_order_minimums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_catalog_order_minimums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_catalog_order_minimums_id_seq OWNER TO postgres;

--
-- Name: spree_catalog_order_minimums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_catalog_order_minimums_id_seq OWNED BY public.spree_catalog_order_minimums.id;


--
-- Name: spree_catalog_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_catalog_products (
    id bigint NOT NULL,
    catalog_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_catalog_products OWNER TO postgres;

--
-- Name: spree_catalog_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_catalog_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_catalog_products_id_seq OWNER TO postgres;

--
-- Name: spree_catalog_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_catalog_products_id_seq OWNED BY public.spree_catalog_products.id;


--
-- Name: spree_catalog_quantity_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_catalog_quantity_rules (
    id bigint NOT NULL,
    catalog_id bigint NOT NULL,
    variant_id bigint NOT NULL,
    minimum_order_quantity integer,
    order_multiple integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_catalog_quantity_rules OWNER TO postgres;

--
-- Name: spree_catalog_quantity_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_catalog_quantity_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_catalog_quantity_rules_id_seq OWNER TO postgres;

--
-- Name: spree_catalog_quantity_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_catalog_quantity_rules_id_seq OWNED BY public.spree_catalog_quantity_rules.id;


--
-- Name: spree_catalogs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_catalogs (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT false NOT NULL,
    "position" integer,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description text,
    minimum_order_quantity integer,
    order_multiple integer
);


ALTER TABLE public.spree_catalogs OWNER TO postgres;

--
-- Name: spree_catalogs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_catalogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_catalogs_id_seq OWNER TO postgres;

--
-- Name: spree_catalogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_catalogs_id_seq OWNED BY public.spree_catalogs.id;


--
-- Name: spree_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_categories (
    id bigint NOT NULL,
    automatic boolean DEFAULT false NOT NULL,
    children_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    depth integer,
    description text,
    hide_from_nav boolean DEFAULT false,
    lft bigint,
    meta_description character varying,
    meta_keywords character varying,
    meta_title character varying,
    name character varying NOT NULL,
    parent_id bigint,
    permalink character varying,
    "position" integer DEFAULT 0,
    pretty_name character varying,
    metadata jsonb,
    products_count integer DEFAULT 0 NOT NULL,
    rgt bigint,
    rules_match_policy character varying DEFAULT 'all'::character varying NOT NULL,
    sort_order character varying DEFAULT 'manual'::character varying NOT NULL,
    store_id bigint,
    taxonomy_id bigint,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_categories OWNER TO postgres;

--
-- Name: spree_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_categories_id_seq OWNER TO postgres;

--
-- Name: spree_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_categories_id_seq OWNED BY public.spree_categories.id;


--
-- Name: spree_category_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_category_translations (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    description text,
    locale character varying NOT NULL,
    meta_description character varying,
    meta_keywords character varying,
    meta_title character varying,
    name character varying,
    permalink character varying,
    pretty_name character varying,
    spree_category_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_category_translations OWNER TO postgres;

--
-- Name: spree_category_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_category_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_category_translations_id_seq OWNER TO postgres;

--
-- Name: spree_category_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_category_translations_id_seq OWNED BY public.spree_category_translations.id;


--
-- Name: spree_channel_stock_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_channel_stock_locations (
    id bigint NOT NULL,
    channel_id bigint NOT NULL,
    stock_location_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_channel_stock_locations OWNER TO postgres;

--
-- Name: spree_channel_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_channel_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_channel_stock_locations_id_seq OWNER TO postgres;

--
-- Name: spree_channel_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_channel_stock_locations_id_seq OWNED BY public.spree_channel_stock_locations.id;


--
-- Name: spree_channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_channels (
    id bigint NOT NULL,
    active boolean NOT NULL,
    code character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    name character varying NOT NULL,
    preferences text,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    default_catalog_id bigint
);


ALTER TABLE public.spree_channels OWNER TO postgres;

--
-- Name: spree_channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_channels_id_seq OWNER TO postgres;

--
-- Name: spree_channels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_channels_id_seq OWNED BY public.spree_channels.id;


--
-- Name: spree_claim_line_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_claim_line_items (
    id bigint NOT NULL,
    claim_id bigint NOT NULL,
    line_item_id bigint NOT NULL,
    variant_id bigint NOT NULL,
    replacement_variant_id bigint,
    quantity integer DEFAULT 1 NOT NULL,
    send_replacement boolean DEFAULT false NOT NULL,
    refund_amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    description text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_claim_line_items OWNER TO postgres;

--
-- Name: spree_claim_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_claim_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_claim_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_claim_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_claim_line_items_id_seq OWNED BY public.spree_claim_line_items.id;


--
-- Name: spree_claim_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_claim_reasons (
    id bigint NOT NULL,
    name character varying NOT NULL,
    store_id bigint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_claim_reasons OWNER TO postgres;

--
-- Name: spree_claim_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_claim_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_claim_reasons_id_seq OWNER TO postgres;

--
-- Name: spree_claim_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_claim_reasons_id_seq OWNED BY public.spree_claim_reasons.id;


--
-- Name: spree_claims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_claims (
    id bigint NOT NULL,
    number character varying NOT NULL,
    store_id bigint NOT NULL,
    order_id bigint NOT NULL,
    reason_id bigint,
    created_by_id bigint,
    status character varying NOT NULL,
    resolution character varying,
    memo text,
    approved_at timestamp(6) without time zone,
    resolved_at timestamp(6) without time zone,
    denied_at timestamp(6) without time zone,
    canceled_at timestamp(6) without time zone,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    created_by_type character varying
);


ALTER TABLE public.spree_claims OWNER TO postgres;

--
-- Name: spree_claims_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_claims_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_claims_id_seq OWNER TO postgres;

--
-- Name: spree_claims_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_claims_id_seq OWNED BY public.spree_claims.id;


--
-- Name: spree_collection_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_collection_rules (
    id bigint NOT NULL,
    collection_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    match_policy character varying DEFAULT 'is_equal_to'::character varying NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    value character varying
);


ALTER TABLE public.spree_collection_rules OWNER TO postgres;

--
-- Name: spree_collection_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_collection_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_collection_rules_id_seq OWNER TO postgres;

--
-- Name: spree_collection_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_collection_rules_id_seq OWNED BY public.spree_collection_rules.id;


--
-- Name: spree_collection_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_collection_translations (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    locale character varying NOT NULL,
    meta_description character varying,
    meta_keywords character varying,
    meta_title character varying,
    name character varying,
    permalink character varying,
    spree_collection_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description text
);


ALTER TABLE public.spree_collection_translations OWNER TO postgres;

--
-- Name: spree_collection_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_collection_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_collection_translations_id_seq OWNER TO postgres;

--
-- Name: spree_collection_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_collection_translations_id_seq OWNED BY public.spree_collection_translations.id;


--
-- Name: spree_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_collections (
    id bigint NOT NULL,
    automatic boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    meta_description character varying,
    meta_keywords character varying,
    meta_title character varying,
    metadata jsonb,
    name character varying NOT NULL,
    permalink character varying,
    "position" integer,
    products_count integer DEFAULT 0 NOT NULL,
    rules_match_policy character varying DEFAULT 'all'::character varying NOT NULL,
    sort_order character varying DEFAULT 'manual'::character varying NOT NULL,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    description text
);


ALTER TABLE public.spree_collections OWNER TO postgres;

--
-- Name: spree_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_collections_id_seq OWNER TO postgres;

--
-- Name: spree_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_collections_id_seq OWNED BY public.spree_collections.id;


--
-- Name: spree_commission_lines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_commission_lines (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    line_item_id bigint,
    fulfillment_id bigint,
    commission_rate_id bigint,
    rate numeric(8,5) DEFAULT 0.0 NOT NULL,
    kind character varying NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    tax_amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    tax_rate numeric(8,5) DEFAULT 0.0 NOT NULL,
    total numeric(10,2) DEFAULT 0.0 NOT NULL,
    currency character varying NOT NULL,
    taxability_reason character varying,
    country_code character varying,
    state_code character varying,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT chk_spree_commission_lines_one_subject CHECK (((line_item_id IS NULL) <> (fulfillment_id IS NULL)))
);


ALTER TABLE public.spree_commission_lines OWNER TO postgres;

--
-- Name: spree_commission_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_commission_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_commission_lines_id_seq OWNER TO postgres;

--
-- Name: spree_commission_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_commission_lines_id_seq OWNED BY public.spree_commission_lines.id;


--
-- Name: spree_commission_rate_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_commission_rate_values (
    id bigint NOT NULL,
    commission_rate_id bigint NOT NULL,
    currency character varying NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    min_amount numeric(10,2),
    max_amount numeric(10,2),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.spree_commission_rate_values OWNER TO postgres;

--
-- Name: spree_commission_rate_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_commission_rate_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_commission_rate_values_id_seq OWNER TO postgres;

--
-- Name: spree_commission_rate_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_commission_rate_values_id_seq OWNED BY public.spree_commission_rate_values.id;


--
-- Name: spree_commission_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_commission_rates (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    name character varying NOT NULL,
    code character varying,
    enabled boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    kind character varying NOT NULL,
    value numeric(10,5) DEFAULT 0.0 NOT NULL,
    tax_inclusive boolean DEFAULT false NOT NULL,
    include_shipping boolean DEFAULT false NOT NULL,
    commission_tax_rate numeric(8,5),
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.spree_commission_rates OWNER TO postgres;

--
-- Name: spree_commission_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_commission_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_commission_rates_id_seq OWNER TO postgres;

--
-- Name: spree_commission_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_commission_rates_id_seq OWNED BY public.spree_commission_rates.id;


--
-- Name: spree_commission_rule_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_commission_rule_products (
    id bigint NOT NULL,
    commission_rule_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.spree_commission_rule_products OWNER TO postgres;

--
-- Name: spree_commission_rule_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_commission_rule_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_commission_rule_products_id_seq OWNER TO postgres;

--
-- Name: spree_commission_rule_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_commission_rule_products_id_seq OWNED BY public.spree_commission_rule_products.id;


--
-- Name: spree_commission_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_commission_rules (
    id bigint NOT NULL,
    commission_rate_id bigint NOT NULL,
    type character varying NOT NULL,
    preferences jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.spree_commission_rules OWNER TO postgres;

--
-- Name: spree_commission_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_commission_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_commission_rules_id_seq OWNER TO postgres;

--
-- Name: spree_commission_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_commission_rules_id_seq OWNED BY public.spree_commission_rules.id;


--
-- Name: spree_companies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_companies (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    parent_id bigint,
    name character varying NOT NULL,
    kind character varying NOT NULL,
    metadata jsonb,
    default_bill_address_id bigint,
    default_ship_address_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    po_number_required boolean DEFAULT false NOT NULL
);


ALTER TABLE public.spree_companies OWNER TO postgres;

--
-- Name: spree_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_companies_id_seq OWNER TO postgres;

--
-- Name: spree_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_companies_id_seq OWNED BY public.spree_companies.id;


--
-- Name: spree_company_invitations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_company_invitations (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    inviter_id bigint,
    customer_id bigint,
    email character varying NOT NULL,
    token character varying NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    accepted_at timestamp(6) without time zone,
    revoked_at timestamp(6) without time zone,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_company_invitations OWNER TO postgres;

--
-- Name: spree_company_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_company_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_company_invitations_id_seq OWNER TO postgres;

--
-- Name: spree_company_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_company_invitations_id_seq OWNED BY public.spree_company_invitations.id;


--
-- Name: spree_company_memberships; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_company_memberships (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_company_memberships OWNER TO postgres;

--
-- Name: spree_company_memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_company_memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_company_memberships_id_seq OWNER TO postgres;

--
-- Name: spree_company_memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_company_memberships_id_seq OWNED BY public.spree_company_memberships.id;


--
-- Name: spree_consent_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_consent_records (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    owner_type character varying NOT NULL,
    owner_id bigint NOT NULL,
    purpose character varying NOT NULL,
    source character varying NOT NULL,
    accepted boolean DEFAULT true NOT NULL,
    email character varying,
    ip_address character varying,
    user_agent character varying,
    documents jsonb,
    recorded_at timestamp(6) without time zone NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_consent_records OWNER TO postgres;

--
-- Name: spree_consent_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_consent_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_consent_records_id_seq OWNER TO postgres;

--
-- Name: spree_consent_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_consent_records_id_seq OWNED BY public.spree_consent_records.id;


--
-- Name: spree_consolidated_metadata_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_consolidated_metadata_tables (
    id bigint NOT NULL,
    table_name character varying NOT NULL
);


ALTER TABLE public.spree_consolidated_metadata_tables OWNER TO postgres;

--
-- Name: spree_consolidated_metadata_tables_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_consolidated_metadata_tables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_consolidated_metadata_tables_id_seq OWNER TO postgres;

--
-- Name: spree_consolidated_metadata_tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_consolidated_metadata_tables_id_seq OWNED BY public.spree_consolidated_metadata_tables.id;


--
-- Name: spree_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_countries (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    iso character varying NOT NULL,
    iso3 character varying NOT NULL,
    iso_name character varying,
    name character varying,
    numcode integer,
    states_required boolean DEFAULT false,
    updated_at timestamp without time zone,
    zipcode_required boolean DEFAULT true
);


ALTER TABLE public.spree_countries OWNER TO postgres;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_countries_id_seq OWNER TO postgres;

--
-- Name: spree_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_countries_id_seq OWNED BY public.spree_countries.id;


--
-- Name: spree_coupon_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_coupon_codes (
    id bigint NOT NULL,
    code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    order_id bigint,
    promotion_id bigint,
    state integer DEFAULT 0 NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    cart_id bigint
);


ALTER TABLE public.spree_coupon_codes OWNER TO postgres;

--
-- Name: spree_coupon_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_coupon_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_coupon_codes_id_seq OWNER TO postgres;

--
-- Name: spree_coupon_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_coupon_codes_id_seq OWNED BY public.spree_coupon_codes.id;


--
-- Name: spree_credit_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_credit_cards (
    id bigint NOT NULL,
    address_id bigint,
    cc_type character varying,
    created_at timestamp(6) without time zone NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    fingerprint character varying,
    gateway_customer_id bigint,
    gateway_customer_profile_id character varying,
    gateway_payment_profile_id character varying,
    last_digits character varying,
    month character varying,
    name character varying,
    payment_method_id bigint,
    metadata jsonb,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id bigint,
    year character varying
);


ALTER TABLE public.spree_credit_cards OWNER TO postgres;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_credit_cards_id_seq OWNER TO postgres;

--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_credit_cards_id_seq OWNED BY public.spree_credit_cards.id;


--
-- Name: spree_custom_domains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_custom_domains (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    metadata jsonb,
    status boolean DEFAULT false,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE public.spree_custom_domains OWNER TO postgres;

--
-- Name: spree_custom_domains_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_custom_domains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_custom_domains_id_seq OWNER TO postgres;

--
-- Name: spree_custom_domains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_custom_domains_id_seq OWNED BY public.spree_custom_domains.id;


--
-- Name: spree_custom_field_definitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_custom_field_definitions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    key character varying NOT NULL,
    field_type character varying NOT NULL,
    label character varying NOT NULL,
    namespace character varying NOT NULL,
    resource_type character varying NOT NULL,
    searchable boolean,
    sortable boolean,
    updated_at timestamp(6) without time zone NOT NULL,
    storefront_visible boolean DEFAULT true NOT NULL,
    store_id bigint NOT NULL,
    filter_key character varying NOT NULL
);


ALTER TABLE public.spree_custom_field_definitions OWNER TO postgres;

--
-- Name: spree_custom_field_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_custom_field_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_custom_field_definitions_id_seq OWNER TO postgres;

--
-- Name: spree_custom_field_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_custom_field_definitions_id_seq OWNED BY public.spree_custom_field_definitions.id;


--
-- Name: spree_custom_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_custom_fields (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    custom_field_definition_id bigint NOT NULL,
    resource_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    value text
);


ALTER TABLE public.spree_custom_fields OWNER TO postgres;

--
-- Name: spree_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_custom_fields_id_seq OWNER TO postgres;

--
-- Name: spree_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_custom_fields_id_seq OWNED BY public.spree_custom_fields.id;


--
-- Name: spree_customer_group_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_customer_group_users (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    customer_group_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id bigint NOT NULL,
    customer_type character varying NOT NULL
);


ALTER TABLE public.spree_customer_group_users OWNER TO postgres;

--
-- Name: spree_customer_group_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_customer_group_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_customer_group_users_id_seq OWNER TO postgres;

--
-- Name: spree_customer_group_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_customer_group_users_id_seq OWNED BY public.spree_customer_group_users.id;


--
-- Name: spree_customer_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_customer_groups (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone,
    description text,
    name character varying NOT NULL,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_customer_groups OWNER TO postgres;

--
-- Name: spree_customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_customer_groups_id_seq OWNER TO postgres;

--
-- Name: spree_customer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_customer_groups_id_seq OWNED BY public.spree_customer_groups.id;


--
-- Name: spree_customer_returns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_customer_returns (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    number character varying,
    metadata jsonb,
    stock_location_id bigint,
    store_id bigint,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_customer_returns OWNER TO postgres;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_customer_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_customer_returns_id_seq OWNER TO postgres;

--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_customer_returns_id_seq OWNED BY public.spree_customer_returns.id;


--
-- Name: spree_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_customers (
    id bigint NOT NULL,
    email character varying NOT NULL,
    password_digest character varying,
    first_name character varying,
    last_name character varying,
    phone character varying,
    selected_locale character varying,
    accepts_email_marketing boolean NOT NULL,
    bill_address_id bigint,
    ship_address_id bigint,
    failed_attempts integer,
    locked_at timestamp(6) without time zone,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    internal_note text,
    email_marketing_consent_updated_at timestamp(6) without time zone,
    email_marketing_consent_source character varying,
    anonymized_at timestamp(6) without time zone
);


ALTER TABLE public.spree_customers OWNER TO postgres;

--
-- Name: spree_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_customers_id_seq OWNER TO postgres;

--
-- Name: spree_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_customers_id_seq OWNED BY public.spree_customers.id;


--
-- Name: spree_data_feeds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_data_feeds (
    id bigint NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    slug character varying,
    store_id bigint,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_data_feeds OWNER TO postgres;

--
-- Name: spree_data_feeds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_data_feeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_data_feeds_id_seq OWNER TO postgres;

--
-- Name: spree_data_feeds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_data_feeds_id_seq OWNED BY public.spree_data_feeds.id;


--
-- Name: spree_data_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_data_requests (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    number character varying NOT NULL,
    download_token character varying,
    kind character varying NOT NULL,
    status character varying NOT NULL,
    email character varying NOT NULL,
    requested_at timestamp(6) without time zone NOT NULL,
    completed_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    error_message text,
    requested_by_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_data_requests OWNER TO postgres;

--
-- Name: spree_data_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_data_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_data_requests_id_seq OWNER TO postgres;

--
-- Name: spree_data_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_data_requests_id_seq OWNED BY public.spree_data_requests.id;


--
-- Name: spree_deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_deliveries (
    id bigint NOT NULL,
    owner_type character varying NOT NULL,
    owner_id bigint NOT NULL,
    store_id bigint NOT NULL,
    shipping_label_id bigint,
    tracking_number character varying NOT NULL,
    tracking_url character varying,
    carrier character varying,
    service character varying,
    status character varying NOT NULL,
    estimated_delivery_at timestamp(6) without time zone,
    delivered_at timestamp(6) without time zone,
    details jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_deliveries OWNER TO postgres;

--
-- Name: spree_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_deliveries_id_seq OWNER TO postgres;

--
-- Name: spree_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_deliveries_id_seq OWNED BY public.spree_deliveries.id;


--
-- Name: spree_delivery_method_rule_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_method_rule_products (
    id bigint NOT NULL,
    delivery_method_rule_id bigint NOT NULL,
    product_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_delivery_method_rule_products OWNER TO postgres;

--
-- Name: spree_delivery_method_rule_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_method_rule_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_method_rule_products_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_method_rule_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_method_rule_products_id_seq OWNED BY public.spree_delivery_method_rule_products.id;


--
-- Name: spree_delivery_method_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_method_rules (
    id bigint NOT NULL,
    type character varying NOT NULL,
    delivery_method_id bigint NOT NULL,
    active boolean,
    preferences jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_delivery_method_rules OWNER TO postgres;

--
-- Name: spree_delivery_method_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_method_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_method_rules_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_method_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_method_rules_id_seq OWNED BY public.spree_delivery_method_rules.id;


--
-- Name: spree_delivery_method_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_method_services (
    id bigint NOT NULL,
    delivery_method_id bigint NOT NULL,
    carrier character varying NOT NULL,
    service character varying NOT NULL,
    label character varying,
    markup_flat numeric(10,2),
    markup_percent numeric(8,2),
    "position" integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_delivery_method_services OWNER TO postgres;

--
-- Name: spree_delivery_method_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_method_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_method_services_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_method_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_method_services_id_seq OWNED BY public.spree_delivery_method_services.id;


--
-- Name: spree_delivery_method_stock_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_method_stock_locations (
    id bigint NOT NULL,
    delivery_method_id bigint NOT NULL,
    stock_location_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_delivery_method_stock_locations OWNER TO postgres;

--
-- Name: spree_delivery_method_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_method_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_method_stock_locations_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_method_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_method_stock_locations_id_seq OWNED BY public.spree_delivery_method_stock_locations.id;


--
-- Name: spree_delivery_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_methods (
    id bigint NOT NULL,
    admin_name character varying,
    code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    display_on character varying,
    estimated_transit_business_days_max integer,
    estimated_transit_business_days_min integer,
    name character varying,
    metadata jsonb,
    tax_category_id bigint,
    tracking_url character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    storefront_visible boolean DEFAULT true NOT NULL,
    fulfillment_provider character varying,
    pickup_point_provider character varying,
    store_id bigint,
    rate_provider character varying,
    markup_flat numeric(10,2) DEFAULT 0.0,
    markup_percent numeric(8,2) DEFAULT 0.0,
    delivery_profile_id bigint,
    delivery_origin_group_id bigint,
    delivery_zone_id bigint,
    seller_id bigint,
    available_to_sellers boolean DEFAULT false NOT NULL
);


ALTER TABLE public.spree_delivery_methods OWNER TO postgres;

--
-- Name: spree_delivery_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_methods_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_methods_id_seq OWNED BY public.spree_delivery_methods.id;


--
-- Name: spree_delivery_origin_group_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_origin_group_locations (
    id bigint NOT NULL,
    delivery_origin_group_id bigint NOT NULL,
    stock_location_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_delivery_origin_group_locations OWNER TO postgres;

--
-- Name: spree_delivery_origin_group_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_origin_group_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_origin_group_locations_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_origin_group_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_origin_group_locations_id_seq OWNED BY public.spree_delivery_origin_group_locations.id;


--
-- Name: spree_delivery_origin_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_origin_groups (
    id bigint NOT NULL,
    delivery_profile_id bigint NOT NULL,
    name character varying,
    "position" integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_delivery_origin_groups OWNER TO postgres;

--
-- Name: spree_delivery_origin_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_origin_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_origin_groups_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_origin_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_origin_groups_id_seq OWNED BY public.spree_delivery_origin_groups.id;


--
-- Name: spree_delivery_profiles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_profiles (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint,
    "default" boolean DEFAULT false NOT NULL,
    type character varying,
    "position" integer DEFAULT 0
);


ALTER TABLE public.spree_delivery_profiles OWNER TO postgres;

--
-- Name: spree_delivery_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_profiles_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_profiles_id_seq OWNED BY public.spree_delivery_profiles.id;


--
-- Name: spree_delivery_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_rates (
    id bigint NOT NULL,
    cost numeric(8,2) DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    selected boolean DEFAULT false,
    fulfillment_id bigint,
    delivery_method_id bigint,
    tax_rate_id bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    carrier character varying,
    service_level character varying,
    estimated_delivery_date date,
    metadata jsonb,
    name character varying,
    unpriced boolean DEFAULT false NOT NULL
);


ALTER TABLE public.spree_delivery_rates OWNER TO postgres;

--
-- Name: spree_delivery_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_rates_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_rates_id_seq OWNED BY public.spree_delivery_rates.id;


--
-- Name: spree_delivery_zone_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_zone_members (
    id bigint NOT NULL,
    delivery_zone_id bigint NOT NULL,
    member_type character varying NOT NULL,
    country_id bigint,
    state_id bigint,
    postal_code_prefix character varying,
    postal_code_from character varying,
    postal_code_to character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    country_code character varying,
    state_code character varying
);


ALTER TABLE public.spree_delivery_zone_members OWNER TO postgres;

--
-- Name: spree_delivery_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_zone_members_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_zone_members_id_seq OWNED BY public.spree_delivery_zone_members.id;


--
-- Name: spree_delivery_zones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_delivery_zones (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    name character varying NOT NULL,
    description character varying,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    delivery_profile_id bigint,
    delivery_origin_group_id bigint
);


ALTER TABLE public.spree_delivery_zones OWNER TO postgres;

--
-- Name: spree_delivery_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_delivery_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_delivery_zones_id_seq OWNER TO postgres;

--
-- Name: spree_delivery_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_delivery_zones_id_seq OWNED BY public.spree_delivery_zones.id;


--
-- Name: spree_digital_assets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_digital_assets (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    variant_id bigint,
    authorized_clicks integer,
    authorized_days integer,
    provider_type character varying,
    metadata jsonb
);


ALTER TABLE public.spree_digital_assets OWNER TO postgres;

--
-- Name: spree_digital_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_digital_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_digital_assets_id_seq OWNER TO postgres;

--
-- Name: spree_digital_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_digital_assets_id_seq OWNED BY public.spree_digital_assets.id;


--
-- Name: spree_digital_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_digital_links (
    id bigint NOT NULL,
    access_counter integer,
    created_at timestamp without time zone NOT NULL,
    digital_asset_id bigint,
    line_item_id bigint,
    token character varying,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_digital_links OWNER TO postgres;

--
-- Name: spree_digital_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_digital_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_digital_links_id_seq OWNER TO postgres;

--
-- Name: spree_digital_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_digital_links_id_seq OWNED BY public.spree_digital_links.id;


--
-- Name: spree_discounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_discounts (
    id bigint NOT NULL,
    cart_id bigint,
    order_id bigint,
    promotion_action_id bigint,
    promotion_id bigint,
    line_item_id bigint,
    fulfillment_id bigint,
    amount numeric(10,2) NOT NULL,
    label character varying NOT NULL,
    kind character varying NOT NULL,
    code character varying,
    value numeric(10,2),
    value_type character varying,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT chk_spree_discounts_amount_nonpositive CHECK ((amount <= (0)::numeric))
);


ALTER TABLE public.spree_discounts OWNER TO postgres;

--
-- Name: spree_discounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_discounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_discounts_id_seq OWNER TO postgres;

--
-- Name: spree_discounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_discounts_id_seq OWNED BY public.spree_discounts.id;


--
-- Name: spree_exchange_line_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_exchange_line_items (
    id bigint NOT NULL,
    exchange_id bigint NOT NULL,
    fulfillment_item_id bigint NOT NULL,
    line_item_id bigint NOT NULL,
    original_variant_id bigint NOT NULL,
    new_variant_id bigint NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    received_quantity integer DEFAULT 0 NOT NULL,
    resellable boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_exchange_line_items OWNER TO postgres;

--
-- Name: spree_exchange_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_exchange_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_exchange_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_exchange_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_exchange_line_items_id_seq OWNED BY public.spree_exchange_line_items.id;


--
-- Name: spree_exchanges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_exchanges (
    id bigint NOT NULL,
    number character varying NOT NULL,
    store_id bigint NOT NULL,
    order_id bigint NOT NULL,
    stock_location_id bigint NOT NULL,
    reason_id bigint,
    created_by_id bigint,
    status character varying NOT NULL,
    memo text,
    approved_at timestamp(6) without time zone,
    received_at timestamp(6) without time zone,
    fulfilled_at timestamp(6) without time zone,
    canceled_at timestamp(6) without time zone,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    created_by_type character varying
);


ALTER TABLE public.spree_exchanges OWNER TO postgres;

--
-- Name: spree_exchanges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_exchanges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_exchanges_id_seq OWNER TO postgres;

--
-- Name: spree_exchanges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_exchanges_id_seq OWNED BY public.spree_exchanges.id;


--
-- Name: spree_exports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_exports (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    format integer NOT NULL,
    number character varying(32) NOT NULL,
    preferences text,
    search_params jsonb,
    store_id bigint NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint,
    seller_id bigint
);


ALTER TABLE public.spree_exports OWNER TO postgres;

--
-- Name: spree_exports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_exports_id_seq OWNER TO postgres;

--
-- Name: spree_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_exports_id_seq OWNED BY public.spree_exports.id;


--
-- Name: spree_external_references; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_external_references (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    system character varying NOT NULL,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    external_id character varying NOT NULL,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_external_references OWNER TO postgres;

--
-- Name: spree_external_references_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_external_references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_external_references_id_seq OWNER TO postgres;

--
-- Name: spree_external_references_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_external_references_id_seq OWNED BY public.spree_external_references.id;


--
-- Name: spree_fees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_fees (
    id bigint NOT NULL,
    cart_id bigint,
    order_id bigint,
    line_item_id bigint,
    fulfillment_id bigint,
    amount numeric(10,2) NOT NULL,
    label character varying NOT NULL,
    kind character varying NOT NULL,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    CONSTRAINT chk_spree_fees_amount_nonnegative CHECK ((amount >= (0)::numeric))
);


ALTER TABLE public.spree_fees OWNER TO postgres;

--
-- Name: spree_fees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_fees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_fees_id_seq OWNER TO postgres;

--
-- Name: spree_fees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_fees_id_seq OWNED BY public.spree_fees.id;


--
-- Name: spree_fulfillment_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_fulfillment_items (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    line_item_id bigint,
    order_id bigint,
    original_return_item_id bigint,
    pending boolean DEFAULT true,
    quantity integer DEFAULT 1,
    fulfillment_id bigint,
    status character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    variant_id bigint
);


ALTER TABLE public.spree_fulfillment_items OWNER TO postgres;

--
-- Name: spree_fulfillment_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_fulfillment_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_fulfillment_items_id_seq OWNER TO postgres;

--
-- Name: spree_fulfillment_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_fulfillment_items_id_seq OWNED BY public.spree_fulfillment_items.id;


--
-- Name: spree_fulfillments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_fulfillments (
    id bigint NOT NULL,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    address_id bigint,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    cost numeric(10,2) DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    non_taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    number character varying,
    order_id bigint,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    metadata jsonb,
    discount_total numeric(10,2) DEFAULT 0.0,
    fulfilled_at timestamp without time zone,
    status character varying,
    stock_location_id bigint,
    taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    tracking character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    fulfillment_type character varying,
    pickup_point_data jsonb,
    cart_id bigint,
    delivered_at timestamp(6) without time zone
);


ALTER TABLE public.spree_fulfillments OWNER TO postgres;

--
-- Name: spree_fulfillments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_fulfillments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_fulfillments_id_seq OWNER TO postgres;

--
-- Name: spree_fulfillments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_fulfillments_id_seq OWNED BY public.spree_fulfillments.id;


--
-- Name: spree_gateway_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_gateway_customers (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    payment_method_id bigint NOT NULL,
    profile_id character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id bigint NOT NULL
);


ALTER TABLE public.spree_gateway_customers OWNER TO postgres;

--
-- Name: spree_gateway_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_gateway_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_gateway_customers_id_seq OWNER TO postgres;

--
-- Name: spree_gateway_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_gateway_customers_id_seq OWNED BY public.spree_gateway_customers.id;


--
-- Name: spree_gateways; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_gateways (
    id bigint NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    description text,
    environment character varying DEFAULT 'development'::character varying,
    name character varying,
    preferences text,
    server character varying DEFAULT 'test'::character varying,
    test_mode boolean DEFAULT true,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_gateways OWNER TO postgres;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_gateways_id_seq OWNER TO postgres;

--
-- Name: spree_gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_gateways_id_seq OWNED BY public.spree_gateways.id;


--
-- Name: spree_gift_card_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_gift_card_batches (
    id bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    codes_count integer DEFAULT 1 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    created_by_id bigint,
    currency character varying NOT NULL,
    expires_at date,
    prefix character varying,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_gift_card_batches OWNER TO postgres;

--
-- Name: spree_gift_card_batches_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_gift_card_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_gift_card_batches_id_seq OWNER TO postgres;

--
-- Name: spree_gift_card_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_gift_card_batches_id_seq OWNED BY public.spree_gift_card_batches.id;


--
-- Name: spree_gift_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_gift_cards (
    id bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    amount_authorized numeric(10,2) DEFAULT 0.0 NOT NULL,
    amount_used numeric(10,2) DEFAULT 0.0 NOT NULL,
    code character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    created_by_id bigint,
    currency character varying NOT NULL,
    expires_at date,
    gift_card_batch_id bigint,
    redeemed_at timestamp(6) without time zone,
    status character varying NOT NULL,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id bigint
);


ALTER TABLE public.spree_gift_cards OWNER TO postgres;

--
-- Name: spree_gift_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_gift_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_gift_cards_id_seq OWNER TO postgres;

--
-- Name: spree_gift_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_gift_cards_id_seq OWNED BY public.spree_gift_cards.id;


--
-- Name: spree_import_mappings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_import_mappings (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    file_column character varying,
    import_id bigint NOT NULL,
    schema_field character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_import_mappings OWNER TO postgres;

--
-- Name: spree_import_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_import_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_import_mappings_id_seq OWNER TO postgres;

--
-- Name: spree_import_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_import_mappings_id_seq OWNED BY public.spree_import_mappings.id;


--
-- Name: spree_import_rows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_import_rows (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    data text NOT NULL,
    import_id bigint NOT NULL,
    item_id bigint,
    item_type character varying,
    row_number integer NOT NULL,
    status character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    validation_errors text
);


ALTER TABLE public.spree_import_rows OWNER TO postgres;

--
-- Name: spree_import_rows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_import_rows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_import_rows_id_seq OWNER TO postgres;

--
-- Name: spree_import_rows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_import_rows_id_seq OWNED BY public.spree_import_rows.id;


--
-- Name: spree_imports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_imports (
    id bigint NOT NULL,
    completed_groups_count integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    number character varying(32) NOT NULL,
    owner_id bigint,
    owner_type character varying,
    preferences text,
    processing_errors text,
    processing_groups_count integer DEFAULT 0,
    rows_count integer DEFAULT 0 NOT NULL,
    status character varying NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL,
    store_id bigint,
    seller_id bigint
);


ALTER TABLE public.spree_imports OWNER TO postgres;

--
-- Name: spree_imports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_imports_id_seq OWNER TO postgres;

--
-- Name: spree_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_imports_id_seq OWNED BY public.spree_imports.id;


--
-- Name: spree_integrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_integrations (
    id bigint NOT NULL,
    active boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    preferences text,
    store_id bigint NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_integrations OWNER TO postgres;

--
-- Name: spree_integrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_integrations_id_seq OWNER TO postgres;

--
-- Name: spree_integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_integrations_id_seq OWNED BY public.spree_integrations.id;


--
-- Name: spree_invitations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_invitations (
    id bigint NOT NULL,
    accepted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone,
    email character varying NOT NULL,
    expires_at timestamp(6) without time zone,
    invitee_id bigint,
    invitee_type character varying,
    inviter_id bigint NOT NULL,
    inviter_type character varying NOT NULL,
    resource_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    role_id bigint NOT NULL,
    status character varying NOT NULL,
    token character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_invitations OWNER TO postgres;

--
-- Name: spree_invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_invitations_id_seq OWNER TO postgres;

--
-- Name: spree_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_invitations_id_seq OWNED BY public.spree_invitations.id;


--
-- Name: spree_line_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_line_items (
    id bigint NOT NULL,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    adjustment_total numeric(10,2) DEFAULT 0.0,
    cost_price numeric(10,2),
    created_at timestamp(6) without time zone NOT NULL,
    currency character varying,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    non_taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    order_id bigint,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    price numeric(10,2) NOT NULL,
    price_list_id bigint,
    metadata jsonb,
    discount_total numeric(10,2) DEFAULT 0.0,
    quantity integer NOT NULL,
    tax_category_id bigint,
    taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    variant_id bigint,
    cart_id bigint,
    seller_id bigint,
    price_source character varying
);


ALTER TABLE public.spree_line_items OWNER TO postgres;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_line_items_id_seq OWNED BY public.spree_line_items.id;


--
-- Name: spree_log_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_log_entries (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    details text,
    source_id bigint,
    source_type character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_log_entries OWNER TO postgres;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_log_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_log_entries_id_seq OWNER TO postgres;

--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_log_entries_id_seq OWNED BY public.spree_log_entries.id;


--
-- Name: spree_market_countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_market_countries (
    id bigint NOT NULL,
    country_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    market_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    country_code character varying
);


ALTER TABLE public.spree_market_countries OWNER TO postgres;

--
-- Name: spree_market_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_market_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_market_countries_id_seq OWNER TO postgres;

--
-- Name: spree_market_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_market_countries_id_seq OWNED BY public.spree_market_countries.id;


--
-- Name: spree_markets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_markets (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    currency character varying NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    default_locale character varying NOT NULL,
    deleted_at timestamp(6) without time zone,
    name character varying NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    store_id bigint NOT NULL,
    supported_locales character varying,
    tax_inclusive boolean DEFAULT false NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    tax_provider character varying
);


ALTER TABLE public.spree_markets OWNER TO postgres;

--
-- Name: spree_markets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_markets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_markets_id_seq OWNER TO postgres;

--
-- Name: spree_markets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_markets_id_seq OWNED BY public.spree_markets.id;


--
-- Name: spree_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_media (
    id bigint NOT NULL,
    alt text,
    attachment_content_type character varying,
    attachment_file_name character varying,
    attachment_file_size integer,
    attachment_height integer,
    attachment_updated_at timestamp without time zone,
    attachment_width integer,
    created_at timestamp without time zone,
    external_video_url character varying,
    focal_point_x numeric(5,4),
    focal_point_y numeric(5,4),
    media_type character varying,
    "position" integer,
    metadata jsonb,
    session_id character varying,
    type character varying(75),
    updated_at timestamp without time zone,
    viewable_id bigint,
    viewable_type character varying,
    store_id bigint
);


ALTER TABLE public.spree_media OWNER TO postgres;

--
-- Name: spree_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_media_id_seq OWNER TO postgres;

--
-- Name: spree_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_media_id_seq OWNED BY public.spree_media.id;


--
-- Name: spree_newsletter_subscribers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_newsletter_subscribers (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    email character varying NOT NULL,
    metadata jsonb,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id bigint,
    verification_token character varying,
    verified_at timestamp(6) without time zone
);


ALTER TABLE public.spree_newsletter_subscribers OWNER TO postgres;

--
-- Name: spree_newsletter_subscribers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_newsletter_subscribers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_newsletter_subscribers_id_seq OWNER TO postgres;

--
-- Name: spree_newsletter_subscribers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_newsletter_subscribers_id_seq OWNED BY public.spree_newsletter_subscribers.id;


--
-- Name: spree_number_sequences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_number_sequences (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    resource_type character varying NOT NULL,
    value bigint DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_number_sequences OWNER TO postgres;

--
-- Name: spree_number_sequences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_number_sequences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_number_sequences_id_seq OWNER TO postgres;

--
-- Name: spree_number_sequences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_number_sequences_id_seq OWNED BY public.spree_number_sequences.id;


--
-- Name: spree_option_type_product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_option_type_product_types (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    option_type_id bigint,
    product_type_id bigint,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_option_type_product_types OWNER TO postgres;

--
-- Name: spree_option_type_product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_option_type_product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_option_type_product_types_id_seq OWNER TO postgres;

--
-- Name: spree_option_type_product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_option_type_product_types_id_seq OWNED BY public.spree_option_type_product_types.id;


--
-- Name: spree_option_type_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_option_type_translations (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    locale character varying NOT NULL,
    label character varying,
    spree_option_type_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_option_type_translations OWNER TO postgres;

--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_option_type_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_option_type_translations_id_seq OWNER TO postgres;

--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_option_type_translations_id_seq OWNED BY public.spree_option_type_translations.id;


--
-- Name: spree_option_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_option_types (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    filterable boolean DEFAULT true NOT NULL,
    kind character varying DEFAULT 'dropdown'::character varying NOT NULL,
    name character varying(100),
    "position" integer DEFAULT 0 NOT NULL,
    label character varying(100),
    metadata jsonb,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint
);


ALTER TABLE public.spree_option_types OWNER TO postgres;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_option_types_id_seq OWNER TO postgres;

--
-- Name: spree_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_option_types_id_seq OWNED BY public.spree_option_types.id;


--
-- Name: spree_option_value_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_option_value_translations (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    locale character varying NOT NULL,
    label character varying,
    spree_option_value_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_option_value_translations OWNER TO postgres;

--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_option_value_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_option_value_translations_id_seq OWNER TO postgres;

--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_option_value_translations_id_seq OWNED BY public.spree_option_value_translations.id;


--
-- Name: spree_option_value_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_option_value_variants (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    option_value_id bigint,
    updated_at timestamp without time zone,
    variant_id bigint
);


ALTER TABLE public.spree_option_value_variants OWNER TO postgres;

--
-- Name: spree_option_value_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_option_value_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_option_value_variants_id_seq OWNER TO postgres;

--
-- Name: spree_option_value_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_option_value_variants_id_seq OWNED BY public.spree_option_value_variants.id;


--
-- Name: spree_option_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_option_values (
    id bigint NOT NULL,
    color_code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    option_type_id bigint,
    "position" integer,
    label character varying,
    metadata jsonb,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_option_values OWNER TO postgres;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_option_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_option_values_id_seq OWNER TO postgres;

--
-- Name: spree_option_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_option_values_id_seq OWNED BY public.spree_option_values.id;


--
-- Name: spree_order_cancellation_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_order_cancellation_reasons (
    id bigint NOT NULL,
    name character varying NOT NULL,
    store_id bigint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_order_cancellation_reasons OWNER TO postgres;

--
-- Name: spree_order_cancellation_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_order_cancellation_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_order_cancellation_reasons_id_seq OWNER TO postgres;

--
-- Name: spree_order_cancellation_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_order_cancellation_reasons_id_seq OWNED BY public.spree_order_cancellation_reasons.id;


--
-- Name: spree_order_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_order_groups (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    customer_id bigint,
    cart_id bigint,
    number character varying NOT NULL,
    currency character varying NOT NULL,
    email character varying,
    token character varying,
    ship_address_id bigint,
    bill_address_id bigint,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    confirmation_delivered boolean DEFAULT false,
    store_owner_notification_delivered boolean DEFAULT false
);


ALTER TABLE public.spree_order_groups OWNER TO postgres;

--
-- Name: spree_order_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_order_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_order_groups_id_seq OWNER TO postgres;

--
-- Name: spree_order_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_order_groups_id_seq OWNED BY public.spree_order_groups.id;


--
-- Name: spree_order_promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_order_promotions (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    order_id bigint,
    promotion_id bigint,
    updated_at timestamp without time zone,
    cart_id bigint
);


ALTER TABLE public.spree_order_promotions OWNER TO postgres;

--
-- Name: spree_order_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_order_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_order_promotions_id_seq OWNER TO postgres;

--
-- Name: spree_order_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_order_promotions_id_seq OWNED BY public.spree_order_promotions.id;


--
-- Name: spree_order_routing_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_order_routing_rules (
    id bigint NOT NULL,
    active boolean NOT NULL,
    channel_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    "position" integer NOT NULL,
    preferences text,
    store_id bigint NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_order_routing_rules OWNER TO postgres;

--
-- Name: spree_order_routing_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_order_routing_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_order_routing_rules_id_seq OWNER TO postgres;

--
-- Name: spree_order_routing_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_order_routing_rules_id_seq OWNED BY public.spree_order_routing_rules.id;


--
-- Name: spree_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_orders (
    id bigint NOT NULL,
    accept_marketing boolean DEFAULT false,
    additional_tax_total numeric(10,2) DEFAULT 0.0,
    adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    approved_at timestamp without time zone,
    approver_id bigint,
    bill_address_id bigint,
    canceled_at timestamp without time zone,
    canceler_id bigint,
    channel character varying DEFAULT 'spree'::character varying,
    channel_id bigint,
    completed_at timestamp without time zone,
    confirmation_delivered boolean DEFAULT false,
    considered_risky boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    created_by_id bigint,
    currency character varying,
    email character varying,
    gift_card_id bigint,
    included_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    internal_note text,
    total_quantity integer DEFAULT 0,
    item_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    last_ip_address character varying,
    locale character varying,
    market_id bigint,
    non_taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    number character varying(32),
    payment_status character varying,
    payment_total numeric(10,2) DEFAULT 0.0,
    preferred_stock_location_id bigint,
    metadata jsonb,
    discount_total numeric(10,2) DEFAULT 0.0,
    ship_address_id bigint,
    fulfillment_status character varying,
    delivery_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    signup_for_an_account boolean DEFAULT false,
    customer_note text,
    lock_version integer DEFAULT 0 NOT NULL,
    status character varying DEFAULT 'draft'::character varying NOT NULL,
    store_id bigint,
    store_owner_notification_delivered boolean,
    taxable_adjustment_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    token character varying,
    total numeric(10,2) DEFAULT 0.0 NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id bigint,
    cart_id bigint,
    fee_total numeric(10,2),
    coupon_code character varying,
    company_id bigint,
    seller_id bigint,
    order_group_id bigint,
    po_number character varying,
    cancel_reason_id bigint,
    cancel_note text,
    commission_amount_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    commission_tax_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    commission_total numeric(10,2) DEFAULT 0.0 NOT NULL,
    created_by_type character varying,
    approver_type character varying,
    canceler_type character varying
);


ALTER TABLE public.spree_orders OWNER TO postgres;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_orders_id_seq OWNER TO postgres;

--
-- Name: spree_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_orders_id_seq OWNED BY public.spree_orders.id;


--
-- Name: spree_package_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_package_types (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    name character varying NOT NULL,
    kind character varying NOT NULL,
    length numeric(8,2),
    width numeric(8,2),
    height numeric(8,2),
    dimensions_unit character varying,
    weight numeric(10,2),
    max_weight numeric(10,2),
    weight_unit character varying,
    "default" boolean DEFAULT false NOT NULL,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    seller_id bigint
);


ALTER TABLE public.spree_package_types OWNER TO postgres;

--
-- Name: spree_package_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_package_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_package_types_id_seq OWNER TO postgres;

--
-- Name: spree_package_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_package_types_id_seq OWNED BY public.spree_package_types.id;


--
-- Name: spree_payment_capture_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_payment_capture_events (
    id bigint NOT NULL,
    amount numeric(10,2) DEFAULT 0.0,
    created_at timestamp(6) without time zone NOT NULL,
    payment_id bigint,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_payment_capture_events OWNER TO postgres;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_payment_capture_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_payment_capture_events_id_seq OWNER TO postgres;

--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_payment_capture_events_id_seq OWNED BY public.spree_payment_capture_events.id;


--
-- Name: spree_payment_methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_payment_methods (
    id bigint NOT NULL,
    active boolean DEFAULT true,
    auto_capture boolean,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    description text,
    name character varying,
    "position" integer DEFAULT 0,
    preferences text,
    metadata jsonb,
    settings jsonb,
    store_id bigint,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    capture_method character varying,
    storefront_visible boolean DEFAULT true NOT NULL
);


ALTER TABLE public.spree_payment_methods OWNER TO postgres;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_payment_methods_id_seq OWNER TO postgres;

--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_payment_methods_id_seq OWNED BY public.spree_payment_methods.id;


--
-- Name: spree_payment_methods_stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_payment_methods_stores (
    payment_method_id bigint,
    store_id bigint
);


ALTER TABLE public.spree_payment_methods_stores OWNER TO postgres;

--
-- Name: spree_payment_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_payment_sessions (
    id bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    currency character varying NOT NULL,
    customer_external_id character varying,
    customer_id bigint,
    deleted_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    external_data jsonb,
    external_id character varying NOT NULL,
    order_id bigint,
    payment_method_id bigint NOT NULL,
    status character varying NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    cart_id bigint
);


ALTER TABLE public.spree_payment_sessions OWNER TO postgres;

--
-- Name: spree_payment_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_payment_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_payment_sessions_id_seq OWNER TO postgres;

--
-- Name: spree_payment_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_payment_sessions_id_seq OWNED BY public.spree_payment_sessions.id;


--
-- Name: spree_payment_setup_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_payment_setup_sessions (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    customer_id bigint,
    deleted_at timestamp(6) without time zone,
    external_client_secret character varying,
    external_data jsonb,
    external_id character varying,
    payment_method_id bigint NOT NULL,
    payment_source_id bigint,
    payment_source_type character varying,
    status character varying NOT NULL,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_payment_setup_sessions OWNER TO postgres;

--
-- Name: spree_payment_setup_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_payment_setup_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_payment_setup_sessions_id_seq OWNER TO postgres;

--
-- Name: spree_payment_setup_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_payment_setup_sessions_id_seq OWNED BY public.spree_payment_setup_sessions.id;


--
-- Name: spree_payment_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_payment_sources (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    gateway_customer_profile_id character varying,
    gateway_payment_profile_id character varying,
    payment_method_id bigint,
    metadata jsonb,
    type character varying,
    updated_at timestamp without time zone NOT NULL,
    customer_id bigint
);


ALTER TABLE public.spree_payment_sources OWNER TO postgres;

--
-- Name: spree_payment_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_payment_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_payment_sources_id_seq OWNER TO postgres;

--
-- Name: spree_payment_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_payment_sources_id_seq OWNED BY public.spree_payment_sources.id;


--
-- Name: spree_payment_splits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_payment_splits (
    id bigint NOT NULL,
    payment_id bigint NOT NULL,
    order_id bigint NOT NULL,
    authorized_amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    captured_amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    refunded_amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    currency character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    claimed_amount numeric(10,2) DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.spree_payment_splits OWNER TO postgres;

--
-- Name: spree_payment_splits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_payment_splits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_payment_splits_id_seq OWNER TO postgres;

--
-- Name: spree_payment_splits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_payment_splits_id_seq OWNED BY public.spree_payment_splits.id;


--
-- Name: spree_payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_payments (
    id bigint NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    avs_response character varying,
    created_at timestamp(6) without time zone NOT NULL,
    cvv_response_code character varying,
    cvv_response_message character varying,
    number character varying,
    order_id bigint,
    payment_method_id bigint,
    metadata jsonb,
    response_code character varying,
    source_id bigint,
    source_type character varying,
    status character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    cart_id bigint,
    order_group_id bigint
);


ALTER TABLE public.spree_payments OWNER TO postgres;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_payments_id_seq OWNER TO postgres;

--
-- Name: spree_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_payments_id_seq OWNED BY public.spree_payments.id;


--
-- Name: spree_paypal_checkout_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_paypal_checkout_orders (
    id bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    data jsonb,
    order_id bigint NOT NULL,
    payment_method_id bigint NOT NULL,
    paypal_id character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_paypal_checkout_orders OWNER TO postgres;

--
-- Name: spree_paypal_checkout_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_paypal_checkout_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_paypal_checkout_orders_id_seq OWNER TO postgres;

--
-- Name: spree_paypal_checkout_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_paypal_checkout_orders_id_seq OWNED BY public.spree_paypal_checkout_orders.id;


--
-- Name: spree_policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_policies (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    owner_id bigint,
    owner_type character varying,
    slug character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    body text
);


ALTER TABLE public.spree_policies OWNER TO postgres;

--
-- Name: spree_policies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_policies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_policies_id_seq OWNER TO postgres;

--
-- Name: spree_policies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_policies_id_seq OWNED BY public.spree_policies.id;


--
-- Name: spree_policy_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_policy_translations (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    locale character varying NOT NULL,
    name character varying,
    spree_policy_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    body text
);


ALTER TABLE public.spree_policy_translations OWNER TO postgres;

--
-- Name: spree_policy_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_policy_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_policy_translations_id_seq OWNER TO postgres;

--
-- Name: spree_policy_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_policy_translations_id_seq OWNED BY public.spree_policy_translations.id;


--
-- Name: spree_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_preferences (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    key character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    value text
);


ALTER TABLE public.spree_preferences OWNER TO postgres;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_preferences_id_seq OWNER TO postgres;

--
-- Name: spree_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_preferences_id_seq OWNED BY public.spree_preferences.id;


--
-- Name: spree_price_adjustment_tiers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_price_adjustment_tiers (
    id bigint NOT NULL,
    price_list_id bigint NOT NULL,
    min_quantity integer DEFAULT 1 NOT NULL,
    percentage numeric(6,3) DEFAULT 0.0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_price_adjustment_tiers OWNER TO postgres;

--
-- Name: spree_price_adjustment_tiers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_price_adjustment_tiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_price_adjustment_tiers_id_seq OWNER TO postgres;

--
-- Name: spree_price_adjustment_tiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_price_adjustment_tiers_id_seq OWNED BY public.spree_price_adjustment_tiers.id;


--
-- Name: spree_price_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_price_histories (
    id bigint NOT NULL,
    amount numeric(10,2) NOT NULL,
    compare_at_amount numeric(10,2),
    created_at timestamp(6) without time zone NOT NULL,
    currency character varying NOT NULL,
    price_id bigint NOT NULL,
    recorded_at timestamp(6) without time zone NOT NULL,
    variant_id bigint NOT NULL
);


ALTER TABLE public.spree_price_histories OWNER TO postgres;

--
-- Name: spree_price_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_price_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_price_histories_id_seq OWNER TO postgres;

--
-- Name: spree_price_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_price_histories_id_seq OWNED BY public.spree_price_histories.id;


--
-- Name: spree_price_lists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_price_lists (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone,
    description text,
    ends_at timestamp(6) without time zone,
    match_policy character varying DEFAULT 'all'::character varying NOT NULL,
    name character varying NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    starts_at timestamp(6) without time zone,
    status character varying DEFAULT 'draft'::character varying NOT NULL,
    store_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    catalog_id bigint,
    price_adjustment_percentage numeric(6,3),
    adjust_compare_at boolean DEFAULT false NOT NULL
);


ALTER TABLE public.spree_price_lists OWNER TO postgres;

--
-- Name: spree_price_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_price_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_price_lists_id_seq OWNER TO postgres;

--
-- Name: spree_price_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_price_lists_id_seq OWNED BY public.spree_price_lists.id;


--
-- Name: spree_price_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_price_rules (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    preferences text,
    price_list_id bigint NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_price_rules OWNER TO postgres;

--
-- Name: spree_price_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_price_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_price_rules_id_seq OWNER TO postgres;

--
-- Name: spree_price_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_price_rules_id_seq OWNED BY public.spree_price_rules.id;


--
-- Name: spree_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_prices (
    id bigint NOT NULL,
    amount numeric(10,2),
    compare_at_amount numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    currency character varying,
    deleted_at timestamp without time zone,
    price_list_id bigint,
    updated_at timestamp without time zone NOT NULL,
    variant_id bigint NOT NULL,
    min_quantity integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.spree_prices OWNER TO postgres;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_prices_id_seq OWNER TO postgres;

--
-- Name: spree_prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_prices_id_seq OWNED BY public.spree_prices.id;


--
-- Name: spree_product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_categories (
    id bigint NOT NULL,
    category_id bigint,
    created_at timestamp without time zone,
    "position" integer,
    product_id bigint,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_product_categories OWNER TO postgres;

--
-- Name: spree_product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_categories_id_seq OWNER TO postgres;

--
-- Name: spree_product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_categories_id_seq OWNED BY public.spree_product_categories.id;


--
-- Name: spree_product_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_collections (
    id bigint NOT NULL,
    collection_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    "position" integer,
    product_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_product_collections OWNER TO postgres;

--
-- Name: spree_product_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_collections_id_seq OWNER TO postgres;

--
-- Name: spree_product_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_collections_id_seq OWNED BY public.spree_product_collections.id;


--
-- Name: spree_product_option_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_option_types (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    option_type_id bigint,
    "position" integer,
    product_id bigint,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_product_option_types OWNER TO postgres;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_option_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_option_types_id_seq OWNER TO postgres;

--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_option_types_id_seq OWNED BY public.spree_product_option_types.id;


--
-- Name: spree_product_promotion_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_promotion_rules (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    product_id bigint,
    promotion_rule_id bigint,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_product_promotion_rules OWNER TO postgres;

--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_promotion_rules_id_seq OWNER TO postgres;

--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_promotion_rules_id_seq OWNED BY public.spree_product_promotion_rules.id;


--
-- Name: spree_product_publications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_publications (
    id bigint NOT NULL,
    channel_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    product_id bigint NOT NULL,
    published_at timestamp(6) without time zone,
    unpublished_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_product_publications OWNER TO postgres;

--
-- Name: spree_product_publications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_publications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_publications_id_seq OWNER TO postgres;

--
-- Name: spree_product_publications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_publications_id_seq OWNED BY public.spree_product_publications.id;


--
-- Name: spree_product_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_submissions (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    status character varying NOT NULL,
    submitted_by_id bigint,
    reviewed_by_id bigint,
    reviewed_at timestamp(6) without time zone,
    review_note text,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_product_submissions OWNER TO postgres;

--
-- Name: spree_product_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_submissions_id_seq OWNER TO postgres;

--
-- Name: spree_product_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_submissions_id_seq OWNED BY public.spree_product_submissions.id;


--
-- Name: spree_product_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_translations (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    description text,
    locale character varying NOT NULL,
    meta_description text,
    meta_keywords character varying,
    meta_title character varying,
    name character varying,
    slug character varying,
    spree_product_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_product_translations OWNER TO postgres;

--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_translations_id_seq OWNER TO postgres;

--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_translations_id_seq OWNED BY public.spree_product_translations.id;


--
-- Name: spree_product_type_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_type_categories (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    product_type_id bigint,
    category_id bigint,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_product_type_categories OWNER TO postgres;

--
-- Name: spree_product_type_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_type_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_type_categories_id_seq OWNER TO postgres;

--
-- Name: spree_product_type_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_type_categories_id_seq OWNED BY public.spree_product_type_categories.id;


--
-- Name: spree_product_type_custom_field_definitions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_type_custom_field_definitions (
    id bigint NOT NULL,
    product_type_id bigint NOT NULL,
    custom_field_definition_id bigint NOT NULL,
    required boolean DEFAULT false NOT NULL,
    sort_order integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_product_type_custom_field_definitions OWNER TO postgres;

--
-- Name: spree_product_type_custom_field_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_type_custom_field_definitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_type_custom_field_definitions_id_seq OWNER TO postgres;

--
-- Name: spree_product_type_custom_field_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_type_custom_field_definitions_id_seq OWNED BY public.spree_product_type_custom_field_definitions.id;


--
-- Name: spree_product_type_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_type_translations (
    id bigint NOT NULL,
    name character varying,
    locale character varying NOT NULL,
    spree_product_type_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_product_type_translations OWNER TO postgres;

--
-- Name: spree_product_type_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_type_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_type_translations_id_seq OWNER TO postgres;

--
-- Name: spree_product_type_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_type_translations_id_seq OWNED BY public.spree_product_type_translations.id;


--
-- Name: spree_product_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_product_types (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    metadata jsonb,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint,
    products_count integer DEFAULT 0 NOT NULL,
    delivery_profile_id bigint
);


ALTER TABLE public.spree_product_types OWNER TO postgres;

--
-- Name: spree_product_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_product_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_product_types_id_seq OWNER TO postgres;

--
-- Name: spree_product_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_product_types_id_seq OWNED BY public.spree_product_types.id;


--
-- Name: spree_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_products (
    id bigint NOT NULL,
    available_on timestamp without time zone,
    categories_count integer DEFAULT 0 NOT NULL,
    collections_count integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    default_variant_id bigint,
    deleted_at timestamp without time zone,
    description text,
    discontinue_on timestamp without time zone,
    make_active_at timestamp without time zone,
    media_count integer DEFAULT 0 NOT NULL,
    meta_description text,
    meta_keywords character varying,
    meta_title character varying,
    name character varying DEFAULT ''::character varying NOT NULL,
    primary_media_id bigint,
    metadata jsonb,
    promotionable boolean DEFAULT true,
    revenue numeric(16,4) DEFAULT 0.0 NOT NULL,
    delivery_profile_id bigint,
    slug character varying,
    status character varying DEFAULT 'draft'::character varying NOT NULL,
    store_id bigint,
    tax_category_id bigint,
    units_sold_count integer DEFAULT 0 NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    variant_count integer DEFAULT 0 NOT NULL,
    product_type_id bigint,
    seller_id bigint
);


ALTER TABLE public.spree_products OWNER TO postgres;

--
-- Name: spree_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_products_id_seq OWNER TO postgres;

--
-- Name: spree_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_products_id_seq OWNED BY public.spree_products.id;


--
-- Name: spree_products_stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_products_stores (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    product_id bigint,
    revenue numeric(10,2) DEFAULT 0.0 NOT NULL,
    store_id bigint,
    units_sold_count integer DEFAULT 0 NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_products_stores OWNER TO postgres;

--
-- Name: spree_products_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_products_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_products_stores_id_seq OWNER TO postgres;

--
-- Name: spree_products_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_products_stores_id_seq OWNED BY public.spree_products_stores.id;


--
-- Name: spree_promotion_action_line_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_promotion_action_line_items (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    promotion_action_id bigint,
    quantity integer DEFAULT 1,
    updated_at timestamp without time zone,
    variant_id bigint
);


ALTER TABLE public.spree_promotion_action_line_items OWNER TO postgres;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_promotion_action_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_promotion_action_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_promotion_action_line_items_id_seq OWNED BY public.spree_promotion_action_line_items.id;


--
-- Name: spree_promotion_actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_promotion_actions (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    "position" integer,
    promotion_id bigint,
    type character varying,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_promotion_actions OWNER TO postgres;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_promotion_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_promotion_actions_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_promotion_actions_id_seq OWNED BY public.spree_promotion_actions.id;


--
-- Name: spree_promotion_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_promotion_categories (
    id bigint NOT NULL,
    code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_promotion_categories OWNER TO postgres;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_promotion_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_promotion_categories_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_promotion_categories_id_seq OWNED BY public.spree_promotion_categories.id;


--
-- Name: spree_promotion_rule_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_promotion_rule_categories (
    id bigint NOT NULL,
    category_id bigint,
    created_at timestamp without time zone,
    promotion_rule_id bigint,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_promotion_rule_categories OWNER TO postgres;

--
-- Name: spree_promotion_rule_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_promotion_rule_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_promotion_rule_categories_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_rule_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_promotion_rule_categories_id_seq OWNED BY public.spree_promotion_rule_categories.id;


--
-- Name: spree_promotion_rule_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_promotion_rule_users (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    promotion_rule_id bigint,
    updated_at timestamp without time zone,
    customer_id bigint
);


ALTER TABLE public.spree_promotion_rule_users OWNER TO postgres;

--
-- Name: spree_promotion_rule_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_promotion_rule_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_promotion_rule_users_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_rule_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_promotion_rule_users_id_seq OWNED BY public.spree_promotion_rule_users.id;


--
-- Name: spree_promotion_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_promotion_rules (
    id bigint NOT NULL,
    code character varying,
    created_at timestamp(6) without time zone NOT NULL,
    preferences text,
    product_group_id bigint,
    promotion_id bigint,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.spree_promotion_rules OWNER TO postgres;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_promotion_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_promotion_rules_id_seq OWNER TO postgres;

--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_promotion_rules_id_seq OWNED BY public.spree_promotion_rules.id;


--
-- Name: spree_promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_promotions (
    id bigint NOT NULL,
    advertise boolean DEFAULT false,
    code character varying,
    code_prefix character varying,
    created_at timestamp(6) without time zone NOT NULL,
    description character varying,
    expires_at timestamp without time zone,
    kind integer DEFAULT 0,
    match_policy character varying DEFAULT 'all'::character varying,
    multi_codes boolean DEFAULT false,
    name character varying,
    number_of_codes integer,
    path character varying,
    metadata jsonb,
    promotion_category_id bigint,
    starts_at timestamp without time zone,
    store_id bigint,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    usage_limit integer
);


ALTER TABLE public.spree_promotions OWNER TO postgres;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_promotions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_promotions_id_seq OWNER TO postgres;

--
-- Name: spree_promotions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_promotions_id_seq OWNED BY public.spree_promotions.id;


--
-- Name: spree_promotions_stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_promotions_stores (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    promotion_id bigint,
    store_id bigint,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.spree_promotions_stores OWNER TO postgres;

--
-- Name: spree_promotions_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_promotions_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_promotions_stores_id_seq OWNER TO postgres;

--
-- Name: spree_promotions_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_promotions_stores_id_seq OWNED BY public.spree_promotions_stores.id;


--
-- Name: spree_purchase_order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_purchase_order_items (
    id bigint NOT NULL,
    purchase_order_id bigint NOT NULL,
    variant_id bigint NOT NULL,
    quantity_ordered integer DEFAULT 0 NOT NULL,
    quantity_received integer DEFAULT 0 NOT NULL,
    unit_cost numeric(10,2) DEFAULT 0.0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    quantity_rejected integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.spree_purchase_order_items OWNER TO postgres;

--
-- Name: spree_purchase_order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_purchase_order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_purchase_order_items_id_seq OWNER TO postgres;

--
-- Name: spree_purchase_order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_purchase_order_items_id_seq OWNED BY public.spree_purchase_order_items.id;


--
-- Name: spree_purchase_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_purchase_orders (
    id bigint NOT NULL,
    number character varying NOT NULL,
    status character varying,
    currency character varying NOT NULL,
    reference character varying,
    supplier_id bigint NOT NULL,
    store_id bigint NOT NULL,
    destination_location_id bigint NOT NULL,
    expected_at date,
    ordered_at timestamp(6) without time zone,
    received_at timestamp(6) without time zone,
    notes text,
    created_by_id bigint,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    cancel_by date,
    closed_short_at timestamp(6) without time zone,
    close_reason text
);


ALTER TABLE public.spree_purchase_orders OWNER TO postgres;

--
-- Name: spree_purchase_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_purchase_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_purchase_orders_id_seq OWNER TO postgres;

--
-- Name: spree_purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_purchase_orders_id_seq OWNED BY public.spree_purchase_orders.id;


--
-- Name: spree_refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_refresh_tokens (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    ip_address character varying,
    token character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_agent character varying,
    user_id bigint NOT NULL,
    user_type character varying NOT NULL,
    audience character varying
);


ALTER TABLE public.spree_refresh_tokens OWNER TO postgres;

--
-- Name: spree_refresh_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_refresh_tokens_id_seq OWNER TO postgres;

--
-- Name: spree_refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_refresh_tokens_id_seq OWNED BY public.spree_refresh_tokens.id;


--
-- Name: spree_refund_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_refund_reasons (
    id bigint NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint NOT NULL
);


ALTER TABLE public.spree_refund_reasons OWNER TO postgres;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_refund_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_refund_reasons_id_seq OWNER TO postgres;

--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_refund_reasons_id_seq OWNED BY public.spree_refund_reasons.id;


--
-- Name: spree_refunds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_refunds (
    id bigint NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    payment_id bigint,
    metadata jsonb,
    refund_reason_id bigint,
    refunder_id bigint,
    reimbursement_id bigint,
    transaction_id character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    originator_type character varying,
    originator_id bigint,
    order_id bigint,
    refunder_type character varying
);


ALTER TABLE public.spree_refunds OWNER TO postgres;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_refunds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_refunds_id_seq OWNER TO postgres;

--
-- Name: spree_refunds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_refunds_id_seq OWNED BY public.spree_refunds.id;


--
-- Name: spree_reimbursement_credits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_reimbursement_credits (
    id bigint NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    created_at timestamp without time zone,
    creditable_id bigint,
    creditable_type character varying,
    reimbursement_id bigint,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_reimbursement_credits OWNER TO postgres;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_reimbursement_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_reimbursement_credits_id_seq OWNER TO postgres;

--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_reimbursement_credits_id_seq OWNED BY public.spree_reimbursement_credits.id;


--
-- Name: spree_reimbursement_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_reimbursement_types (
    id bigint NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    mutable boolean DEFAULT true,
    name character varying,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_reimbursement_types OWNER TO postgres;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_reimbursement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_reimbursement_types_id_seq OWNER TO postgres;

--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_reimbursement_types_id_seq OWNED BY public.spree_reimbursement_types.id;


--
-- Name: spree_reimbursements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_reimbursements (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    customer_return_id bigint,
    number character varying,
    order_id bigint,
    performed_by_id bigint,
    reimbursement_status character varying,
    total numeric(10,2),
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_reimbursements OWNER TO postgres;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_reimbursements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_reimbursements_id_seq OWNER TO postgres;

--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_reimbursements_id_seq OWNED BY public.spree_reimbursements.id;


--
-- Name: spree_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_reports (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    currency character varying,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    store_id bigint NOT NULL,
    type character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.spree_reports OWNER TO postgres;

--
-- Name: spree_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_reports_id_seq OWNER TO postgres;

--
-- Name: spree_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_reports_id_seq OWNED BY public.spree_reports.id;


--
-- Name: spree_return_authorizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_return_authorizations (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    memo text,
    number character varying,
    order_id bigint,
    return_authorization_reason_id bigint,
    state character varying,
    stock_location_id bigint,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_return_authorizations OWNER TO postgres;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_return_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_return_authorizations_id_seq OWNER TO postgres;

--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_return_authorizations_id_seq OWNED BY public.spree_return_authorizations.id;


--
-- Name: spree_return_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_return_items (
    id bigint NOT NULL,
    acceptance_status character varying,
    acceptance_status_errors text,
    additional_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    customer_return_id bigint,
    exchange_variant_id bigint,
    included_tax_total numeric(12,4) DEFAULT 0.0 NOT NULL,
    fulfillment_item_id bigint,
    override_reimbursement_type_id bigint,
    pre_tax_amount numeric(12,4) DEFAULT 0.0 NOT NULL,
    preferred_reimbursement_type_id bigint,
    reception_status character varying,
    reimbursement_id bigint,
    resellable boolean DEFAULT true NOT NULL,
    return_authorization_id bigint,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_return_items OWNER TO postgres;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_return_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_return_items_id_seq OWNER TO postgres;

--
-- Name: spree_return_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_return_items_id_seq OWNED BY public.spree_return_items.id;


--
-- Name: spree_return_line_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_return_line_items (
    id bigint NOT NULL,
    return_id bigint NOT NULL,
    fulfillment_item_id bigint NOT NULL,
    line_item_id bigint NOT NULL,
    variant_id bigint NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    received_quantity integer DEFAULT 0 NOT NULL,
    pre_tax_amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    resellable boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_return_line_items OWNER TO postgres;

--
-- Name: spree_return_line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_return_line_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_return_line_items_id_seq OWNER TO postgres;

--
-- Name: spree_return_line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_return_line_items_id_seq OWNED BY public.spree_return_line_items.id;


--
-- Name: spree_return_reasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_return_reasons (
    id bigint NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint NOT NULL
);


ALTER TABLE public.spree_return_reasons OWNER TO postgres;

--
-- Name: spree_return_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_return_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_return_reasons_id_seq OWNER TO postgres;

--
-- Name: spree_return_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_return_reasons_id_seq OWNED BY public.spree_return_reasons.id;


--
-- Name: spree_returns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_returns (
    id bigint NOT NULL,
    number character varying NOT NULL,
    store_id bigint NOT NULL,
    order_id bigint NOT NULL,
    stock_location_id bigint NOT NULL,
    reason_id bigint,
    created_by_id bigint,
    status character varying NOT NULL,
    memo text,
    approved_at timestamp(6) without time zone,
    received_at timestamp(6) without time zone,
    refunded_at timestamp(6) without time zone,
    canceled_at timestamp(6) without time zone,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    created_by_type character varying
);


ALTER TABLE public.spree_returns OWNER TO postgres;

--
-- Name: spree_returns_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_returns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_returns_id_seq OWNER TO postgres;

--
-- Name: spree_returns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_returns_id_seq OWNED BY public.spree_returns.id;


--
-- Name: spree_role_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_role_users (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    invitation_id bigint,
    role_id bigint,
    updated_at timestamp without time zone,
    user_id bigint,
    user_type character varying NOT NULL
);


ALTER TABLE public.spree_role_users OWNER TO postgres;

--
-- Name: spree_role_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_role_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_role_users_id_seq OWNER TO postgres;

--
-- Name: spree_role_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_role_users_id_seq OWNED BY public.spree_role_users.id;


--
-- Name: spree_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_roles (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    name character varying,
    updated_at timestamp without time zone,
    description character varying,
    mutable boolean DEFAULT true NOT NULL,
    permissions jsonb,
    resource_type character varying NOT NULL,
    resource_id bigint NOT NULL
);


ALTER TABLE public.spree_roles OWNER TO postgres;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_roles_id_seq OWNER TO postgres;

--
-- Name: spree_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_roles_id_seq OWNED BY public.spree_roles.id;


--
-- Name: spree_saved_reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_saved_reports (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    user_id bigint,
    name character varying NOT NULL,
    description text,
    query jsonb NOT NULL,
    seeded boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_saved_reports OWNER TO postgres;

--
-- Name: spree_saved_reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_saved_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_saved_reports_id_seq OWNER TO postgres;

--
-- Name: spree_saved_reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_saved_reports_id_seq OWNED BY public.spree_saved_reports.id;


--
-- Name: spree_seller_payouts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_seller_payouts (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    currency character varying NOT NULL,
    status character varying NOT NULL,
    period_start timestamp(6) without time zone,
    period_end timestamp(6) without time zone,
    provider character varying NOT NULL,
    reference character varying,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_seller_payouts OWNER TO postgres;

--
-- Name: spree_seller_payouts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_seller_payouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_seller_payouts_id_seq OWNER TO postgres;

--
-- Name: spree_seller_payouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_seller_payouts_id_seq OWNED BY public.spree_seller_payouts.id;


--
-- Name: spree_seller_requirement_custom_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_seller_requirement_custom_fields (
    id bigint NOT NULL,
    seller_requirement_id bigint NOT NULL,
    custom_field_definition_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_seller_requirement_custom_fields OWNER TO postgres;

--
-- Name: spree_seller_requirement_custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_seller_requirement_custom_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_seller_requirement_custom_fields_id_seq OWNER TO postgres;

--
-- Name: spree_seller_requirement_custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_seller_requirement_custom_fields_id_seq OWNED BY public.spree_seller_requirement_custom_fields.id;


--
-- Name: spree_seller_requirement_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_seller_requirement_submissions (
    id bigint NOT NULL,
    seller_id bigint NOT NULL,
    seller_requirement_id bigint NOT NULL,
    status character varying NOT NULL,
    submitted_by_id bigint,
    reviewed_by_id bigint,
    reviewed_at timestamp(6) without time zone,
    note text,
    review_note text,
    reference character varying,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_seller_requirement_submissions OWNER TO postgres;

--
-- Name: spree_seller_requirement_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_seller_requirement_submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_seller_requirement_submissions_id_seq OWNER TO postgres;

--
-- Name: spree_seller_requirement_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_seller_requirement_submissions_id_seq OWNED BY public.spree_seller_requirement_submissions.id;


--
-- Name: spree_seller_requirements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_seller_requirements (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    type character varying NOT NULL,
    name character varying,
    description text,
    "position" integer DEFAULT 0 NOT NULL,
    active boolean DEFAULT true NOT NULL,
    required boolean DEFAULT true NOT NULL,
    preferences text,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_seller_requirements OWNER TO postgres;

--
-- Name: spree_seller_requirements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_seller_requirements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_seller_requirements_id_seq OWNER TO postgres;

--
-- Name: spree_seller_requirements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_seller_requirements_id_seq OWNED BY public.spree_seller_requirements.id;


--
-- Name: spree_seller_transfers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_seller_transfers (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    seller_id bigint NOT NULL,
    order_id bigint NOT NULL,
    payout_id bigint,
    reversed_from_id bigint,
    refund_id bigint,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    currency character varying NOT NULL,
    kind character varying NOT NULL,
    status character varying NOT NULL,
    provider character varying NOT NULL,
    reference character varying,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    settled_amount numeric(10,2) NOT NULL,
    settled_currency character varying NOT NULL
);


ALTER TABLE public.spree_seller_transfers OWNER TO postgres;

--
-- Name: spree_seller_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_seller_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_seller_transfers_id_seq OWNER TO postgres;

--
-- Name: spree_seller_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_seller_transfers_id_seq OWNED BY public.spree_seller_transfers.id;


--
-- Name: spree_seller_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_seller_translations (
    id bigint NOT NULL,
    name character varying,
    about text,
    locale character varying NOT NULL,
    spree_seller_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.spree_seller_translations OWNER TO postgres;

--
-- Name: spree_seller_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_seller_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_seller_translations_id_seq OWNER TO postgres;

--
-- Name: spree_seller_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_seller_translations_id_seq OWNED BY public.spree_seller_translations.id;


--
-- Name: spree_sellers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_sellers (
    id bigint NOT NULL,
    store_id bigint NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    status character varying NOT NULL,
    contact_email character varying,
    billing_email character varying,
    about text,
    billing_address_id bigint,
    terms_accepted_at timestamp(6) without time zone,
    holiday_mode_until timestamp(6) without time zone,
    payouts_schedule_interval character varying,
    minimum_payout_amount numeric(10,2),
    tax_remittance character varying DEFAULT 'seller'::character varying NOT NULL,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone,
    legal_name character varying,
    registration_number character varying,
    payouts_enabled_at timestamp(6) without time zone
);


ALTER TABLE public.spree_sellers OWNER TO postgres;

--
-- Name: spree_sellers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_sellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_sellers_id_seq OWNER TO postgres;

--
-- Name: spree_sellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_sellers_id_seq OWNED BY public.spree_sellers.id;


--
-- Name: spree_shipping_labels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_shipping_labels (
    id bigint NOT NULL,
    owner_type character varying NOT NULL,
    owner_id bigint NOT NULL,
    store_id bigint NOT NULL,
    integration_id bigint,
    source character varying NOT NULL,
    external_id character varying,
    carrier character varying,
    service character varying,
    tracking_number character varying,
    cost numeric(10,2) DEFAULT 0.0 NOT NULL,
    currency character varying,
    format character varying,
    status character varying NOT NULL,
    refunded_at timestamp(6) without time zone,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_shipping_labels OWNER TO postgres;

--
-- Name: spree_shipping_labels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_shipping_labels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_shipping_labels_id_seq OWNER TO postgres;

--
-- Name: spree_shipping_labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_shipping_labels_id_seq OWNED BY public.spree_shipping_labels.id;


--
-- Name: spree_shipping_method_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_shipping_method_categories (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    shipping_category_id bigint NOT NULL,
    shipping_method_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_shipping_method_categories OWNER TO postgres;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_shipping_method_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_shipping_method_categories_id_seq OWNER TO postgres;

--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_shipping_method_categories_id_seq OWNED BY public.spree_shipping_method_categories.id;


--
-- Name: spree_state_changes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_state_changes (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    next_state character varying,
    previous_state character varying,
    stateful_id bigint,
    stateful_type character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.spree_state_changes OWNER TO postgres;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_state_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_state_changes_id_seq OWNER TO postgres;

--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_state_changes_id_seq OWNED BY public.spree_state_changes.id;


--
-- Name: spree_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_states (
    id bigint NOT NULL,
    abbr character varying,
    country_id bigint,
    created_at timestamp without time zone,
    name character varying,
    updated_at timestamp without time zone
);


ALTER TABLE public.spree_states OWNER TO postgres;

--
-- Name: spree_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_states_id_seq OWNER TO postgres;

--
-- Name: spree_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_states_id_seq OWNED BY public.spree_states.id;


--
-- Name: spree_stock_levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stock_levels (
    id bigint NOT NULL,
    backorderable boolean DEFAULT false,
    count_on_hand integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    metadata jsonb,
    stock_location_id bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    variant_id bigint,
    allocated_count integer DEFAULT 0 NOT NULL,
    reserved_count integer DEFAULT 0 NOT NULL,
    incoming_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.spree_stock_levels OWNER TO postgres;

--
-- Name: spree_stock_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stock_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stock_levels_id_seq OWNER TO postgres;

--
-- Name: spree_stock_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stock_levels_id_seq OWNED BY public.spree_stock_levels.id;


--
-- Name: spree_stock_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stock_locations (
    id bigint NOT NULL,
    active boolean DEFAULT true,
    address1 character varying,
    address2 character varying,
    admin_name character varying,
    backorderable_default boolean DEFAULT false,
    city character varying,
    company character varying,
    country_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    "default" boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    kind character varying DEFAULT 'warehouse'::character varying NOT NULL,
    name character varying,
    phone character varying,
    pickup_enabled boolean DEFAULT false NOT NULL,
    pickup_instructions text,
    pickup_ready_in_minutes integer,
    pickup_stock_policy character varying DEFAULT 'local'::character varying NOT NULL,
    propagate_all_variants boolean DEFAULT false,
    state_id bigint,
    state_name character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    zipcode character varying,
    store_id bigint,
    country_code character varying,
    state_code character varying,
    seller_id bigint,
    returns_enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.spree_stock_locations OWNER TO postgres;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stock_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stock_locations_id_seq OWNER TO postgres;

--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stock_locations_id_seq OWNED BY public.spree_stock_locations.id;


--
-- Name: spree_stock_movements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stock_movements (
    id bigint NOT NULL,
    action character varying,
    created_at timestamp(6) without time zone NOT NULL,
    originator_id bigint,
    originator_type character varying,
    quantity integer DEFAULT 0,
    stock_level_id bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    kind character varying,
    reason character varying,
    order_id bigint,
    fulfillment_id bigint,
    return_id bigint,
    exchange_id bigint,
    stock_transfer_id bigint,
    purchase_order_id bigint,
    unit_cost numeric(10,2),
    stock_receipt_id bigint
);


ALTER TABLE public.spree_stock_movements OWNER TO postgres;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stock_movements_id_seq OWNER TO postgres;

--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stock_movements_id_seq OWNED BY public.spree_stock_movements.id;


--
-- Name: spree_stock_receipt_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stock_receipt_items (
    id bigint NOT NULL,
    stock_receipt_id bigint NOT NULL,
    line_type character varying NOT NULL,
    line_id bigint NOT NULL,
    quantity_accepted integer DEFAULT 0 NOT NULL,
    quantity_rejected integer DEFAULT 0 NOT NULL,
    rejection_reason character varying,
    notes text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_stock_receipt_items OWNER TO postgres;

--
-- Name: spree_stock_receipt_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stock_receipt_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stock_receipt_items_id_seq OWNER TO postgres;

--
-- Name: spree_stock_receipt_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stock_receipt_items_id_seq OWNED BY public.spree_stock_receipt_items.id;


--
-- Name: spree_stock_receipts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stock_receipts (
    id bigint NOT NULL,
    number character varying NOT NULL,
    store_id bigint NOT NULL,
    receivable_type character varying NOT NULL,
    receivable_id bigint NOT NULL,
    reference character varying,
    received_at timestamp(6) without time zone NOT NULL,
    received_by_id bigint,
    notes text,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    received_by_type character varying
);


ALTER TABLE public.spree_stock_receipts OWNER TO postgres;

--
-- Name: spree_stock_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stock_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stock_receipts_id_seq OWNER TO postgres;

--
-- Name: spree_stock_receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stock_receipts_id_seq OWNED BY public.spree_stock_receipts.id;


--
-- Name: spree_stock_reservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stock_reservations (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    expires_at timestamp(6) without time zone NOT NULL,
    line_item_id bigint NOT NULL,
    order_id bigint,
    quantity integer NOT NULL,
    stock_level_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    cart_id bigint
);


ALTER TABLE public.spree_stock_reservations OWNER TO postgres;

--
-- Name: spree_stock_reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stock_reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stock_reservations_id_seq OWNER TO postgres;

--
-- Name: spree_stock_reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stock_reservations_id_seq OWNED BY public.spree_stock_reservations.id;


--
-- Name: spree_stock_transfer_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stock_transfer_items (
    id bigint NOT NULL,
    stock_transfer_id bigint NOT NULL,
    variant_id bigint NOT NULL,
    quantity_shipped integer DEFAULT 0 NOT NULL,
    quantity_received integer DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    quantity_rejected integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.spree_stock_transfer_items OWNER TO postgres;

--
-- Name: spree_stock_transfer_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stock_transfer_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stock_transfer_items_id_seq OWNER TO postgres;

--
-- Name: spree_stock_transfer_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stock_transfer_items_id_seq OWNED BY public.spree_stock_transfer_items.id;


--
-- Name: spree_stock_transfers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stock_transfers (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    destination_location_id bigint,
    number character varying,
    metadata jsonb,
    reference character varying,
    source_location_id bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint,
    status character varying,
    shipped_at timestamp(6) without time zone,
    received_at timestamp(6) without time zone,
    notes text,
    created_by_id bigint,
    deleted_at timestamp(6) without time zone,
    closed_short_at timestamp(6) without time zone,
    close_reason text
);


ALTER TABLE public.spree_stock_transfers OWNER TO postgres;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stock_transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stock_transfers_id_seq OWNER TO postgres;

--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stock_transfers_id_seq OWNED BY public.spree_stock_transfers.id;


--
-- Name: spree_store_credit_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_store_credit_categories (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_store_credit_categories OWNER TO postgres;

--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_store_credit_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_store_credit_categories_id_seq OWNER TO postgres;

--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_store_credit_categories_id_seq OWNED BY public.spree_store_credit_categories.id;


--
-- Name: spree_store_credit_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_store_credit_events (
    id bigint NOT NULL,
    action character varying NOT NULL,
    amount numeric(8,2),
    authorization_code character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    originator_id bigint,
    originator_type character varying,
    store_credit_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_total_amount numeric(8,2) DEFAULT 0.0 NOT NULL
);


ALTER TABLE public.spree_store_credit_events OWNER TO postgres;

--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_store_credit_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_store_credit_events_id_seq OWNER TO postgres;

--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_store_credit_events_id_seq OWNED BY public.spree_store_credit_events.id;


--
-- Name: spree_store_credit_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_store_credit_types (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    priority integer,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_store_credit_types OWNER TO postgres;

--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_store_credit_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_store_credit_types_id_seq OWNER TO postgres;

--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_store_credit_types_id_seq OWNED BY public.spree_store_credit_types.id;


--
-- Name: spree_store_credits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_store_credits (
    id bigint NOT NULL,
    amount numeric(8,2) DEFAULT 0.0 NOT NULL,
    amount_authorized numeric(8,2) DEFAULT 0.0 NOT NULL,
    amount_used numeric(8,2) DEFAULT 0.0 NOT NULL,
    category_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    created_by_id bigint,
    currency character varying,
    deleted_at timestamp without time zone,
    memo text,
    originator_id bigint,
    originator_type character varying,
    metadata jsonb,
    store_id bigint,
    type_id bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id bigint,
    refunded_order_id bigint
);


ALTER TABLE public.spree_store_credits OWNER TO postgres;

--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_store_credits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_store_credits_id_seq OWNER TO postgres;

--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_store_credits_id_seq OWNED BY public.spree_store_credits.id;


--
-- Name: spree_store_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_store_translations (
    id bigint NOT NULL,
    address text,
    contact_phone character varying,
    created_at timestamp(6) without time zone NOT NULL,
    customer_support_email character varying,
    deleted_at timestamp without time zone,
    description text,
    facebook character varying,
    instagram character varying,
    locale character varying NOT NULL,
    meta_description text,
    meta_keywords text,
    name character varying,
    new_order_notifications_email character varying,
    seo_title character varying,
    spree_store_id bigint NOT NULL,
    twitter character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_store_translations OWNER TO postgres;

--
-- Name: spree_store_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_store_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_store_translations_id_seq OWNER TO postgres;

--
-- Name: spree_store_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_store_translations_id_seq OWNED BY public.spree_store_translations.id;


--
-- Name: spree_stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stores (
    id bigint NOT NULL,
    address text,
    checkout_zone_id bigint,
    code character varying,
    contact_phone character varying,
    created_at timestamp(6) without time zone NOT NULL,
    customer_support_email character varying,
    "default" boolean DEFAULT false NOT NULL,
    default_country_id bigint,
    default_currency character varying,
    default_locale character varying,
    deleted_at timestamp without time zone,
    description text,
    facebook character varying,
    instagram character varying,
    mail_from_address character varying,
    meta_description text,
    meta_keywords text,
    name character varying,
    new_order_notifications_email character varying,
    preferences text,
    metadata jsonb,
    seo_robots character varying,
    seo_title character varying,
    settings jsonb,
    storefront_custom_code_body_end text,
    storefront_custom_code_body_start text,
    storefront_custom_code_head text,
    supported_currencies character varying,
    supported_locales character varying,
    twitter character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    url character varying,
    default_country_code character varying,
    setup_token character varying
);


ALTER TABLE public.spree_stores OWNER TO postgres;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stores_id_seq OWNER TO postgres;

--
-- Name: spree_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stores_id_seq OWNED BY public.spree_stores.id;


--
-- Name: spree_stripe_payment_intents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stripe_payment_intents (
    id bigint NOT NULL,
    amount numeric(10,2) DEFAULT 0.0 NOT NULL,
    client_secret character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    customer_id character varying,
    ephemeral_key_secret character varying,
    order_id bigint NOT NULL,
    payment_method_id bigint NOT NULL,
    stripe_id character varying NOT NULL,
    stripe_payment_method_id character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_stripe_payment_intents OWNER TO postgres;

--
-- Name: spree_stripe_payment_intents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stripe_payment_intents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stripe_payment_intents_id_seq OWNER TO postgres;

--
-- Name: spree_stripe_payment_intents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stripe_payment_intents_id_seq OWNED BY public.spree_stripe_payment_intents.id;


--
-- Name: spree_stripe_payment_methods_webhook_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stripe_payment_methods_webhook_keys (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    payment_method_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    webhook_key_id bigint NOT NULL
);


ALTER TABLE public.spree_stripe_payment_methods_webhook_keys OWNER TO postgres;

--
-- Name: spree_stripe_payment_methods_webhook_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stripe_payment_methods_webhook_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stripe_payment_methods_webhook_keys_id_seq OWNER TO postgres;

--
-- Name: spree_stripe_payment_methods_webhook_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stripe_payment_methods_webhook_keys_id_seq OWNED BY public.spree_stripe_payment_methods_webhook_keys.id;


--
-- Name: spree_stripe_webhook_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_stripe_webhook_keys (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    signing_secret character varying NOT NULL,
    stripe_id character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_stripe_webhook_keys OWNER TO postgres;

--
-- Name: spree_stripe_webhook_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_stripe_webhook_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_stripe_webhook_keys_id_seq OWNER TO postgres;

--
-- Name: spree_stripe_webhook_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_stripe_webhook_keys_id_seq OWNED BY public.spree_stripe_webhook_keys.id;


--
-- Name: spree_suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_suppliers (
    id bigint NOT NULL,
    name character varying NOT NULL,
    contact_name character varying,
    email character varying,
    phone character varying,
    notes text,
    store_id bigint NOT NULL,
    purchase_orders_count integer DEFAULT 0 NOT NULL,
    address1 character varying,
    address2 character varying,
    city character varying,
    state_name character varying,
    state_code character varying,
    country_code character varying,
    postal_code character varying,
    metadata jsonb,
    deleted_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_suppliers OWNER TO postgres;

--
-- Name: spree_suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_suppliers_id_seq OWNER TO postgres;

--
-- Name: spree_suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_suppliers_id_seq OWNED BY public.spree_suppliers.id;


--
-- Name: spree_taggings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_taggings (
    id bigint NOT NULL,
    context character varying(128),
    created_at timestamp without time zone,
    tag_id bigint,
    taggable_id bigint,
    taggable_type character varying,
    tagger_id bigint,
    tagger_type character varying,
    tenant character varying(128)
);


ALTER TABLE public.spree_taggings OWNER TO postgres;

--
-- Name: spree_taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_taggings_id_seq OWNER TO postgres;

--
-- Name: spree_taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_taggings_id_seq OWNED BY public.spree_taggings.id;


--
-- Name: spree_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_tags (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying,
    taggings_count integer DEFAULT 0,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_tags OWNER TO postgres;

--
-- Name: spree_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_tags_id_seq OWNER TO postgres;

--
-- Name: spree_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_tags_id_seq OWNED BY public.spree_tags.id;


--
-- Name: spree_tax_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_tax_categories (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    description character varying,
    is_default boolean DEFAULT false,
    name character varying,
    tax_code character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    store_id bigint
);


ALTER TABLE public.spree_tax_categories OWNER TO postgres;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_tax_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_tax_categories_id_seq OWNER TO postgres;

--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_tax_categories_id_seq OWNED BY public.spree_tax_categories.id;


--
-- Name: spree_tax_exemption_certificates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_tax_exemption_certificates (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    country_code character varying,
    state_code character varying,
    certificate_number character varying NOT NULL,
    reason_code character varying NOT NULL,
    status character varying NOT NULL,
    issued_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    issuing_authority character varying,
    verified_at timestamp(6) without time zone,
    verified_by_id bigint,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_tax_exemption_certificates OWNER TO postgres;

--
-- Name: spree_tax_exemption_certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_tax_exemption_certificates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_tax_exemption_certificates_id_seq OWNER TO postgres;

--
-- Name: spree_tax_exemption_certificates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_tax_exemption_certificates_id_seq OWNED BY public.spree_tax_exemption_certificates.id;


--
-- Name: spree_tax_identifiers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_tax_identifiers (
    id bigint NOT NULL,
    owner_type character varying NOT NULL,
    owner_id bigint NOT NULL,
    kind character varying NOT NULL,
    value character varying NOT NULL,
    validation_status character varying,
    validated_at timestamp(6) without time zone,
    validation_evidence jsonb,
    source character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_tax_identifiers OWNER TO postgres;

--
-- Name: spree_tax_identifiers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_tax_identifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_tax_identifiers_id_seq OWNER TO postgres;

--
-- Name: spree_tax_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_tax_identifiers_id_seq OWNED BY public.spree_tax_identifiers.id;


--
-- Name: spree_tax_lines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_tax_lines (
    id bigint NOT NULL,
    cart_id bigint,
    order_id bigint,
    tax_rate_id bigint,
    line_item_id bigint,
    fulfillment_id bigint,
    fee_id bigint,
    amount numeric(10,2) NOT NULL,
    rate numeric(8,5) NOT NULL,
    label character varying NOT NULL,
    included boolean NOT NULL,
    provider_id character varying,
    data jsonb,
    metadata jsonb,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    taxability_reason character varying,
    country_code character varying,
    state_code character varying
);


ALTER TABLE public.spree_tax_lines OWNER TO postgres;

--
-- Name: spree_tax_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_tax_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_tax_lines_id_seq OWNER TO postgres;

--
-- Name: spree_tax_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_tax_lines_id_seq OWNED BY public.spree_tax_lines.id;


--
-- Name: spree_tax_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_tax_rates (
    id bigint NOT NULL,
    amount numeric(8,5),
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp without time zone,
    included_in_price boolean DEFAULT false,
    name character varying,
    metadata jsonb,
    show_rate_in_label boolean DEFAULT true,
    tax_category_id bigint,
    updated_at timestamp(6) without time zone NOT NULL,
    zone_id bigint,
    store_id bigint,
    country_code character varying,
    state_code character varying
);


ALTER TABLE public.spree_tax_rates OWNER TO postgres;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_tax_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_tax_rates_id_seq OWNER TO postgres;

--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_tax_rates_id_seq OWNED BY public.spree_tax_rates.id;


--
-- Name: spree_taxon_rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_taxon_rules (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    match_policy character varying DEFAULT 'is_equal_to'::character varying NOT NULL,
    taxon_id bigint NOT NULL,
    type character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.spree_taxon_rules OWNER TO postgres;

--
-- Name: spree_taxon_rules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_taxon_rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_taxon_rules_id_seq OWNER TO postgres;

--
-- Name: spree_taxon_rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_taxon_rules_id_seq OWNED BY public.spree_taxon_rules.id;


--
-- Name: spree_taxonomies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_taxonomies (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    name character varying NOT NULL,
    "position" integer DEFAULT 0,
    metadata jsonb,
    store_id bigint,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_taxonomies OWNER TO postgres;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_taxonomies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_taxonomies_id_seq OWNER TO postgres;

--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_taxonomies_id_seq OWNED BY public.spree_taxonomies.id;


--
-- Name: spree_taxonomy_translations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_taxonomy_translations (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    locale character varying NOT NULL,
    name character varying,
    spree_taxonomy_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_taxonomy_translations OWNER TO postgres;

--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_taxonomy_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_taxonomy_translations_id_seq OWNER TO postgres;

--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_taxonomy_translations_id_seq OWNED BY public.spree_taxonomy_translations.id;


--
-- Name: spree_trackers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_trackers (
    id bigint NOT NULL,
    active boolean DEFAULT true,
    analytics_id character varying,
    created_at timestamp(6) without time zone NOT NULL,
    engine integer DEFAULT 0 NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_trackers OWNER TO postgres;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_trackers_id_seq OWNER TO postgres;

--
-- Name: spree_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_trackers_id_seq OWNED BY public.spree_trackers.id;


--
-- Name: spree_user_identities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_user_identities (
    id bigint NOT NULL,
    access_token text,
    created_at timestamp(6) without time zone NOT NULL,
    expires_at timestamp(6) without time zone,
    info jsonb,
    provider character varying NOT NULL,
    refresh_token text,
    uid character varying NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id bigint NOT NULL,
    user_type character varying NOT NULL
);


ALTER TABLE public.spree_user_identities OWNER TO postgres;

--
-- Name: spree_user_identities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_user_identities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_user_identities_id_seq OWNER TO postgres;

--
-- Name: spree_user_identities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_user_identities_id_seq OWNED BY public.spree_user_identities.id;


--
-- Name: spree_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_users (
    id bigint NOT NULL,
    authentication_token character varying,
    bill_address_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    current_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    email character varying,
    encrypted_password character varying(128),
    failed_attempts integer DEFAULT 0 NOT NULL,
    last_request_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    last_sign_in_ip character varying,
    locked_at timestamp without time zone,
    login character varying,
    password_salt character varying(128),
    perishable_token character varying,
    persistence_token character varying,
    metadata jsonb,
    remember_created_at timestamp without time zone,
    remember_token character varying,
    reset_password_sent_at timestamp without time zone,
    reset_password_token character varying,
    ship_address_id bigint,
    sign_in_count integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.spree_users OWNER TO postgres;

--
-- Name: spree_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_users_id_seq OWNER TO postgres;

--
-- Name: spree_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_users_id_seq OWNED BY public.spree_users.id;


--
-- Name: spree_variant_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_variant_media (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    media_id bigint NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    variant_id bigint NOT NULL
);


ALTER TABLE public.spree_variant_media OWNER TO postgres;

--
-- Name: spree_variant_media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_variant_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_variant_media_id_seq OWNER TO postgres;

--
-- Name: spree_variant_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_variant_media_id_seq OWNED BY public.spree_variant_media.id;


--
-- Name: spree_variants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_variants (
    id bigint NOT NULL,
    backorder_limit integer,
    barcode character varying,
    cost_currency character varying,
    cost_price numeric(10,2),
    created_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    depth numeric(8,2),
    dimensions_unit character varying,
    discontinue_on timestamp without time zone,
    height numeric(8,2),
    is_master boolean DEFAULT false,
    media_count integer DEFAULT 0 NOT NULL,
    "position" integer,
    preorder_ships_at timestamp(6) without time zone,
    preorderable boolean,
    primary_media_id bigint,
    metadata jsonb,
    product_id bigint,
    sku character varying DEFAULT ''::character varying NOT NULL,
    tax_category_id bigint,
    track_inventory boolean DEFAULT true,
    updated_at timestamp without time zone NOT NULL,
    weight numeric(8,2) DEFAULT 0.0,
    weight_unit character varying,
    width numeric(8,2),
    hs_code character varying,
    country_of_origin character varying,
    customs_description character varying,
    seller_id bigint,
    delivery_profile_id bigint,
    minimum_order_quantity integer,
    order_multiple integer,
    purchase_unit character varying,
    units_per_carton integer,
    carton_package_type_id bigint,
    carton_weight numeric(8,2),
    cartons_per_pallet integer
);


ALTER TABLE public.spree_variants OWNER TO postgres;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_variants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_variants_id_seq OWNER TO postgres;

--
-- Name: spree_variants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_variants_id_seq OWNED BY public.spree_variants.id;


--
-- Name: spree_webhook_deliveries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_webhook_deliveries (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    delivered_at timestamp(6) without time zone,
    error_type character varying,
    event_id character varying,
    event_name character varying NOT NULL,
    execution_time integer,
    payload jsonb NOT NULL,
    request_errors text,
    response_body text,
    response_code integer,
    success boolean,
    updated_at timestamp(6) without time zone NOT NULL,
    webhook_endpoint_id bigint NOT NULL
);


ALTER TABLE public.spree_webhook_deliveries OWNER TO postgres;

--
-- Name: spree_webhook_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_webhook_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_webhook_deliveries_id_seq OWNER TO postgres;

--
-- Name: spree_webhook_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_webhook_deliveries_id_seq OWNED BY public.spree_webhook_deliveries.id;


--
-- Name: spree_webhook_endpoints; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_webhook_endpoints (
    id bigint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    deleted_at timestamp(6) without time zone,
    disabled_at timestamp(6) without time zone,
    disabled_reason character varying,
    name character varying,
    secret_key character varying NOT NULL,
    store_id bigint NOT NULL,
    subscriptions jsonb NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE public.spree_webhook_endpoints OWNER TO postgres;

--
-- Name: spree_webhook_endpoints_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_webhook_endpoints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_webhook_endpoints_id_seq OWNER TO postgres;

--
-- Name: spree_webhook_endpoints_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_webhook_endpoints_id_seq OWNED BY public.spree_webhook_endpoints.id;


--
-- Name: spree_wishlist_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_wishlist_items (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    variant_id bigint,
    wishlist_id bigint
);


ALTER TABLE public.spree_wishlist_items OWNER TO postgres;

--
-- Name: spree_wishlist_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_wishlist_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_wishlist_items_id_seq OWNER TO postgres;

--
-- Name: spree_wishlist_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_wishlist_items_id_seq OWNED BY public.spree_wishlist_items.id;


--
-- Name: spree_wishlists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_wishlists (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    is_private boolean DEFAULT true NOT NULL,
    name character varying,
    store_id bigint,
    token character varying NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_id bigint
);


ALTER TABLE public.spree_wishlists OWNER TO postgres;

--
-- Name: spree_wishlists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_wishlists_id_seq OWNER TO postgres;

--
-- Name: spree_wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_wishlists_id_seq OWNED BY public.spree_wishlists.id;


--
-- Name: spree_zone_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_zone_members (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    zone_id bigint,
    zoneable_id bigint,
    zoneable_type character varying
);


ALTER TABLE public.spree_zone_members OWNER TO postgres;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_zone_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_zone_members_id_seq OWNER TO postgres;

--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_zone_members_id_seq OWNED BY public.spree_zone_members.id;


--
-- Name: spree_zones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spree_zones (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    default_tax boolean DEFAULT false,
    description character varying,
    kind character varying DEFAULT 'state'::character varying,
    name character varying,
    updated_at timestamp(6) without time zone NOT NULL,
    zone_members_count integer DEFAULT 0
);


ALTER TABLE public.spree_zones OWNER TO postgres;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spree_zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.spree_zones_id_seq OWNER TO postgres;

--
-- Name: spree_zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spree_zones_id_seq OWNED BY public.spree_zones.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: solid_cable_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_cable_messages ALTER COLUMN id SET DEFAULT nextval('public.solid_cable_messages_id_seq'::regclass);


--
-- Name: solid_cache_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_cache_entries ALTER COLUMN id SET DEFAULT nextval('public.solid_cache_entries_id_seq'::regclass);


--
-- Name: solid_queue_blocked_executions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_blocked_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_blocked_executions_id_seq'::regclass);


--
-- Name: solid_queue_claimed_executions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_claimed_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_claimed_executions_id_seq'::regclass);


--
-- Name: solid_queue_failed_executions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_failed_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_failed_executions_id_seq'::regclass);


--
-- Name: solid_queue_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_jobs ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_jobs_id_seq'::regclass);


--
-- Name: solid_queue_pauses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_pauses ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_pauses_id_seq'::regclass);


--
-- Name: solid_queue_processes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_processes ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_processes_id_seq'::regclass);


--
-- Name: solid_queue_ready_executions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_ready_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_ready_executions_id_seq'::regclass);


--
-- Name: solid_queue_recurring_executions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_recurring_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_recurring_executions_id_seq'::regclass);


--
-- Name: solid_queue_recurring_tasks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_recurring_tasks ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_recurring_tasks_id_seq'::regclass);


--
-- Name: solid_queue_scheduled_executions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_scheduled_executions_id_seq'::regclass);


--
-- Name: solid_queue_semaphores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_semaphores ALTER COLUMN id SET DEFAULT nextval('public.solid_queue_semaphores_id_seq'::regclass);


--
-- Name: spree_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_addresses ALTER COLUMN id SET DEFAULT nextval('public.spree_addresses_id_seq'::regclass);


--
-- Name: spree_adjustments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_adjustments ALTER COLUMN id SET DEFAULT nextval('public.spree_adjustments_id_seq'::regclass);


--
-- Name: spree_admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_admin_users ALTER COLUMN id SET DEFAULT nextval('public.spree_admin_users_id_seq'::regclass);


--
-- Name: spree_allowed_origins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_allowed_origins ALTER COLUMN id SET DEFAULT nextval('public.spree_allowed_origins_id_seq'::regclass);


--
-- Name: spree_api_keys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_api_keys ALTER COLUMN id SET DEFAULT nextval('public.spree_api_keys_id_seq'::regclass);


--
-- Name: spree_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_brands ALTER COLUMN id SET DEFAULT nextval('public.spree_brands_id_seq'::regclass);


--
-- Name: spree_calculators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_calculators ALTER COLUMN id SET DEFAULT nextval('public.spree_calculators_id_seq'::regclass);


--
-- Name: spree_carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_carts ALTER COLUMN id SET DEFAULT nextval('public.spree_carts_id_seq'::regclass);


--
-- Name: spree_catalog_assignments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalog_assignments ALTER COLUMN id SET DEFAULT nextval('public.spree_catalog_assignments_id_seq'::regclass);


--
-- Name: spree_catalog_order_minimums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalog_order_minimums ALTER COLUMN id SET DEFAULT nextval('public.spree_catalog_order_minimums_id_seq'::regclass);


--
-- Name: spree_catalog_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalog_products ALTER COLUMN id SET DEFAULT nextval('public.spree_catalog_products_id_seq'::regclass);


--
-- Name: spree_catalog_quantity_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalog_quantity_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_catalog_quantity_rules_id_seq'::regclass);


--
-- Name: spree_catalogs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalogs ALTER COLUMN id SET DEFAULT nextval('public.spree_catalogs_id_seq'::regclass);


--
-- Name: spree_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_categories_id_seq'::regclass);


--
-- Name: spree_category_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_category_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_category_translations_id_seq'::regclass);


--
-- Name: spree_channel_stock_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_channel_stock_locations ALTER COLUMN id SET DEFAULT nextval('public.spree_channel_stock_locations_id_seq'::regclass);


--
-- Name: spree_channels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_channels ALTER COLUMN id SET DEFAULT nextval('public.spree_channels_id_seq'::regclass);


--
-- Name: spree_claim_line_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_claim_line_items ALTER COLUMN id SET DEFAULT nextval('public.spree_claim_line_items_id_seq'::regclass);


--
-- Name: spree_claim_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_claim_reasons ALTER COLUMN id SET DEFAULT nextval('public.spree_claim_reasons_id_seq'::regclass);


--
-- Name: spree_claims id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_claims ALTER COLUMN id SET DEFAULT nextval('public.spree_claims_id_seq'::regclass);


--
-- Name: spree_collection_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_collection_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_collection_rules_id_seq'::regclass);


--
-- Name: spree_collection_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_collection_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_collection_translations_id_seq'::regclass);


--
-- Name: spree_collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_collections ALTER COLUMN id SET DEFAULT nextval('public.spree_collections_id_seq'::regclass);


--
-- Name: spree_commission_lines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_lines ALTER COLUMN id SET DEFAULT nextval('public.spree_commission_lines_id_seq'::regclass);


--
-- Name: spree_commission_rate_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_rate_values ALTER COLUMN id SET DEFAULT nextval('public.spree_commission_rate_values_id_seq'::regclass);


--
-- Name: spree_commission_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_rates ALTER COLUMN id SET DEFAULT nextval('public.spree_commission_rates_id_seq'::regclass);


--
-- Name: spree_commission_rule_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_rule_products ALTER COLUMN id SET DEFAULT nextval('public.spree_commission_rule_products_id_seq'::regclass);


--
-- Name: spree_commission_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_commission_rules_id_seq'::regclass);


--
-- Name: spree_companies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_companies ALTER COLUMN id SET DEFAULT nextval('public.spree_companies_id_seq'::regclass);


--
-- Name: spree_company_invitations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_company_invitations ALTER COLUMN id SET DEFAULT nextval('public.spree_company_invitations_id_seq'::regclass);


--
-- Name: spree_company_memberships id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_company_memberships ALTER COLUMN id SET DEFAULT nextval('public.spree_company_memberships_id_seq'::regclass);


--
-- Name: spree_consent_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_consent_records ALTER COLUMN id SET DEFAULT nextval('public.spree_consent_records_id_seq'::regclass);


--
-- Name: spree_consolidated_metadata_tables id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_consolidated_metadata_tables ALTER COLUMN id SET DEFAULT nextval('public.spree_consolidated_metadata_tables_id_seq'::regclass);


--
-- Name: spree_countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_countries ALTER COLUMN id SET DEFAULT nextval('public.spree_countries_id_seq'::regclass);


--
-- Name: spree_coupon_codes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_coupon_codes ALTER COLUMN id SET DEFAULT nextval('public.spree_coupon_codes_id_seq'::regclass);


--
-- Name: spree_credit_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_credit_cards ALTER COLUMN id SET DEFAULT nextval('public.spree_credit_cards_id_seq'::regclass);


--
-- Name: spree_custom_domains id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_custom_domains ALTER COLUMN id SET DEFAULT nextval('public.spree_custom_domains_id_seq'::regclass);


--
-- Name: spree_custom_field_definitions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_custom_field_definitions ALTER COLUMN id SET DEFAULT nextval('public.spree_custom_field_definitions_id_seq'::regclass);


--
-- Name: spree_custom_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_custom_fields ALTER COLUMN id SET DEFAULT nextval('public.spree_custom_fields_id_seq'::regclass);


--
-- Name: spree_customer_group_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_customer_group_users ALTER COLUMN id SET DEFAULT nextval('public.spree_customer_group_users_id_seq'::regclass);


--
-- Name: spree_customer_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_customer_groups ALTER COLUMN id SET DEFAULT nextval('public.spree_customer_groups_id_seq'::regclass);


--
-- Name: spree_customer_returns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_customer_returns ALTER COLUMN id SET DEFAULT nextval('public.spree_customer_returns_id_seq'::regclass);


--
-- Name: spree_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_customers ALTER COLUMN id SET DEFAULT nextval('public.spree_customers_id_seq'::regclass);


--
-- Name: spree_data_feeds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_data_feeds ALTER COLUMN id SET DEFAULT nextval('public.spree_data_feeds_id_seq'::regclass);


--
-- Name: spree_data_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_data_requests ALTER COLUMN id SET DEFAULT nextval('public.spree_data_requests_id_seq'::regclass);


--
-- Name: spree_deliveries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_deliveries ALTER COLUMN id SET DEFAULT nextval('public.spree_deliveries_id_seq'::regclass);


--
-- Name: spree_delivery_method_rule_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_method_rule_products ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_method_rule_products_id_seq'::regclass);


--
-- Name: spree_delivery_method_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_method_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_method_rules_id_seq'::regclass);


--
-- Name: spree_delivery_method_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_method_services ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_method_services_id_seq'::regclass);


--
-- Name: spree_delivery_method_stock_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_method_stock_locations ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_method_stock_locations_id_seq'::regclass);


--
-- Name: spree_delivery_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_methods ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_methods_id_seq'::regclass);


--
-- Name: spree_delivery_origin_group_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_origin_group_locations ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_origin_group_locations_id_seq'::regclass);


--
-- Name: spree_delivery_origin_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_origin_groups ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_origin_groups_id_seq'::regclass);


--
-- Name: spree_delivery_profiles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_profiles ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_profiles_id_seq'::regclass);


--
-- Name: spree_delivery_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_rates ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_rates_id_seq'::regclass);


--
-- Name: spree_delivery_zone_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_zone_members ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_zone_members_id_seq'::regclass);


--
-- Name: spree_delivery_zones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_zones ALTER COLUMN id SET DEFAULT nextval('public.spree_delivery_zones_id_seq'::regclass);


--
-- Name: spree_digital_assets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_digital_assets ALTER COLUMN id SET DEFAULT nextval('public.spree_digital_assets_id_seq'::regclass);


--
-- Name: spree_digital_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_digital_links ALTER COLUMN id SET DEFAULT nextval('public.spree_digital_links_id_seq'::regclass);


--
-- Name: spree_discounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_discounts ALTER COLUMN id SET DEFAULT nextval('public.spree_discounts_id_seq'::regclass);


--
-- Name: spree_exchange_line_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_exchange_line_items ALTER COLUMN id SET DEFAULT nextval('public.spree_exchange_line_items_id_seq'::regclass);


--
-- Name: spree_exchanges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_exchanges ALTER COLUMN id SET DEFAULT nextval('public.spree_exchanges_id_seq'::regclass);


--
-- Name: spree_exports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_exports ALTER COLUMN id SET DEFAULT nextval('public.spree_exports_id_seq'::regclass);


--
-- Name: spree_external_references id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_external_references ALTER COLUMN id SET DEFAULT nextval('public.spree_external_references_id_seq'::regclass);


--
-- Name: spree_fees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_fees ALTER COLUMN id SET DEFAULT nextval('public.spree_fees_id_seq'::regclass);


--
-- Name: spree_fulfillment_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_fulfillment_items ALTER COLUMN id SET DEFAULT nextval('public.spree_fulfillment_items_id_seq'::regclass);


--
-- Name: spree_fulfillments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_fulfillments ALTER COLUMN id SET DEFAULT nextval('public.spree_fulfillments_id_seq'::regclass);


--
-- Name: spree_gateway_customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_gateway_customers ALTER COLUMN id SET DEFAULT nextval('public.spree_gateway_customers_id_seq'::regclass);


--
-- Name: spree_gateways id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_gateways ALTER COLUMN id SET DEFAULT nextval('public.spree_gateways_id_seq'::regclass);


--
-- Name: spree_gift_card_batches id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_gift_card_batches ALTER COLUMN id SET DEFAULT nextval('public.spree_gift_card_batches_id_seq'::regclass);


--
-- Name: spree_gift_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_gift_cards ALTER COLUMN id SET DEFAULT nextval('public.spree_gift_cards_id_seq'::regclass);


--
-- Name: spree_import_mappings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_import_mappings ALTER COLUMN id SET DEFAULT nextval('public.spree_import_mappings_id_seq'::regclass);


--
-- Name: spree_import_rows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_import_rows ALTER COLUMN id SET DEFAULT nextval('public.spree_import_rows_id_seq'::regclass);


--
-- Name: spree_imports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_imports ALTER COLUMN id SET DEFAULT nextval('public.spree_imports_id_seq'::regclass);


--
-- Name: spree_integrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_integrations ALTER COLUMN id SET DEFAULT nextval('public.spree_integrations_id_seq'::regclass);


--
-- Name: spree_invitations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_invitations ALTER COLUMN id SET DEFAULT nextval('public.spree_invitations_id_seq'::regclass);


--
-- Name: spree_line_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_line_items ALTER COLUMN id SET DEFAULT nextval('public.spree_line_items_id_seq'::regclass);


--
-- Name: spree_log_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_log_entries ALTER COLUMN id SET DEFAULT nextval('public.spree_log_entries_id_seq'::regclass);


--
-- Name: spree_market_countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_market_countries ALTER COLUMN id SET DEFAULT nextval('public.spree_market_countries_id_seq'::regclass);


--
-- Name: spree_markets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_markets ALTER COLUMN id SET DEFAULT nextval('public.spree_markets_id_seq'::regclass);


--
-- Name: spree_media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_media ALTER COLUMN id SET DEFAULT nextval('public.spree_media_id_seq'::regclass);


--
-- Name: spree_newsletter_subscribers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_newsletter_subscribers ALTER COLUMN id SET DEFAULT nextval('public.spree_newsletter_subscribers_id_seq'::regclass);


--
-- Name: spree_number_sequences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_number_sequences ALTER COLUMN id SET DEFAULT nextval('public.spree_number_sequences_id_seq'::regclass);


--
-- Name: spree_option_type_product_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_type_product_types ALTER COLUMN id SET DEFAULT nextval('public.spree_option_type_product_types_id_seq'::regclass);


--
-- Name: spree_option_type_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_type_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_option_type_translations_id_seq'::regclass);


--
-- Name: spree_option_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_types ALTER COLUMN id SET DEFAULT nextval('public.spree_option_types_id_seq'::regclass);


--
-- Name: spree_option_value_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_value_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_option_value_translations_id_seq'::regclass);


--
-- Name: spree_option_value_variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_value_variants ALTER COLUMN id SET DEFAULT nextval('public.spree_option_value_variants_id_seq'::regclass);


--
-- Name: spree_option_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_values ALTER COLUMN id SET DEFAULT nextval('public.spree_option_values_id_seq'::regclass);


--
-- Name: spree_order_cancellation_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_order_cancellation_reasons ALTER COLUMN id SET DEFAULT nextval('public.spree_order_cancellation_reasons_id_seq'::regclass);


--
-- Name: spree_order_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_order_groups ALTER COLUMN id SET DEFAULT nextval('public.spree_order_groups_id_seq'::regclass);


--
-- Name: spree_order_promotions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_order_promotions ALTER COLUMN id SET DEFAULT nextval('public.spree_order_promotions_id_seq'::regclass);


--
-- Name: spree_order_routing_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_order_routing_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_order_routing_rules_id_seq'::regclass);


--
-- Name: spree_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_orders ALTER COLUMN id SET DEFAULT nextval('public.spree_orders_id_seq'::regclass);


--
-- Name: spree_package_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_package_types ALTER COLUMN id SET DEFAULT nextval('public.spree_package_types_id_seq'::regclass);


--
-- Name: spree_payment_capture_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_capture_events ALTER COLUMN id SET DEFAULT nextval('public.spree_payment_capture_events_id_seq'::regclass);


--
-- Name: spree_payment_methods id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_methods ALTER COLUMN id SET DEFAULT nextval('public.spree_payment_methods_id_seq'::regclass);


--
-- Name: spree_payment_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_sessions ALTER COLUMN id SET DEFAULT nextval('public.spree_payment_sessions_id_seq'::regclass);


--
-- Name: spree_payment_setup_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_setup_sessions ALTER COLUMN id SET DEFAULT nextval('public.spree_payment_setup_sessions_id_seq'::regclass);


--
-- Name: spree_payment_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_sources ALTER COLUMN id SET DEFAULT nextval('public.spree_payment_sources_id_seq'::regclass);


--
-- Name: spree_payment_splits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_splits ALTER COLUMN id SET DEFAULT nextval('public.spree_payment_splits_id_seq'::regclass);


--
-- Name: spree_payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payments ALTER COLUMN id SET DEFAULT nextval('public.spree_payments_id_seq'::regclass);


--
-- Name: spree_paypal_checkout_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_paypal_checkout_orders ALTER COLUMN id SET DEFAULT nextval('public.spree_paypal_checkout_orders_id_seq'::regclass);


--
-- Name: spree_policies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_policies ALTER COLUMN id SET DEFAULT nextval('public.spree_policies_id_seq'::regclass);


--
-- Name: spree_policy_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_policy_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_policy_translations_id_seq'::regclass);


--
-- Name: spree_preferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_preferences ALTER COLUMN id SET DEFAULT nextval('public.spree_preferences_id_seq'::regclass);


--
-- Name: spree_price_adjustment_tiers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_price_adjustment_tiers ALTER COLUMN id SET DEFAULT nextval('public.spree_price_adjustment_tiers_id_seq'::regclass);


--
-- Name: spree_price_histories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_price_histories ALTER COLUMN id SET DEFAULT nextval('public.spree_price_histories_id_seq'::regclass);


--
-- Name: spree_price_lists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_price_lists ALTER COLUMN id SET DEFAULT nextval('public.spree_price_lists_id_seq'::regclass);


--
-- Name: spree_price_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_price_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_price_rules_id_seq'::regclass);


--
-- Name: spree_prices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_prices ALTER COLUMN id SET DEFAULT nextval('public.spree_prices_id_seq'::regclass);


--
-- Name: spree_product_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_product_categories_id_seq'::regclass);


--
-- Name: spree_product_collections id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_collections ALTER COLUMN id SET DEFAULT nextval('public.spree_product_collections_id_seq'::regclass);


--
-- Name: spree_product_option_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_option_types ALTER COLUMN id SET DEFAULT nextval('public.spree_product_option_types_id_seq'::regclass);


--
-- Name: spree_product_promotion_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_promotion_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_product_promotion_rules_id_seq'::regclass);


--
-- Name: spree_product_publications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_publications ALTER COLUMN id SET DEFAULT nextval('public.spree_product_publications_id_seq'::regclass);


--
-- Name: spree_product_submissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_submissions ALTER COLUMN id SET DEFAULT nextval('public.spree_product_submissions_id_seq'::regclass);


--
-- Name: spree_product_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_product_translations_id_seq'::regclass);


--
-- Name: spree_product_type_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_type_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_product_type_categories_id_seq'::regclass);


--
-- Name: spree_product_type_custom_field_definitions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_type_custom_field_definitions ALTER COLUMN id SET DEFAULT nextval('public.spree_product_type_custom_field_definitions_id_seq'::regclass);


--
-- Name: spree_product_type_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_type_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_product_type_translations_id_seq'::regclass);


--
-- Name: spree_product_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_types ALTER COLUMN id SET DEFAULT nextval('public.spree_product_types_id_seq'::regclass);


--
-- Name: spree_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_products ALTER COLUMN id SET DEFAULT nextval('public.spree_products_id_seq'::regclass);


--
-- Name: spree_products_stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_products_stores ALTER COLUMN id SET DEFAULT nextval('public.spree_products_stores_id_seq'::regclass);


--
-- Name: spree_promotion_action_line_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_action_line_items ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_action_line_items_id_seq'::regclass);


--
-- Name: spree_promotion_actions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_actions ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_actions_id_seq'::regclass);


--
-- Name: spree_promotion_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_categories_id_seq'::regclass);


--
-- Name: spree_promotion_rule_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_rule_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_rule_categories_id_seq'::regclass);


--
-- Name: spree_promotion_rule_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_rule_users ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_rule_users_id_seq'::regclass);


--
-- Name: spree_promotion_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_promotion_rules_id_seq'::regclass);


--
-- Name: spree_promotions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotions ALTER COLUMN id SET DEFAULT nextval('public.spree_promotions_id_seq'::regclass);


--
-- Name: spree_promotions_stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotions_stores ALTER COLUMN id SET DEFAULT nextval('public.spree_promotions_stores_id_seq'::regclass);


--
-- Name: spree_purchase_order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_purchase_order_items ALTER COLUMN id SET DEFAULT nextval('public.spree_purchase_order_items_id_seq'::regclass);


--
-- Name: spree_purchase_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_purchase_orders ALTER COLUMN id SET DEFAULT nextval('public.spree_purchase_orders_id_seq'::regclass);


--
-- Name: spree_refresh_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_refresh_tokens ALTER COLUMN id SET DEFAULT nextval('public.spree_refresh_tokens_id_seq'::regclass);


--
-- Name: spree_refund_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_refund_reasons ALTER COLUMN id SET DEFAULT nextval('public.spree_refund_reasons_id_seq'::regclass);


--
-- Name: spree_refunds id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_refunds ALTER COLUMN id SET DEFAULT nextval('public.spree_refunds_id_seq'::regclass);


--
-- Name: spree_reimbursement_credits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_reimbursement_credits ALTER COLUMN id SET DEFAULT nextval('public.spree_reimbursement_credits_id_seq'::regclass);


--
-- Name: spree_reimbursement_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_reimbursement_types ALTER COLUMN id SET DEFAULT nextval('public.spree_reimbursement_types_id_seq'::regclass);


--
-- Name: spree_reimbursements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_reimbursements ALTER COLUMN id SET DEFAULT nextval('public.spree_reimbursements_id_seq'::regclass);


--
-- Name: spree_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_reports ALTER COLUMN id SET DEFAULT nextval('public.spree_reports_id_seq'::regclass);


--
-- Name: spree_return_authorizations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_return_authorizations ALTER COLUMN id SET DEFAULT nextval('public.spree_return_authorizations_id_seq'::regclass);


--
-- Name: spree_return_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_return_items ALTER COLUMN id SET DEFAULT nextval('public.spree_return_items_id_seq'::regclass);


--
-- Name: spree_return_line_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_return_line_items ALTER COLUMN id SET DEFAULT nextval('public.spree_return_line_items_id_seq'::regclass);


--
-- Name: spree_return_reasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_return_reasons ALTER COLUMN id SET DEFAULT nextval('public.spree_return_reasons_id_seq'::regclass);


--
-- Name: spree_returns id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_returns ALTER COLUMN id SET DEFAULT nextval('public.spree_returns_id_seq'::regclass);


--
-- Name: spree_role_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_role_users ALTER COLUMN id SET DEFAULT nextval('public.spree_role_users_id_seq'::regclass);


--
-- Name: spree_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_roles ALTER COLUMN id SET DEFAULT nextval('public.spree_roles_id_seq'::regclass);


--
-- Name: spree_saved_reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_saved_reports ALTER COLUMN id SET DEFAULT nextval('public.spree_saved_reports_id_seq'::regclass);


--
-- Name: spree_seller_payouts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_payouts ALTER COLUMN id SET DEFAULT nextval('public.spree_seller_payouts_id_seq'::regclass);


--
-- Name: spree_seller_requirement_custom_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_requirement_custom_fields ALTER COLUMN id SET DEFAULT nextval('public.spree_seller_requirement_custom_fields_id_seq'::regclass);


--
-- Name: spree_seller_requirement_submissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_requirement_submissions ALTER COLUMN id SET DEFAULT nextval('public.spree_seller_requirement_submissions_id_seq'::regclass);


--
-- Name: spree_seller_requirements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_requirements ALTER COLUMN id SET DEFAULT nextval('public.spree_seller_requirements_id_seq'::regclass);


--
-- Name: spree_seller_transfers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_transfers ALTER COLUMN id SET DEFAULT nextval('public.spree_seller_transfers_id_seq'::regclass);


--
-- Name: spree_seller_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_seller_translations_id_seq'::regclass);


--
-- Name: spree_sellers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_sellers ALTER COLUMN id SET DEFAULT nextval('public.spree_sellers_id_seq'::regclass);


--
-- Name: spree_shipping_labels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_shipping_labels ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_labels_id_seq'::regclass);


--
-- Name: spree_shipping_method_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_shipping_method_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_shipping_method_categories_id_seq'::regclass);


--
-- Name: spree_state_changes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_state_changes ALTER COLUMN id SET DEFAULT nextval('public.spree_state_changes_id_seq'::regclass);


--
-- Name: spree_states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_states ALTER COLUMN id SET DEFAULT nextval('public.spree_states_id_seq'::regclass);


--
-- Name: spree_stock_levels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_levels ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_levels_id_seq'::regclass);


--
-- Name: spree_stock_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_locations ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_locations_id_seq'::regclass);


--
-- Name: spree_stock_movements id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_movements ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_movements_id_seq'::regclass);


--
-- Name: spree_stock_receipt_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_receipt_items ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_receipt_items_id_seq'::regclass);


--
-- Name: spree_stock_receipts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_receipts ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_receipts_id_seq'::regclass);


--
-- Name: spree_stock_reservations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_reservations ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_reservations_id_seq'::regclass);


--
-- Name: spree_stock_transfer_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_transfer_items ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_transfer_items_id_seq'::regclass);


--
-- Name: spree_stock_transfers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_transfers ALTER COLUMN id SET DEFAULT nextval('public.spree_stock_transfers_id_seq'::regclass);


--
-- Name: spree_store_credit_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_credit_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credit_categories_id_seq'::regclass);


--
-- Name: spree_store_credit_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_credit_events ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credit_events_id_seq'::regclass);


--
-- Name: spree_store_credit_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_credit_types ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credit_types_id_seq'::regclass);


--
-- Name: spree_store_credits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_credits ALTER COLUMN id SET DEFAULT nextval('public.spree_store_credits_id_seq'::regclass);


--
-- Name: spree_store_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_store_translations_id_seq'::regclass);


--
-- Name: spree_stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stores ALTER COLUMN id SET DEFAULT nextval('public.spree_stores_id_seq'::regclass);


--
-- Name: spree_stripe_payment_intents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stripe_payment_intents ALTER COLUMN id SET DEFAULT nextval('public.spree_stripe_payment_intents_id_seq'::regclass);


--
-- Name: spree_stripe_payment_methods_webhook_keys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stripe_payment_methods_webhook_keys ALTER COLUMN id SET DEFAULT nextval('public.spree_stripe_payment_methods_webhook_keys_id_seq'::regclass);


--
-- Name: spree_stripe_webhook_keys id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stripe_webhook_keys ALTER COLUMN id SET DEFAULT nextval('public.spree_stripe_webhook_keys_id_seq'::regclass);


--
-- Name: spree_suppliers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_suppliers ALTER COLUMN id SET DEFAULT nextval('public.spree_suppliers_id_seq'::regclass);


--
-- Name: spree_taggings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taggings ALTER COLUMN id SET DEFAULT nextval('public.spree_taggings_id_seq'::regclass);


--
-- Name: spree_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tags ALTER COLUMN id SET DEFAULT nextval('public.spree_tags_id_seq'::regclass);


--
-- Name: spree_tax_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_categories ALTER COLUMN id SET DEFAULT nextval('public.spree_tax_categories_id_seq'::regclass);


--
-- Name: spree_tax_exemption_certificates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_exemption_certificates ALTER COLUMN id SET DEFAULT nextval('public.spree_tax_exemption_certificates_id_seq'::regclass);


--
-- Name: spree_tax_identifiers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_identifiers ALTER COLUMN id SET DEFAULT nextval('public.spree_tax_identifiers_id_seq'::regclass);


--
-- Name: spree_tax_lines id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_lines ALTER COLUMN id SET DEFAULT nextval('public.spree_tax_lines_id_seq'::regclass);


--
-- Name: spree_tax_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_rates ALTER COLUMN id SET DEFAULT nextval('public.spree_tax_rates_id_seq'::regclass);


--
-- Name: spree_taxon_rules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taxon_rules ALTER COLUMN id SET DEFAULT nextval('public.spree_taxon_rules_id_seq'::regclass);


--
-- Name: spree_taxonomies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taxonomies ALTER COLUMN id SET DEFAULT nextval('public.spree_taxonomies_id_seq'::regclass);


--
-- Name: spree_taxonomy_translations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taxonomy_translations ALTER COLUMN id SET DEFAULT nextval('public.spree_taxonomy_translations_id_seq'::regclass);


--
-- Name: spree_trackers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_trackers ALTER COLUMN id SET DEFAULT nextval('public.spree_trackers_id_seq'::regclass);


--
-- Name: spree_user_identities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_user_identities ALTER COLUMN id SET DEFAULT nextval('public.spree_user_identities_id_seq'::regclass);


--
-- Name: spree_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_users ALTER COLUMN id SET DEFAULT nextval('public.spree_users_id_seq'::regclass);


--
-- Name: spree_variant_media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_variant_media ALTER COLUMN id SET DEFAULT nextval('public.spree_variant_media_id_seq'::regclass);


--
-- Name: spree_variants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_variants ALTER COLUMN id SET DEFAULT nextval('public.spree_variants_id_seq'::regclass);


--
-- Name: spree_webhook_deliveries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_webhook_deliveries ALTER COLUMN id SET DEFAULT nextval('public.spree_webhook_deliveries_id_seq'::regclass);


--
-- Name: spree_webhook_endpoints id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_webhook_endpoints ALTER COLUMN id SET DEFAULT nextval('public.spree_webhook_endpoints_id_seq'::regclass);


--
-- Name: spree_wishlist_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_wishlist_items ALTER COLUMN id SET DEFAULT nextval('public.spree_wishlist_items_id_seq'::regclass);


--
-- Name: spree_wishlists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_wishlists ALTER COLUMN id SET DEFAULT nextval('public.spree_wishlists_id_seq'::regclass);


--
-- Name: spree_zone_members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_zone_members ALTER COLUMN id SET DEFAULT nextval('public.spree_zone_members_id_seq'::regclass);


--
-- Name: spree_zones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_zones ALTER COLUMN id SET DEFAULT nextval('public.spree_zones_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.action_text_rich_texts (id, body, created_at, locale, name, record_id, record_type, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_attachments (id, blob_id, created_at, name, record_id, record_type) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_blobs (id, byte_size, checksum, content_type, created_at, filename, key, metadata, service_name) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2026-09-30 12:07:18.330954	2026-09-30 12:07:18.330961
schema_sha1	e483d78abacc177b2689d2ad3bd2eb3d66788f84	2026-09-30 12:07:18.336416	2026-09-30 12:07:18.336418
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.friendly_id_slugs (id, created_at, deleted_at, locale, scope, slug, sluggable_id, sluggable_type) FROM stdin;
1	2026-09-30 12:07:19.203161	\N	en	owner_id:1,owner_type:Spree::Store	terms-of-service	1	Spree::Policy
2	2026-09-30 12:07:19.22694	\N	en	owner_id:1,owner_type:Spree::Store	privacy-policy	2	Spree::Policy
3	2026-09-30 12:07:19.258979	\N	en	owner_id:1,owner_type:Spree::Store	returns-policy	3	Spree::Policy
4	2026-09-30 12:07:19.290084	\N	en	owner_id:1,owner_type:Spree::Store	shipping-policy	4	Spree::Policy
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20260924143758
20260924143757
20260924143756
20260917183240
20260915121236
20260915121235
20260915121234
20260915121233
20260915121232
20260915121231
20260915121230
20260915121229
20260915121228
20260915121227
20260915121226
20260915121225
20260915121224
20260915121223
20260915121222
20260915121221
20260915121220
20260915121219
20260915121218
20260915121217
20260915121216
20260915121215
20260915121214
20260915121213
20260915121212
20260915121211
20260915121210
20260915121209
20260915121208
20260915121207
20260915121206
20260915121205
20260915121204
20260915121203
20260915121202
20260915121201
20260915121200
20260915121199
20260915121198
20260915121197
20260915121196
20260915121195
20260915121194
20260915121193
20260915121192
20260915121191
20260915121190
20260915121189
20260915121188
20260915121187
20260915121186
20260915121185
20260915121184
20260915121183
20260915121182
20260915121181
20260915121180
20260915121179
20260915121178
20260915121177
20260915121176
20260915121175
20260915121174
20260915121173
20260915121172
20260915121171
20260915121170
20260915121169
20260915121168
20260915121167
20260915121166
20260915121165
20260915121164
20260915121163
20260915121162
20260915121161
20260915121160
20260915121159
20260915121158
20260915121157
20260915121156
20260915121155
20260915121154
20260915121153
20260915121152
20260915121151
20260915121150
20260915121149
20260915121148
20260915121147
20260915121146
20260915121145
20260915121144
20260915121143
20260915121142
20260915121141
20260915121140
20260915121139
20260915121138
20260915121137
20260915121136
20260915121135
20260915121134
20260915121133
20260915121132
20260915121131
20260915121130
20260915121129
20260915121128
20260915121127
20260915121126
20260915121125
20260826115925
20260826115924
20260826115923
20260826115922
20260826115921
20260826115920
20260826115919
20260826115918
20260826115917
20260826115916
20260826115915
20260826115914
20260826115913
20260826115912
20260826115911
20260826115910
20260826115909
20260826115908
20260826115907
20260826115906
20260826115905
20260826115904
20260826115903
20260826115902
20260826115901
20260826115900
20260826115899
20260826115898
20260826115897
20260826115896
20260826115895
20260826115894
20260826115893
20260826115892
20260826115891
20260826115890
20260826115889
20260826115888
20260826115887
20260826115886
20260826115885
20260826115884
20260826115883
20260826115882
20260826115881
20260826115880
20260826115879
20260826115878
20260826115877
20260826115876
20260826115875
20260826115874
20260826115873
20260826115872
20260826115871
20260826115870
20260826115869
20260826115868
20260826115867
20260826115866
20260826115865
20260826115864
20260826115863
20260826115862
20260826115861
20260826115860
20260826115859
20260826115858
20260826115857
20260826115856
20260826115855
20260826115854
20260826115853
20260826115852
20260826115851
20260826115850
20260826115849
20260826115848
20260826115847
20260826115846
20260826115845
20260826115844
20260826115843
20260826115842
20260826115841
20260826115840
20260826115839
20260826115838
20260826115837
20260826115836
20260826115835
20260826115834
20260826115833
20260826115832
20260826115831
20260826115830
20260826115829
20260826115828
20260826115827
20260826115826
20260826115825
20260826115824
20260826115823
20260826115822
20260826115821
20260826115820
20260826115819
20260826115818
20260826115817
20260826115816
20260826115815
20260826115814
20260826115813
20260826115812
20260826115811
20260826115810
20260826115809
20260826115808
20260826115807
20260826115806
20260826115805
20260826115804
20260826115803
20260826115802
20260826115801
20260826115800
20260826115799
20260826115798
20260826115797
20260826115796
20260826115795
20260826115794
20260826115793
20260826115792
20260826115791
20260826115790
20260826115789
20260826115788
20260826115787
20260826115786
20260826115785
20260826115784
20260826115783
20260826115782
20260826115781
20260826115780
20260826115779
20260826115778
20260826115777
20260826115776
20260826115775
20260826115774
20260826115773
20260826115772
20260826115771
20260826115770
20260826115769
20260826115768
20260826115767
20260826115766
20260826115765
20260826115764
20260826115763
20260826115762
20260826115761
20260826115760
20260826115759
20260826115758
20260826115757
20260826115756
20260826115755
20260826115754
20260718000003
20260718000002
20260718000001
20260427130753
20260317150033
20260317145942
20260317145933
\.


--
-- Data for Name: solid_cable_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_cable_messages (id, channel, channel_hash, created_at, payload) FROM stdin;
\.


--
-- Data for Name: solid_cache_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_cache_entries (id, byte_size, created_at, key, key_hash, value) FROM stdin;
2	210	2026-09-30 12:07:56.829851	\\x726174652d6c696d69743a73707265652f6170692f76332f61646d696e2f617574683a6c6f67696e3a3137322e32312e302e31	-6649163264674940246	\\x0011017a2835f63eafda41ffffffff04086907
1	187	2026-09-30 12:07:56.80265	\\x726174652d6c696d69743a6170695f76333a3137322e32312e302e31	7492446713691554242	\\x001101f4c033f63eafda41ffffffff04086908
\.


--
-- Data for Name: solid_queue_blocked_executions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_blocked_executions (id, concurrency_key, created_at, expires_at, job_id, priority, queue_name) FROM stdin;
\.


--
-- Data for Name: solid_queue_claimed_executions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_claimed_executions (id, created_at, job_id, process_id) FROM stdin;
\.


--
-- Data for Name: solid_queue_failed_executions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_failed_executions (id, created_at, error, job_id) FROM stdin;
\.


--
-- Data for Name: solid_queue_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_jobs (id, active_job_id, arguments, class_name, concurrency_key, created_at, finished_at, priority, queue_name, scheduled_at, updated_at) FROM stdin;
1	7c11afcc-ce0b-48dc-8677-a092e0d59257	{"job_class":"Spree::PriceLists::SyncCurrenciesJob","job_id":"7c11afcc-ce0b-48dc-8677-a092e0d59257","provider_job_id":null,"queue_name":"default","priority":null,"arguments":[1],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-09-30T12:07:19.433991058Z","scheduled_at":"2026-09-30T12:07:19.433925815Z","continuation":{"completed":[]},"resumptions":0}	Spree::PriceLists::SyncCurrenciesJob	\N	2026-09-30 12:07:19.453357	2026-09-30 12:07:41.581951	0	default	2026-09-30 12:07:19.433925	2026-09-30 12:07:41.583884
2	753bf09b-77a5-4e15-96f9-bb7a116b3bd9	{"job_class":"Spree::StockReservations::ExpireJob","job_id":"753bf09b-77a5-4e15-96f9-bb7a116b3bd9","provider_job_id":null,"queue_name":"spree_stock_reservations","priority":null,"arguments":[],"executions":0,"exception_executions":{},"locale":"en","timezone":"UTC","enqueued_at":"2026-09-30T12:08:00.036149330Z","scheduled_at":"2026-09-30T12:08:00.035347284Z"}	Spree::StockReservations::ExpireJob	\N	2026-09-30 12:08:00.206004	2026-09-30 12:08:00.593963	0	spree_stock_reservations	2026-09-30 12:08:00.035347	2026-09-30 12:08:00.60102
\.


--
-- Data for Name: solid_queue_pauses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_pauses (id, created_at, queue_name) FROM stdin;
\.


--
-- Data for Name: solid_queue_processes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_processes (id, created_at, hostname, kind, last_heartbeat_at, metadata, name, pid, supervisor_id) FROM stdin;
1	2026-09-30 12:07:41.37056	05af832c2947	Supervisor(fork)	2026-09-30 12:07:41.351148	\N	supervisor(fork)-be7a545ddcfed0a85a3f	23	\N
2	2026-09-30 12:07:41.401504	05af832c2947	Dispatcher	2026-09-30 12:07:41.398495	{"polling_interval":1,"batch_size":500,"concurrency_maintenance_interval":600,"batch_maintenance":true}	dispatcher-b96c845a941e9967f967	31	1
3	2026-09-30 12:07:41.410283	05af832c2947	Worker	2026-09-30 12:07:41.405544	{"polling_interval":0.1,"queues":"default,spree_imports,spree_payment_webhooks,spree_stock_reservations,mailers,spree_events,spree_exports,spree_images,active_storage_transform,spree_products,spree_variants,spree_categories,spree_collections,spree_stock_location_stock_levels,spree_coupon_codes,spree_addresses,spree_gift_cards,spree_webhooks,spree_api_keys,spree_search,spree_tax_identifiers,spree_payouts,spree_data_requests,active_storage_analysis,active_storage_purge,*","pool_type":"thread","pool_size":3}	worker-ecf337cbbd9d3faf0d4c	36	1
4	2026-09-30 12:07:41.418582	05af832c2947	Scheduler	2026-09-30 12:07:41.412158	{"recurring_schedule":["expire_stock_reservations","finalize_stale_draft_orders","reap_expired_carts","regenerate_time_based_collections","prune_price_history","sweep_due_seller_payouts","execute_pending_seller_transfers","clear_solid_queue_finished_jobs","clear_solid_cable_messages"]}	scheduler-1bd8aad1883356eeb6f2	42	1
\.


--
-- Data for Name: solid_queue_ready_executions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_ready_executions (id, created_at, job_id, priority, queue_name) FROM stdin;
\.


--
-- Data for Name: solid_queue_recurring_executions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_recurring_executions (id, created_at, job_id, run_at, task_key) FROM stdin;
1	2026-09-30 12:08:00.046039	2	2026-09-30 12:08:00	expire_stock_reservations
\.


--
-- Data for Name: solid_queue_recurring_tasks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_recurring_tasks (id, arguments, class_name, command, created_at, description, key, priority, queue_name, schedule, static, updated_at) FROM stdin;
1	\N	Spree::StockReservations::ExpireJob	\N	2026-09-30 12:07:41.472316	\N	expire_stock_reservations	\N	\N	every minute	t	2026-09-30 12:07:41.472316
2	\N	Spree::Orders::FinalizeStaleDraftsJob	\N	2026-09-30 12:07:41.472316	\N	finalize_stale_draft_orders	\N	\N	every 5 minutes	t	2026-09-30 12:07:41.472316
3	\N	Spree::Carts::ReapExpiredJob	\N	2026-09-30 12:07:41.472316	\N	reap_expired_carts	\N	\N	every hour at minute 7	t	2026-09-30 12:07:41.472316
4	\N	Spree::Collections::RegenerateTimeBasedJob	\N	2026-09-30 12:07:41.472316	\N	regenerate_time_based_collections	\N	\N	every hour at minute 17	t	2026-09-30 12:07:41.472316
5	\N	\N	require 'rake'; Rails.application.load_tasks unless Rake::Task.task_defined?('spree:price_history:prune'); Rake::Task['spree:price_history:prune'].tap(&:reenable).invoke	2026-09-30 12:07:41.472316	\N	prune_price_history	\N	\N	at 4am every day	t	2026-09-30 12:07:41.472316
6	\N	Spree::SellerPayouts::SweepDueJob	\N	2026-09-30 12:07:41.472316	\N	sweep_due_seller_payouts	\N	\N	at 3am every day	t	2026-09-30 12:07:41.472316
7	\N	Spree::SellerTransfers::ExecutePendingDueJob	\N	2026-09-30 12:07:41.472316	\N	execute_pending_seller_transfers	\N	\N	every hour at minute 27	t	2026-09-30 12:07:41.472316
8	\N	\N	SolidQueue::Job.clear_finished_in_batches(sleep_between_batches: 0.3)	2026-09-30 12:07:41.472316	\N	clear_solid_queue_finished_jobs	\N	\N	every hour at minute 12	t	2026-09-30 12:07:41.472316
9	\N	\N	SolidCable::Message.prunable.in_batches(of: 1000).delete_all	2026-09-30 12:07:41.472316	\N	clear_solid_cable_messages	\N	\N	every hour at minute 42	t	2026-09-30 12:07:41.472316
\.


--
-- Data for Name: solid_queue_scheduled_executions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_scheduled_executions (id, created_at, job_id, priority, queue_name, scheduled_at) FROM stdin;
\.


--
-- Data for Name: solid_queue_semaphores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solid_queue_semaphores (id, created_at, expires_at, key, updated_at, value) FROM stdin;
\.


--
-- Data for Name: spree_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_addresses (id, address1, address2, alternative_phone, city, company, country_id, created_at, deleted_at, first_name, label, last_name, latitude, longitude, phone, metadata, quick_checkout, state_id, state_name, updated_at, postal_code, country_code, state_code, owner_type, owner_id) FROM stdin;
\.


--
-- Data for Name: spree_adjustments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_adjustments (id, adjustable_id, adjustable_type, amount, created_at, eligible, included, label, mandatory, order_id, source_id, source_type, state, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_admin_users (id, email, password_digest, first_name, last_name, selected_locale, failed_attempts, locked_at, created_at, updated_at) FROM stdin;
1	admin@example.com	$2a$12$mpVB73MgJBoDaZQ08jeeCONrDi7M3lw44545O8tnEAkuRoCvqiSRu	Spree	Admin	\N	0	\N	2026-09-30 12:07:20.67302	2026-09-30 12:07:20.67302
\.


--
-- Data for Name: spree_allowed_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_allowed_origins (id, created_at, origin, store_id, updated_at) FROM stdin;
1	2026-09-30 12:07:20.457712	http://localhost	1	2026-09-30 12:07:20.457712
\.


--
-- Data for Name: spree_api_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_api_keys (id, channel_id, created_at, created_by_id, created_by_type, key_type, last_used_at, name, revoked_at, revoked_by_id, revoked_by_type, scopes, store_id, token, token_digest, token_prefix, updated_at) FROM stdin;
1	\N	2026-09-30 12:07:20.280209	\N	\N	publishable	\N	Default	\N	\N	\N	[]	1	pk_YPsx2is61kpAeFagYGVKHb7q	\N	\N	2026-09-30 12:07:20.280209
2	2	2026-09-30 12:07:20.290235	\N	\N	publishable	\N	Storefront (Wholesale)	\N	\N	\N	[]	1	pk_ZZU9CXyySswbCV9wNzXedXhb	\N	\N	2026-09-30 12:07:20.290235
\.


--
-- Data for Name: spree_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_brands (id, store_id, name, slug, active, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_calculators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_calculators (id, calculable_id, calculable_type, created_at, deleted_at, preferences, type, updated_at) FROM stdin;
1	1	Spree::DeliveryMethod	2026-09-30 12:07:19.768837	\N	---\n:currency: USD\n:amounts: {}\n:amount: 0\n	Spree::Calculator::Shipping::DigitalDelivery	2026-09-30 12:07:19.803464
2	2	Spree::DeliveryMethod	2026-09-30 12:07:20.859541	\N	---\n:amount: 5\n:currency: USD\n	Spree::Calculator::Shipping::FlatRate	2026-09-30 12:07:20.859541
3	3	Spree::DeliveryMethod	2026-09-30 12:07:20.877775	\N	---\n:amount: 20\n:currency: USD\n	Spree::Calculator::Shipping::FlatRate	2026-09-30 12:07:20.877775
4	4	Spree::DeliveryMethod	2026-09-30 12:07:20.931328	\N	---\n:amount: 0\n:currency: USD\n	Spree::Calculator::Shipping::FlatRate	2026-09-30 12:07:20.931328
\.


--
-- Data for Name: spree_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_carts (id, store_id, market_id, channel_id, customer_id, currency, locale, email, ship_address_id, bill_address_id, accept_marketing, customer_note, last_ip_address, token, lock_version, completed_at, completing_at, coupon_code, gift_card_id, preferred_stock_location_id, item_total, adjustment_total, included_tax_total, additional_tax_total, taxable_adjustment_total, non_taxable_adjustment_total, discount_total, fee_total, delivery_total, total, payment_total, total_quantity, metadata, created_at, updated_at, company_id, po_number) FROM stdin;
\.


--
-- Data for Name: spree_catalog_assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_catalog_assignments (id, catalog_id, assignable_type, assignable_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_catalog_order_minimums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_catalog_order_minimums (id, catalog_id, currency, amount, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_catalog_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_catalog_products (id, catalog_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_catalog_quantity_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_catalog_quantity_rules (id, catalog_id, variant_id, minimum_order_quantity, order_multiple, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_catalogs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_catalogs (id, store_id, name, active, "position", metadata, created_at, updated_at, description, minimum_order_quantity, order_multiple) FROM stdin;
\.


--
-- Data for Name: spree_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_categories (id, automatic, children_count, created_at, depth, description, hide_from_nav, lft, meta_description, meta_keywords, meta_title, name, parent_id, permalink, "position", pretty_name, metadata, products_count, rgt, rules_match_policy, sort_order, store_id, taxonomy_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_category_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_category_translations (id, created_at, description, locale, meta_description, meta_keywords, meta_title, name, permalink, pretty_name, spree_category_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_channel_stock_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_channel_stock_locations (id, channel_id, stock_location_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_channels (id, active, code, created_at, "default", name, preferences, store_id, updated_at, default_catalog_id) FROM stdin;
1	t	online	2026-09-30 12:07:18.703773	t	Online Store	---\n:storefront_access:\n:guest_checkout:\n:order_routing_strategy:\n	1	2026-09-30 12:07:18.703773	\N
2	t	wholesale	2026-09-30 12:07:19.580034	f	Wholesale	---\n:storefront_access: login_required\n:guest_checkout: false\n:order_routing_strategy:\n	1	2026-09-30 12:07:19.580034	\N
\.


--
-- Data for Name: spree_claim_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_claim_line_items (id, claim_id, line_item_id, variant_id, replacement_variant_id, quantity, send_replacement, refund_amount, description, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_claim_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_claim_reasons (id, name, store_id, active, metadata, created_at, updated_at) FROM stdin;
1	Arrived damaged	1	t	\N	2026-09-30 12:07:20.093314	2026-09-30 12:07:20.093314
2	Never arrived	1	t	\N	2026-09-30 12:07:20.09985	2026-09-30 12:07:20.09985
3	Wrong item sent	1	t	\N	2026-09-30 12:07:20.106732	2026-09-30 12:07:20.106732
4	Missing item from order	1	t	\N	2026-09-30 12:07:20.111712	2026-09-30 12:07:20.111712
5	Item not as described	1	t	\N	2026-09-30 12:07:20.116806	2026-09-30 12:07:20.116806
\.


--
-- Data for Name: spree_claims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_claims (id, number, store_id, order_id, reason_id, created_by_id, status, resolution, memo, approved_at, resolved_at, denied_at, canceled_at, metadata, created_at, updated_at, created_by_type) FROM stdin;
\.


--
-- Data for Name: spree_collection_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_collection_rules (id, collection_id, created_at, match_policy, type, updated_at, value) FROM stdin;
\.


--
-- Data for Name: spree_collection_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_collection_translations (id, created_at, locale, meta_description, meta_keywords, meta_title, name, permalink, spree_collection_id, updated_at, description) FROM stdin;
\.


--
-- Data for Name: spree_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_collections (id, automatic, created_at, meta_description, meta_keywords, meta_title, metadata, name, permalink, "position", products_count, rules_match_policy, sort_order, store_id, updated_at, description) FROM stdin;
\.


--
-- Data for Name: spree_commission_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_commission_lines (id, order_id, seller_id, line_item_id, fulfillment_id, commission_rate_id, rate, kind, amount, tax_amount, tax_rate, total, currency, taxability_reason, country_code, state_code, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_commission_rate_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_commission_rate_values (id, commission_rate_id, currency, amount, min_amount, max_amount, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: spree_commission_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_commission_rates (id, store_id, name, code, enabled, "position", kind, value, tax_inclusive, include_shipping, commission_tax_rate, metadata, created_at, updated_at, deleted_at) FROM stdin;
1	1	Marketplace default	marketplace-default	f	1	percentage	0.00000	f	f	\N	\N	2026-09-30 12:07:20.187257	2026-09-30 12:07:20.187257	\N
\.


--
-- Data for Name: spree_commission_rule_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_commission_rule_products (id, commission_rule_id, product_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: spree_commission_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_commission_rules (id, commission_rate_id, type, preferences, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: spree_companies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_companies (id, store_id, parent_id, name, kind, metadata, default_bill_address_id, default_ship_address_id, created_at, updated_at, po_number_required) FROM stdin;
\.


--
-- Data for Name: spree_company_invitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_company_invitations (id, company_id, inviter_id, customer_id, email, token, expires_at, accepted_at, revoked_at, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_company_memberships; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_company_memberships (id, company_id, customer_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_consent_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_consent_records (id, store_id, owner_type, owner_id, purpose, source, accepted, email, ip_address, user_agent, documents, recorded_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_consolidated_metadata_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_consolidated_metadata_tables (id, table_name) FROM stdin;
\.


--
-- Data for Name: spree_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_countries (id, created_at, iso, iso3, iso_name, name, numcode, states_required, updated_at, zipcode_required) FROM stdin;
\.


--
-- Data for Name: spree_coupon_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_coupon_codes (id, code, created_at, deleted_at, order_id, promotion_id, state, updated_at, cart_id) FROM stdin;
\.


--
-- Data for Name: spree_credit_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_credit_cards (id, address_id, cc_type, created_at, "default", deleted_at, fingerprint, gateway_customer_id, gateway_customer_profile_id, gateway_payment_profile_id, last_digits, month, name, payment_method_id, metadata, updated_at, customer_id, year) FROM stdin;
\.


--
-- Data for Name: spree_custom_domains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_custom_domains (id, created_at, "default", metadata, status, store_id, updated_at, url) FROM stdin;
\.


--
-- Data for Name: spree_custom_field_definitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_custom_field_definitions (id, created_at, key, field_type, label, namespace, resource_type, searchable, sortable, updated_at, storefront_visible, store_id, filter_key) FROM stdin;
\.


--
-- Data for Name: spree_custom_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_custom_fields (id, created_at, custom_field_definition_id, resource_id, resource_type, type, updated_at, value) FROM stdin;
\.


--
-- Data for Name: spree_customer_group_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_customer_group_users (id, created_at, customer_group_id, updated_at, customer_id, customer_type) FROM stdin;
\.


--
-- Data for Name: spree_customer_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_customer_groups (id, created_at, deleted_at, description, name, store_id, updated_at) FROM stdin;
1	2026-09-30 12:07:19.968728	\N	\N	Wholesale	1	2026-09-30 12:07:19.968728
\.


--
-- Data for Name: spree_customer_returns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_customer_returns (id, created_at, number, metadata, stock_location_id, store_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_customers (id, email, password_digest, first_name, last_name, phone, selected_locale, accepts_email_marketing, bill_address_id, ship_address_id, failed_attempts, locked_at, metadata, created_at, updated_at, internal_note, email_marketing_consent_updated_at, email_marketing_consent_source, anonymized_at) FROM stdin;
\.


--
-- Data for Name: spree_data_feeds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_data_feeds (id, active, created_at, name, slug, store_id, type, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_data_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_data_requests (id, store_id, customer_id, number, download_token, kind, status, email, requested_at, completed_at, expires_at, error_message, requested_by_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_deliveries (id, owner_type, owner_id, store_id, shipping_label_id, tracking_number, tracking_url, carrier, service, status, estimated_delivery_at, delivered_at, details, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_delivery_method_rule_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_method_rule_products (id, delivery_method_rule_id, product_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_delivery_method_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_method_rules (id, type, delivery_method_id, active, preferences, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_delivery_method_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_method_services (id, delivery_method_id, carrier, service, label, markup_flat, markup_percent, "position", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_delivery_method_stock_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_method_stock_locations (id, delivery_method_id, stock_location_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_delivery_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_methods (id, admin_name, code, created_at, deleted_at, display_on, estimated_transit_business_days_max, estimated_transit_business_days_min, name, metadata, tax_category_id, tracking_url, updated_at, storefront_visible, fulfillment_provider, pickup_point_provider, store_id, rate_provider, markup_flat, markup_percent, delivery_profile_id, delivery_origin_group_id, delivery_zone_id, seller_id, available_to_sellers) FROM stdin;
1	\N	\N	2026-09-30 12:07:19.798425	\N	\N	\N	\N	Digital Delivery	\N	\N	\N	2026-09-30 12:07:19.798425	t	Spree::FulfillmentProvider::Digital	\N	1	\N	0.00	0.00	2	2	\N	\N	f
2	\N	\N	2026-09-30 12:07:20.85717	\N	\N	\N	\N	Standard	\N	\N	\N	2026-09-30 12:07:20.85717	t	Spree::FulfillmentProvider::Manual	\N	1	\N	0.00	0.00	1	1	1	\N	f
3	\N	\N	2026-09-30 12:07:20.8766	\N	\N	\N	\N	International Shipping	\N	\N	\N	2026-09-30 12:07:20.8766	t	Spree::FulfillmentProvider::Manual	\N	1	\N	0.00	0.00	1	1	2	\N	f
4	\N	\N	2026-09-30 12:07:20.93057	\N	\N	\N	\N	Store Pickup	\N	\N	\N	2026-09-30 12:07:20.93057	t	Spree::FulfillmentProvider::Pickup	\N	1	\N	0.00	0.00	1	1	\N	\N	f
\.


--
-- Data for Name: spree_delivery_origin_group_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_origin_group_locations (id, delivery_origin_group_id, stock_location_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_delivery_origin_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_origin_groups (id, delivery_profile_id, name, "position", created_at, updated_at) FROM stdin;
1	1	\N	1	2026-09-30 12:07:19.390896	2026-09-30 12:07:19.390896
2	2	\N	1	2026-09-30 12:07:19.698727	2026-09-30 12:07:19.698727
\.


--
-- Data for Name: spree_delivery_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_profiles (id, created_at, name, updated_at, store_id, "default", type, "position") FROM stdin;
1	2026-09-30 12:07:19.352534	General	2026-09-30 12:07:19.352534	1	t	Spree::DeliveryProfiles::Shipping	1
2	2026-09-30 12:07:19.690884	Digital	2026-09-30 12:07:19.690884	1	f	Spree::DeliveryProfiles::Digital	2
\.


--
-- Data for Name: spree_delivery_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_rates (id, cost, created_at, selected, fulfillment_id, delivery_method_id, tax_rate_id, updated_at, carrier, service_level, estimated_delivery_date, metadata, name, unpriced) FROM stdin;
\.


--
-- Data for Name: spree_delivery_zone_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_zone_members (id, delivery_zone_id, member_type, country_id, state_id, postal_code_prefix, postal_code_from, postal_code_to, created_at, updated_at, country_code, state_code) FROM stdin;
1	1	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.799657	2026-09-30 12:07:20.799657	US	\N
2	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AD	\N
3	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AE	\N
4	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AF	\N
5	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AG	\N
6	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AI	\N
7	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AL	\N
8	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AM	\N
9	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AO	\N
10	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AR	\N
11	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AS	\N
12	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AT	\N
13	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AU	\N
14	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AW	\N
15	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	AZ	\N
16	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BA	\N
17	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BB	\N
18	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BD	\N
19	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BE	\N
20	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BF	\N
21	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BG	\N
22	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BH	\N
23	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BI	\N
24	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BJ	\N
25	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BL	\N
26	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BM	\N
27	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BN	\N
28	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BO	\N
29	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BQ	\N
30	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BR	\N
31	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BS	\N
32	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BT	\N
33	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BW	\N
34	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BY	\N
35	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	BZ	\N
36	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CA	\N
37	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CC	\N
38	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CD	\N
39	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CF	\N
40	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CG	\N
41	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CH	\N
42	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CI	\N
43	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CK	\N
44	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CL	\N
45	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CM	\N
46	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CN	\N
47	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CO	\N
48	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CR	\N
49	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CU	\N
50	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CV	\N
51	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CW	\N
52	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CX	\N
53	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CY	\N
54	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	CZ	\N
55	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	DE	\N
56	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	DJ	\N
57	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	DK	\N
58	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	DM	\N
59	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	DO	\N
60	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	DZ	\N
61	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	EC	\N
62	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	EE	\N
63	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	EG	\N
64	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ER	\N
65	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ES	\N
66	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ET	\N
67	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	FI	\N
68	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	FJ	\N
69	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	FK	\N
70	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	FM	\N
71	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	FO	\N
72	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	FR	\N
73	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GA	\N
74	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GB	\N
75	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GD	\N
76	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GE	\N
77	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GF	\N
78	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GG	\N
79	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GH	\N
80	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GI	\N
81	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GL	\N
82	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GM	\N
83	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GN	\N
84	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GP	\N
85	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GQ	\N
86	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GR	\N
87	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GT	\N
88	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GU	\N
89	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GW	\N
90	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	GY	\N
91	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	HK	\N
92	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	HN	\N
93	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	HR	\N
94	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	HT	\N
95	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	HU	\N
96	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ID	\N
97	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	IE	\N
98	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	IL	\N
99	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	IM	\N
100	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	IN	\N
101	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	IQ	\N
102	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	IR	\N
103	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	IS	\N
104	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	IT	\N
105	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	JE	\N
106	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	JM	\N
107	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	JO	\N
108	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	JP	\N
109	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KE	\N
110	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KG	\N
111	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KH	\N
112	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KI	\N
113	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KM	\N
114	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KN	\N
115	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KP	\N
116	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KR	\N
117	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KW	\N
118	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KY	\N
119	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	KZ	\N
120	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LA	\N
121	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LB	\N
122	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LC	\N
123	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LI	\N
124	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LK	\N
125	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LR	\N
126	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LS	\N
127	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LT	\N
128	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LU	\N
129	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LV	\N
130	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	LY	\N
131	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MA	\N
132	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MC	\N
133	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MD	\N
134	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ME	\N
135	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MF	\N
136	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MG	\N
137	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MH	\N
138	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MK	\N
139	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ML	\N
140	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MM	\N
141	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MN	\N
142	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MO	\N
143	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MP	\N
144	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MQ	\N
145	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MR	\N
146	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MS	\N
147	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MT	\N
148	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MU	\N
149	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MV	\N
150	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MW	\N
151	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MX	\N
152	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MY	\N
153	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	MZ	\N
154	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NA	\N
155	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NC	\N
156	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NE	\N
157	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NF	\N
158	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NG	\N
159	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NI	\N
160	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NL	\N
161	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NO	\N
162	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NP	\N
163	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NR	\N
164	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NU	\N
165	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	NZ	\N
166	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	OM	\N
167	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PA	\N
168	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PE	\N
169	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PF	\N
170	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PG	\N
171	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PH	\N
172	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PK	\N
173	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PL	\N
174	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PM	\N
175	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PN	\N
176	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PR	\N
177	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PS	\N
178	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PT	\N
179	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PW	\N
180	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	PY	\N
181	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	QA	\N
182	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	RE	\N
183	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	RO	\N
184	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	RS	\N
185	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	RU	\N
186	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	RW	\N
187	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SA	\N
188	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SB	\N
189	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SC	\N
190	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SD	\N
191	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SE	\N
192	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SG	\N
193	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SH	\N
194	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SI	\N
195	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SJ	\N
196	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SK	\N
197	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SL	\N
198	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SM	\N
199	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SN	\N
200	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SO	\N
201	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SR	\N
202	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SS	\N
203	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ST	\N
204	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SV	\N
205	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SX	\N
206	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SY	\N
207	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	SZ	\N
208	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TC	\N
209	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TD	\N
210	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TG	\N
211	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TH	\N
212	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TJ	\N
213	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TK	\N
214	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TL	\N
215	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TM	\N
216	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TN	\N
217	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TO	\N
218	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TR	\N
219	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TT	\N
220	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TV	\N
221	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TW	\N
222	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	TZ	\N
223	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	UA	\N
224	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	UG	\N
225	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	UY	\N
226	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	UZ	\N
227	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	VA	\N
228	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	VC	\N
229	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	VE	\N
230	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	VG	\N
231	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	VI	\N
232	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	VN	\N
233	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	VU	\N
234	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	WF	\N
235	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	WS	\N
236	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	YE	\N
237	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	YT	\N
238	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ZA	\N
239	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ZM	\N
240	2	country	\N	\N	\N	\N	\N	2026-09-30 12:07:20.81091	2026-09-30 12:07:20.81091	ZW	\N
\.


--
-- Data for Name: spree_delivery_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_delivery_zones (id, store_id, name, description, metadata, created_at, updated_at, delivery_profile_id, delivery_origin_group_id) FROM stdin;
1	1	Domestic	United States	{}	2026-09-30 12:07:20.79304	2026-09-30 12:07:20.79304	1	1
2	1	International	Everywhere else	{}	2026-09-30 12:07:20.805091	2026-09-30 12:07:20.805091	1	1
\.


--
-- Data for Name: spree_digital_assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_digital_assets (id, created_at, updated_at, variant_id, authorized_clicks, authorized_days, provider_type, metadata) FROM stdin;
\.


--
-- Data for Name: spree_digital_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_digital_links (id, access_counter, created_at, digital_asset_id, line_item_id, token, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_discounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_discounts (id, cart_id, order_id, promotion_action_id, promotion_id, line_item_id, fulfillment_id, amount, label, kind, code, value, value_type, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_exchange_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_exchange_line_items (id, exchange_id, fulfillment_item_id, line_item_id, original_variant_id, new_variant_id, quantity, received_quantity, resellable, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_exchanges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_exchanges (id, number, store_id, order_id, stock_location_id, reason_id, created_by_id, status, memo, approved_at, received_at, fulfilled_at, canceled_at, metadata, created_at, updated_at, created_by_type) FROM stdin;
\.


--
-- Data for Name: spree_exports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_exports (id, created_at, format, number, preferences, search_params, store_id, type, updated_at, user_id, seller_id) FROM stdin;
\.


--
-- Data for Name: spree_external_references; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_external_references (id, store_id, system, resource_type, resource_id, external_id, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_fees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_fees (id, cart_id, order_id, line_item_id, fulfillment_id, amount, label, kind, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_fulfillment_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_fulfillment_items (id, created_at, line_item_id, order_id, original_return_item_id, pending, quantity, fulfillment_id, status, updated_at, variant_id) FROM stdin;
\.


--
-- Data for Name: spree_fulfillments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_fulfillments (id, additional_tax_total, address_id, adjustment_total, cost, created_at, included_tax_total, non_taxable_adjustment_total, number, order_id, pre_tax_amount, metadata, discount_total, fulfilled_at, status, stock_location_id, taxable_adjustment_total, tracking, updated_at, fulfillment_type, pickup_point_data, cart_id, delivered_at) FROM stdin;
\.


--
-- Data for Name: spree_gateway_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_gateway_customers (id, created_at, payment_method_id, profile_id, updated_at, customer_id) FROM stdin;
\.


--
-- Data for Name: spree_gateways; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_gateways (id, active, created_at, description, environment, name, preferences, server, test_mode, type, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_gift_card_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_gift_card_batches (id, amount, codes_count, created_at, created_by_id, currency, expires_at, prefix, store_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_gift_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_gift_cards (id, amount, amount_authorized, amount_used, code, created_at, created_by_id, currency, expires_at, gift_card_batch_id, redeemed_at, status, store_id, updated_at, customer_id) FROM stdin;
\.


--
-- Data for Name: spree_import_mappings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_import_mappings (id, created_at, file_column, import_id, schema_field, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_import_rows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_import_rows (id, created_at, data, import_id, item_id, item_type, row_number, status, updated_at, validation_errors) FROM stdin;
\.


--
-- Data for Name: spree_imports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_imports (id, completed_groups_count, created_at, number, owner_id, owner_type, preferences, processing_errors, processing_groups_count, rows_count, status, type, updated_at, user_id, store_id, seller_id) FROM stdin;
\.


--
-- Data for Name: spree_integrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_integrations (id, active, created_at, preferences, store_id, type, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_invitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_invitations (id, accepted_at, created_at, deleted_at, email, expires_at, invitee_id, invitee_type, inviter_id, inviter_type, resource_id, resource_type, role_id, status, token, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_line_items (id, additional_tax_total, adjustment_total, cost_price, created_at, currency, included_tax_total, non_taxable_adjustment_total, order_id, pre_tax_amount, price, price_list_id, metadata, discount_total, quantity, tax_category_id, taxable_adjustment_total, updated_at, variant_id, cart_id, seller_id, price_source) FROM stdin;
\.


--
-- Data for Name: spree_log_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_log_entries (id, created_at, details, source_id, source_type, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_market_countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_market_countries (id, country_id, created_at, market_id, updated_at, country_code) FROM stdin;
1	\N	2026-09-30 12:07:18.669562	1	2026-09-30 12:07:18.669562	US
\.


--
-- Data for Name: spree_markets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_markets (id, created_at, currency, "default", default_locale, deleted_at, name, "position", store_id, supported_locales, tax_inclusive, updated_at, tax_provider) FROM stdin;
1	2026-09-30 12:07:18.661629	USD	t	en	\N	United States	1	1	\N	f	2026-09-30 12:07:18.661629	\N
\.


--
-- Data for Name: spree_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_media (id, alt, attachment_content_type, attachment_file_name, attachment_file_size, attachment_height, attachment_updated_at, attachment_width, created_at, external_video_url, focal_point_x, focal_point_y, media_type, "position", metadata, session_id, type, updated_at, viewable_id, viewable_type, store_id) FROM stdin;
\.


--
-- Data for Name: spree_newsletter_subscribers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_newsletter_subscribers (id, created_at, email, metadata, store_id, updated_at, customer_id, verification_token, verified_at) FROM stdin;
\.


--
-- Data for Name: spree_number_sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_number_sequences (id, store_id, resource_type, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_option_type_product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_option_type_product_types (id, created_at, option_type_id, product_type_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_option_type_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_option_type_translations (id, created_at, locale, label, spree_option_type_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_option_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_option_types (id, created_at, filterable, kind, name, "position", label, metadata, updated_at, store_id) FROM stdin;
\.


--
-- Data for Name: spree_option_value_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_option_value_translations (id, created_at, locale, label, spree_option_value_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_option_value_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_option_value_variants (id, created_at, option_value_id, updated_at, variant_id) FROM stdin;
\.


--
-- Data for Name: spree_option_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_option_values (id, color_code, created_at, name, option_type_id, "position", label, metadata, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_order_cancellation_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_order_cancellation_reasons (id, name, store_id, active, metadata, created_at, updated_at) FROM stdin;
1	Customer changed their mind	1	t	\N	2026-09-30 12:07:20.128004	2026-09-30 12:07:20.128004
2	Payment declined	1	t	\N	2026-09-30 12:07:20.132966	2026-09-30 12:07:20.132966
3	Suspected fraud	1	t	\N	2026-09-30 12:07:20.141046	2026-09-30 12:07:20.141046
4	Out of stock	1	t	\N	2026-09-30 12:07:20.149351	2026-09-30 12:07:20.149351
5	Duplicate order	1	t	\N	2026-09-30 12:07:20.157642	2026-09-30 12:07:20.157642
6	Staff error	1	t	\N	2026-09-30 12:07:20.162631	2026-09-30 12:07:20.162631
7	Order expired	1	t	\N	2026-09-30 12:07:20.167045	2026-09-30 12:07:20.167045
\.


--
-- Data for Name: spree_order_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_order_groups (id, store_id, customer_id, cart_id, number, currency, email, token, ship_address_id, bill_address_id, metadata, created_at, updated_at, confirmation_delivered, store_owner_notification_delivered) FROM stdin;
\.


--
-- Data for Name: spree_order_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_order_promotions (id, created_at, order_id, promotion_id, updated_at, cart_id) FROM stdin;
\.


--
-- Data for Name: spree_order_routing_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_order_routing_rules (id, active, channel_id, created_at, "position", preferences, store_id, type, updated_at) FROM stdin;
1	t	1	2026-09-30 12:07:18.730523	1	\N	1	Spree::OrderRouting::Rules::PreferredLocation	2026-09-30 12:07:18.730523
2	t	1	2026-09-30 12:07:18.749004	2	\N	1	Spree::OrderRouting::Rules::MinimizeSplits	2026-09-30 12:07:18.749004
3	t	1	2026-09-30 12:07:18.764788	3	\N	1	Spree::OrderRouting::Rules::DefaultLocation	2026-09-30 12:07:18.764788
4	t	2	2026-09-30 12:07:19.590071	1	\N	1	Spree::OrderRouting::Rules::PreferredLocation	2026-09-30 12:07:19.590071
5	t	2	2026-09-30 12:07:19.607395	2	\N	1	Spree::OrderRouting::Rules::MinimizeSplits	2026-09-30 12:07:19.607395
6	t	2	2026-09-30 12:07:19.6192	3	\N	1	Spree::OrderRouting::Rules::DefaultLocation	2026-09-30 12:07:19.6192
\.


--
-- Data for Name: spree_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_orders (id, accept_marketing, additional_tax_total, adjustment_total, approved_at, approver_id, bill_address_id, canceled_at, canceler_id, channel, channel_id, completed_at, confirmation_delivered, considered_risky, created_at, created_by_id, currency, email, gift_card_id, included_tax_total, internal_note, total_quantity, item_total, last_ip_address, locale, market_id, non_taxable_adjustment_total, number, payment_status, payment_total, preferred_stock_location_id, metadata, discount_total, ship_address_id, fulfillment_status, delivery_total, signup_for_an_account, customer_note, lock_version, status, store_id, store_owner_notification_delivered, taxable_adjustment_total, token, total, updated_at, customer_id, cart_id, fee_total, coupon_code, company_id, seller_id, order_group_id, po_number, cancel_reason_id, cancel_note, commission_amount_total, commission_tax_total, commission_total, created_by_type, approver_type, canceler_type) FROM stdin;
\.


--
-- Data for Name: spree_package_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_package_types (id, store_id, name, kind, length, width, height, dimensions_unit, weight, max_weight, weight_unit, "default", metadata, created_at, updated_at, seller_id) FROM stdin;
1	1	Shipping box	box	12.00	9.00	4.00	in	0.50	\N	lb	t	\N	2026-09-30 12:07:20.901238	2026-09-30 12:07:20.901238	\N
\.


--
-- Data for Name: spree_payment_capture_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_payment_capture_events (id, amount, created_at, payment_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_payment_methods; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_payment_methods (id, active, auto_capture, created_at, deleted_at, description, name, "position", preferences, metadata, settings, store_id, type, updated_at, capture_method, storefront_visible) FROM stdin;
1	t	\N	2026-09-30 12:07:19.845668	\N	Store Credit	Store Credit	1	\N	\N	\N	1	Spree::PaymentMethod::StoreCredit	2026-09-30 12:07:19.845668	\N	t
\.


--
-- Data for Name: spree_payment_methods_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_payment_methods_stores (payment_method_id, store_id) FROM stdin;
\.


--
-- Data for Name: spree_payment_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_payment_sessions (id, amount, created_at, currency, customer_external_id, customer_id, deleted_at, expires_at, external_data, external_id, order_id, payment_method_id, status, type, updated_at, cart_id) FROM stdin;
\.


--
-- Data for Name: spree_payment_setup_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_payment_setup_sessions (id, created_at, customer_id, deleted_at, external_client_secret, external_data, external_id, payment_method_id, payment_source_id, payment_source_type, status, type, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_payment_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_payment_sources (id, created_at, gateway_customer_profile_id, gateway_payment_profile_id, payment_method_id, metadata, type, updated_at, customer_id) FROM stdin;
\.


--
-- Data for Name: spree_payment_splits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_payment_splits (id, payment_id, order_id, authorized_amount, captured_amount, refunded_amount, currency, created_at, updated_at, claimed_amount) FROM stdin;
\.


--
-- Data for Name: spree_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_payments (id, amount, avs_response, created_at, cvv_response_code, cvv_response_message, number, order_id, payment_method_id, metadata, response_code, source_id, source_type, status, updated_at, cart_id, order_group_id) FROM stdin;
\.


--
-- Data for Name: spree_paypal_checkout_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_paypal_checkout_orders (id, amount, created_at, data, order_id, payment_method_id, paypal_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_policies (id, created_at, name, owner_id, owner_type, slug, updated_at, body) FROM stdin;
1	2026-09-30 12:07:19.18965	Terms of Service	1	Spree::Store	terms-of-service	2026-09-30 12:07:19.18965	\N
2	2026-09-30 12:07:19.219605	Privacy Policy	1	Spree::Store	privacy-policy	2026-09-30 12:07:19.219605	\N
3	2026-09-30 12:07:19.247675	Returns Policy	1	Spree::Store	returns-policy	2026-09-30 12:07:19.247675	\N
4	2026-09-30 12:07:19.276765	Shipping Policy	1	Spree::Store	shipping-policy	2026-09-30 12:07:19.276765	\N
\.


--
-- Data for Name: spree_policy_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_policy_translations (id, created_at, locale, name, spree_policy_id, updated_at, body) FROM stdin;
\.


--
-- Data for Name: spree_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_preferences (id, created_at, key, updated_at, value) FROM stdin;
\.


--
-- Data for Name: spree_price_adjustment_tiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_price_adjustment_tiers (id, price_list_id, min_quantity, percentage, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_price_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_price_histories (id, amount, compare_at_amount, created_at, currency, price_id, recorded_at, variant_id) FROM stdin;
\.


--
-- Data for Name: spree_price_lists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_price_lists (id, created_at, deleted_at, description, ends_at, match_policy, name, "position", starts_at, status, store_id, updated_at, catalog_id, price_adjustment_percentage, adjust_compare_at) FROM stdin;
\.


--
-- Data for Name: spree_price_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_price_rules (id, created_at, preferences, price_list_id, type, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_prices (id, amount, compare_at_amount, created_at, currency, deleted_at, price_list_id, updated_at, variant_id, min_quantity) FROM stdin;
\.


--
-- Data for Name: spree_product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_categories (id, category_id, created_at, "position", product_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_collections (id, collection_id, created_at, "position", product_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_option_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_option_types (id, created_at, option_type_id, "position", product_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_promotion_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_promotion_rules (id, created_at, product_id, promotion_rule_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_publications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_publications (id, channel_id, created_at, product_id, published_at, unpublished_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_submissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_submissions (id, product_id, status, submitted_by_id, reviewed_by_id, reviewed_at, review_note, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_translations (id, created_at, deleted_at, description, locale, meta_description, meta_keywords, meta_title, name, slug, spree_product_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_type_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_type_categories (id, created_at, product_type_id, category_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_type_custom_field_definitions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_type_custom_field_definitions (id, product_type_id, custom_field_definition_id, required, sort_order, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_type_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_type_translations (id, name, locale, spree_product_type_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_product_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_product_types (id, created_at, name, metadata, updated_at, store_id, products_count, delivery_profile_id) FROM stdin;
1	2026-09-30 12:07:19.900592	Default	\N	2026-09-30 12:07:19.900592	1	0	\N
2	2026-09-30 12:07:19.942111	Digital	\N	2026-09-30 12:07:19.942111	1	0	2
\.


--
-- Data for Name: spree_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_products (id, available_on, categories_count, collections_count, created_at, default_variant_id, deleted_at, description, discontinue_on, make_active_at, media_count, meta_description, meta_keywords, meta_title, name, primary_media_id, metadata, promotionable, revenue, delivery_profile_id, slug, status, store_id, tax_category_id, units_sold_count, updated_at, variant_count, product_type_id, seller_id) FROM stdin;
\.


--
-- Data for Name: spree_products_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_products_stores (id, created_at, product_id, revenue, store_id, units_sold_count, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_promotion_action_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_promotion_action_line_items (id, created_at, promotion_action_id, quantity, updated_at, variant_id) FROM stdin;
\.


--
-- Data for Name: spree_promotion_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_promotion_actions (id, created_at, deleted_at, "position", promotion_id, type, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_promotion_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_promotion_categories (id, code, created_at, name, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_promotion_rule_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_promotion_rule_categories (id, category_id, created_at, promotion_rule_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_promotion_rule_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_promotion_rule_users (id, created_at, promotion_rule_id, updated_at, customer_id) FROM stdin;
\.


--
-- Data for Name: spree_promotion_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_promotion_rules (id, code, created_at, preferences, product_group_id, promotion_id, type, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: spree_promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_promotions (id, advertise, code, code_prefix, created_at, description, expires_at, kind, match_policy, multi_codes, name, number_of_codes, path, metadata, promotion_category_id, starts_at, store_id, type, updated_at, usage_limit) FROM stdin;
\.


--
-- Data for Name: spree_promotions_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_promotions_stores (id, created_at, promotion_id, store_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_purchase_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_purchase_order_items (id, purchase_order_id, variant_id, quantity_ordered, quantity_received, unit_cost, created_at, updated_at, quantity_rejected) FROM stdin;
\.


--
-- Data for Name: spree_purchase_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_purchase_orders (id, number, status, currency, reference, supplier_id, store_id, destination_location_id, expected_at, ordered_at, received_at, notes, created_by_id, metadata, created_at, updated_at, cancel_by, closed_short_at, close_reason) FROM stdin;
\.


--
-- Data for Name: spree_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_refresh_tokens (id, created_at, expires_at, ip_address, token, updated_at, user_agent, user_id, user_type, audience) FROM stdin;
1	2026-09-30 12:07:57.09864	2026-10-30 12:07:57.076649	172.21.0.1	oPFYjs64x77by1hSZvj4Di2Y	2026-09-30 12:07:57.09864	curl/8.7.1	1	Spree::AdminUser	admin_api
2	2026-09-30 12:08:01.294264	2026-10-30 12:08:01.287957	172.21.0.1	xWV9ufmvFSizdQTRF6f1DUxC	2026-09-30 12:08:01.294264	curl/8.7.1	1	Spree::AdminUser	admin_api
\.


--
-- Data for Name: spree_refund_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_refund_reasons (id, active, created_at, name, updated_at, store_id) FROM stdin;
1	t	2026-09-30 12:07:20.005145	Return processing	2026-09-30 12:07:20.005145	1
\.


--
-- Data for Name: spree_refunds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_refunds (id, amount, created_at, payment_id, metadata, refund_reason_id, refunder_id, reimbursement_id, transaction_id, updated_at, originator_type, originator_id, order_id, refunder_type) FROM stdin;
\.


--
-- Data for Name: spree_reimbursement_credits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_reimbursement_credits (id, amount, created_at, creditable_id, creditable_type, reimbursement_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_reimbursement_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_reimbursement_types (id, active, created_at, mutable, name, type, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_reimbursements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_reimbursements (id, created_at, customer_return_id, number, order_id, performed_by_id, reimbursement_status, total, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_reports (id, created_at, currency, date_from, date_to, store_id, type, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: spree_return_authorizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_return_authorizations (id, created_at, memo, number, order_id, return_authorization_reason_id, state, stock_location_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_return_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_return_items (id, acceptance_status, acceptance_status_errors, additional_tax_total, created_at, customer_return_id, exchange_variant_id, included_tax_total, fulfillment_item_id, override_reimbursement_type_id, pre_tax_amount, preferred_reimbursement_type_id, reception_status, reimbursement_id, resellable, return_authorization_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_return_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_return_line_items (id, return_id, fulfillment_item_id, line_item_id, variant_id, quantity, received_quantity, pre_tax_amount, resellable, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_return_reasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_return_reasons (id, active, created_at, name, updated_at, store_id) FROM stdin;
1	t	2026-09-30 12:07:20.022946	Better price available	2026-09-30 12:07:20.022946	1
2	t	2026-09-30 12:07:20.029892	Missed estimated delivery date	2026-09-30 12:07:20.029892	1
3	t	2026-09-30 12:07:20.035694	Missing parts or accessories	2026-09-30 12:07:20.035694	1
4	t	2026-09-30 12:07:20.042329	Damaged/Defective	2026-09-30 12:07:20.042329	1
5	t	2026-09-30 12:07:20.049401	Different from what was ordered	2026-09-30 12:07:20.049401	1
6	t	2026-09-30 12:07:20.059055	Different from description	2026-09-30 12:07:20.059055	1
7	t	2026-09-30 12:07:20.064463	No longer needed/wanted	2026-09-30 12:07:20.064463	1
8	t	2026-09-30 12:07:20.070979	Accidental order	2026-09-30 12:07:20.070979	1
9	t	2026-09-30 12:07:20.077855	Unauthorized purchase	2026-09-30 12:07:20.077855	1
\.


--
-- Data for Name: spree_returns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_returns (id, number, store_id, order_id, stock_location_id, reason_id, created_by_id, status, memo, approved_at, received_at, refunded_at, canceled_at, metadata, created_at, updated_at, created_by_type) FROM stdin;
\.


--
-- Data for Name: spree_role_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_role_users (id, created_at, invitation_id, role_id, updated_at, user_id, user_type) FROM stdin;
1	2026-09-30 12:07:20.71174	\N	1	2026-09-30 12:07:20.71174	1	Spree::AdminUser
\.


--
-- Data for Name: spree_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_roles (id, created_at, name, updated_at, description, mutable, permissions, resource_type, resource_id) FROM stdin;
1	2026-09-30 12:07:19.676253	admin	2026-09-30 12:07:19.676253	\N	f	[]	Spree::Store	1
\.


--
-- Data for Name: spree_saved_reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_saved_reports (id, store_id, user_id, name, description, query, seeded, created_at, updated_at) FROM stdin;
1	1	\N	Sales over time	Daily sales, orders and average order value for the last four weeks, compared with the previous period.	{"compare": "previous_period", "metrics": ["total_sales", "orders", "average_order_value"], "dimensions": [{"name": "completed_at", "grain": "day"}], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.349447	2026-09-30 12:07:20.349447
2	1	\N	Net sales over time	Weekly gross sales, discounts, returns and net sales over the last twelve months.	{"compare": "previous_period", "metrics": ["gross_sales", "discounts", "returns", "net_sales"], "dimensions": [{"name": "completed_at", "grain": "week"}], "time_range": {"preset": "last_12_months"}}	t	2026-09-30 12:07:20.355265	2026-09-30 12:07:20.355265
3	1	\N	Sales by channel	Sales and orders per sales channel over the last four weeks.	{"sort": "-total_sales", "metrics": ["total_sales", "orders"], "dimensions": ["channel"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.368863	2026-09-30 12:07:20.368863
4	1	\N	Sales by market	Sales and orders per market over the last four weeks.	{"sort": "-total_sales", "metrics": ["total_sales", "orders"], "dimensions": ["market"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.373036	2026-09-30 12:07:20.373036
5	1	\N	Sales by country	Sales and orders by shipping country over the last four weeks.	{"sort": "-total_sales", "metrics": ["total_sales", "orders"], "dimensions": ["country"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.377074	2026-09-30 12:07:20.377074
6	1	\N	Top products	Best-selling products by net sales over the last four weeks.	{"sort": "-net_sales", "limit": 20, "metrics": ["net_sales", "units_sold"], "dimensions": ["product"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.380752	2026-09-30 12:07:20.380752
7	1	\N	Top categories	Best-selling categories by net sales over the last four weeks.	{"sort": "-net_sales", "limit": 20, "metrics": ["net_sales", "units_sold"], "dimensions": ["category"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.385214	2026-09-30 12:07:20.385214
8	1	\N	Top companies	Organisations ranked by spend over the last four weeks.	{"sort": "-total_sales", "limit": 20, "metrics": ["total_sales", "orders"], "dimensions": ["company"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.391369	2026-09-30 12:07:20.391369
9	1	\N	Top customers	Customers ranked by spend over the last four weeks.	{"sort": "-total_sales", "limit": 20, "metrics": ["total_sales", "orders"], "dimensions": ["customer"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.397208	2026-09-30 12:07:20.397208
10	1	\N	Product margin	Products ranked by gross profit over the last four weeks, with cost and margin.	{"sort": "-gross_profit", "limit": 20, "metrics": ["net_sales", "cost_of_goods", "gross_profit", "gross_margin"], "dimensions": ["product"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.401233	2026-09-30 12:07:20.401233
11	1	\N	Returns over time	Monthly refunds over the last twelve months, compared with the previous period.	{"compare": "previous_period", "metrics": ["returns", "orders"], "dimensions": [{"name": "completed_at", "grain": "month"}], "time_range": {"preset": "last_12_months"}}	t	2026-09-30 12:07:20.404702	2026-09-30 12:07:20.404702
12	1	\N	First-time vs returning	Sales split between first-time and returning buyers over the last four weeks.	{"compare": "previous_period", "metrics": ["total_sales", "orders", "customers"], "dimensions": ["customer_type"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.408834	2026-09-30 12:07:20.408834
13	1	\N	Seller payouts	What each seller earned last month, after the marketplace commission.	{"sort": "-seller_payout", "limit": 50, "metrics": ["net_sales", "commission", "seller_payout", "units_sold"], "dimensions": ["seller"], "time_range": {"preset": "last_month"}}	t	2026-09-30 12:07:20.412772	2026-09-30 12:07:20.412772
14	1	\N	Payments over time	Daily payments taken and refunded over the last four weeks, compared with the previous period.	{"compare": "previous_period", "metrics": ["payments_received", "payments_refunded", "net_payments"], "dimensions": [{"name": "paid_at", "grain": "day"}], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.416893	2026-09-30 12:07:20.416893
15	1	\N	Payments by method	What each payment method took, net of refunds, over the last four weeks.	{"sort": "-net_payments", "metrics": ["net_payments", "payments_count"], "dimensions": ["payment_method"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.421866	2026-09-30 12:07:20.421866
16	1	\N	Failed payments	Charges that failed over the last four weeks, by payment method.	{"sort": "-payments_failed", "metrics": ["payments_failed", "payments_count"], "dimensions": ["payment_method"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.426986	2026-09-30 12:07:20.426986
17	1	\N	Stock movement over time	Weekly units received and shipped over the last twelve months.	{"metrics": ["units_received", "units_shipped"], "dimensions": [{"name": "moved_at", "grain": "week"}], "time_range": {"preset": "last_12_months"}}	t	2026-09-30 12:07:20.430306	2026-09-30 12:07:20.430306
18	1	\N	Sell-through by variant	Units shipped against units received per variant over the last four weeks.	{"sort": "-units_shipped", "limit": 20, "metrics": ["units_shipped", "units_received", "sell_through"], "dimensions": ["moved_variant"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.434738	2026-09-30 12:07:20.434738
19	1	\N	Orders by payment status	Order counts and sales grouped by payment status over the last four weeks.	{"metrics": ["orders", "total_sales"], "dimensions": ["payment_status"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.439057	2026-09-30 12:07:20.439057
20	1	\N	Orders by fulfillment status	Order counts and sales grouped by fulfillment status over the last four weeks.	{"metrics": ["orders", "total_sales"], "dimensions": ["fulfillment_status"], "time_range": {"preset": "last_4_weeks"}}	t	2026-09-30 12:07:20.444034	2026-09-30 12:07:20.444034
\.


--
-- Data for Name: spree_seller_payouts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_seller_payouts (id, store_id, seller_id, amount, currency, status, period_start, period_end, provider, reference, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_seller_requirement_custom_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_seller_requirement_custom_fields (id, seller_requirement_id, custom_field_definition_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_seller_requirement_submissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_seller_requirement_submissions (id, seller_id, seller_requirement_id, status, submitted_by_id, reviewed_by_id, reviewed_at, note, review_note, reference, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_seller_requirements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_seller_requirements (id, store_id, type, name, description, "position", active, required, preferences, metadata, created_at, updated_at) FROM stdin;
1	1	Spree::SellerRequirements::AcceptTerms	\N	\N	1	t	t	---\n:terms_body:\n:terms_effective_from:\n:terms_url:\n	\N	2026-09-30 12:07:20.212619	2026-09-30 12:07:20.212619
2	1	Spree::SellerRequirements::CompleteProfile	\N	\N	2	t	t	---\n:require_about: true\n:require_logo: true\n:require_cover_photo: false\n:require_contact_email: true\n	\N	2026-09-30 12:07:20.222627	2026-09-30 12:07:20.222627
3	1	Spree::SellerRequirements::BillingAddress	\N	\N	3	t	t	\N	\N	2026-09-30 12:07:20.232334	2026-09-30 12:07:20.232334
4	1	Spree::SellerRequirements::ReturnsAddress	\N	\N	4	t	t	\N	\N	2026-09-30 12:07:20.239652	2026-09-30 12:07:20.239652
5	1	Spree::SellerRequirements::DeliveryMethod	\N	\N	5	t	t	\N	\N	2026-09-30 12:07:20.248027	2026-09-30 12:07:20.248027
6	1	Spree::SellerRequirements::PackageType	\N	\N	6	t	t	\N	\N	2026-09-30 12:07:20.25566	2026-09-30 12:07:20.25566
7	1	Spree::SellerRequirements::MinimumProducts	\N	\N	7	t	t	---\n:minimum_count: 1\n	\N	2026-09-30 12:07:20.261299	2026-09-30 12:07:20.261299
\.


--
-- Data for Name: spree_seller_transfers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_seller_transfers (id, store_id, seller_id, order_id, payout_id, reversed_from_id, refund_id, amount, currency, kind, status, provider, reference, metadata, created_at, updated_at, settled_amount, settled_currency) FROM stdin;
\.


--
-- Data for Name: spree_seller_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_seller_translations (id, name, about, locale, spree_seller_id, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- Data for Name: spree_sellers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_sellers (id, store_id, name, slug, status, contact_email, billing_email, about, billing_address_id, terms_accepted_at, holiday_mode_until, payouts_schedule_interval, minimum_payout_amount, tax_remittance, metadata, created_at, updated_at, deleted_at, legal_name, registration_number, payouts_enabled_at) FROM stdin;
\.


--
-- Data for Name: spree_shipping_labels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_shipping_labels (id, owner_type, owner_id, store_id, integration_id, source, external_id, carrier, service, tracking_number, cost, currency, format, status, refunded_at, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_shipping_method_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_shipping_method_categories (id, created_at, shipping_category_id, shipping_method_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_state_changes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_state_changes (id, created_at, name, next_state, previous_state, stateful_id, stateful_type, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: spree_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_states (id, abbr, country_id, created_at, name, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_stock_levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stock_levels (id, backorderable, count_on_hand, created_at, deleted_at, metadata, stock_location_id, updated_at, variant_id, allocated_count, reserved_count, incoming_count) FROM stdin;
\.


--
-- Data for Name: spree_stock_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stock_locations (id, active, address1, address2, admin_name, backorderable_default, city, company, country_id, created_at, "default", deleted_at, kind, name, phone, pickup_enabled, pickup_instructions, pickup_ready_in_minutes, pickup_stock_policy, propagate_all_variants, state_id, state_name, updated_at, zipcode, store_id, country_code, state_code, seller_id, returns_enabled) FROM stdin;
1	t	\N	\N	\N	f	\N	\N	\N	2026-09-30 12:07:20.77686	t	\N	warehouse	Shop location	\N	t	\N	\N	local	f	\N	\N	2026-09-30 12:07:20.911284	\N	1	US	\N	\N	t
\.


--
-- Data for Name: spree_stock_movements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stock_movements (id, action, created_at, originator_id, originator_type, quantity, stock_level_id, updated_at, kind, reason, order_id, fulfillment_id, return_id, exchange_id, stock_transfer_id, purchase_order_id, unit_cost, stock_receipt_id) FROM stdin;
\.


--
-- Data for Name: spree_stock_receipt_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stock_receipt_items (id, stock_receipt_id, line_type, line_id, quantity_accepted, quantity_rejected, rejection_reason, notes, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_stock_receipts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stock_receipts (id, number, store_id, receivable_type, receivable_id, reference, received_at, received_by_id, notes, metadata, created_at, updated_at, received_by_type) FROM stdin;
\.


--
-- Data for Name: spree_stock_reservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stock_reservations (id, created_at, expires_at, line_item_id, order_id, quantity, stock_level_id, updated_at, cart_id) FROM stdin;
\.


--
-- Data for Name: spree_stock_transfer_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stock_transfer_items (id, stock_transfer_id, variant_id, quantity_shipped, quantity_received, created_at, updated_at, quantity_rejected) FROM stdin;
\.


--
-- Data for Name: spree_stock_transfers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stock_transfers (id, created_at, destination_location_id, number, metadata, reference, source_location_id, updated_at, store_id, status, shipped_at, received_at, notes, created_by_id, deleted_at, closed_short_at, close_reason) FROM stdin;
\.


--
-- Data for Name: spree_store_credit_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_store_credit_categories (id, created_at, name, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_store_credit_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_store_credit_events (id, action, amount, authorization_code, created_at, deleted_at, originator_id, originator_type, store_credit_id, updated_at, user_total_amount) FROM stdin;
\.


--
-- Data for Name: spree_store_credit_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_store_credit_types (id, created_at, name, priority, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_store_credits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_store_credits (id, amount, amount_authorized, amount_used, category_id, created_at, created_by_id, currency, deleted_at, memo, originator_id, originator_type, metadata, store_id, type_id, updated_at, customer_id, refunded_order_id) FROM stdin;
\.


--
-- Data for Name: spree_store_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_store_translations (id, address, contact_phone, created_at, customer_support_email, deleted_at, description, facebook, instagram, locale, meta_description, meta_keywords, name, new_order_notifications_email, seo_title, spree_store_id, twitter, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stores (id, address, checkout_zone_id, code, contact_phone, created_at, customer_support_email, "default", default_country_id, default_currency, default_locale, deleted_at, description, facebook, instagram, mail_from_address, meta_description, meta_keywords, name, new_order_notifications_email, preferences, metadata, seo_robots, seo_title, settings, storefront_custom_code_body_end, storefront_custom_code_body_start, storefront_custom_code_head, supported_currencies, supported_locales, twitter, updated_at, url, default_country_code, setup_token) FROM stdin;
1	\N	\N	shop	\N	2026-09-30 12:07:18.550006	support@example.com	t	\N	USD	en	\N	\N	\N	\N	no-reply@example.com	\N	\N	Shop	\N	---\n:storefront_access: public\n:guest_checkout: true\n:order_routing_strategy: Spree::OrderRouting::Strategy::Rules\n:admin_locale: en\n:timezone: UTC\n:weight_unit: lb\n:unit_system: imperial\n:send_seller_transactional_emails: true\n:send_consumer_transactional_emails: true\n:auto_approve_seller_products: false\n:default_commission_tax_rate: 0\n:auto_approve_sellers: false\n:default_payouts_schedule_interval: monthly\n:default_minimum_payout_amount: 0\n:payout_provider:\n:special_instructions_enabled: false\n:stock_reservations_enabled: true\n:always_include_confirm_step: false\n:stock_reservation_ttl_minutes: 10\n:tax_using_ship_address: true\n:inventory_provider: internal\n:pricing_provider: internal\n:pricing_provider_failure_policy: strict\n:inventory_provider_failure_policy: fallback\n:track_inventory_levels: true\n:low_stock_threshold: 5\n:abandoned_cart_after_hours: 24\n:disable_sku_validation: false\n:show_products_without_price: false\n:track_price_history: true\n:price_history_retention_days: 30\n:address_requires_company: false\n:company_field_enabled: false\n:address_requires_phone: false\n:limit_digital_download_count: true\n:limit_digital_download_days: true\n:digital_asset_authorized_clicks: 5\n:capture_method: checkout\n:storefront_url:\n:digital_asset_authorized_days: 7\n:digital_asset_link_expire_time: 300\n:order_number_prefix: R\n:document_number_format: sequential\n:order_number_suffix: ''\n:order_number_sequence_start: 1001\n	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2026-09-30 12:07:20.736036	localhost:3000	US	ghwDjspNjxAxhXtrZpo3Sa9k
\.


--
-- Data for Name: spree_stripe_payment_intents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stripe_payment_intents (id, amount, client_secret, created_at, customer_id, ephemeral_key_secret, order_id, payment_method_id, stripe_id, stripe_payment_method_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_stripe_payment_methods_webhook_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stripe_payment_methods_webhook_keys (id, created_at, payment_method_id, updated_at, webhook_key_id) FROM stdin;
\.


--
-- Data for Name: spree_stripe_webhook_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_stripe_webhook_keys (id, created_at, signing_secret, stripe_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_suppliers (id, name, contact_name, email, phone, notes, store_id, purchase_orders_count, address1, address2, city, state_name, state_code, country_code, postal_code, metadata, deleted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_taggings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_taggings (id, context, created_at, tag_id, taggable_id, taggable_type, tagger_id, tagger_type, tenant) FROM stdin;
\.


--
-- Data for Name: spree_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_tags (id, created_at, name, taggings_count, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_tax_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_tax_categories (id, created_at, deleted_at, description, is_default, name, tax_code, updated_at, store_id) FROM stdin;
1	2026-09-30 12:07:19.545913	\N	\N	t	Default	\N	2026-09-30 12:07:19.556065	1
2	2026-09-30 12:07:19.563983	\N	\N	f	Non-taxable	\N	2026-09-30 12:07:19.563983	1
\.


--
-- Data for Name: spree_tax_exemption_certificates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_tax_exemption_certificates (id, company_id, country_code, state_code, certificate_number, reason_code, status, issued_at, expires_at, issuing_authority, verified_at, verified_by_id, metadata, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_tax_identifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_tax_identifiers (id, owner_type, owner_id, kind, value, validation_status, validated_at, validation_evidence, source, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_tax_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_tax_lines (id, cart_id, order_id, tax_rate_id, line_item_id, fulfillment_id, fee_id, amount, rate, label, included, provider_id, data, metadata, created_at, updated_at, taxability_reason, country_code, state_code) FROM stdin;
\.


--
-- Data for Name: spree_tax_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_tax_rates (id, amount, created_at, deleted_at, included_in_price, name, metadata, show_rate_in_label, tax_category_id, updated_at, zone_id, store_id, country_code, state_code) FROM stdin;
\.


--
-- Data for Name: spree_taxon_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_taxon_rules (id, created_at, match_policy, taxon_id, type, updated_at, value) FROM stdin;
\.


--
-- Data for Name: spree_taxonomies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_taxonomies (id, created_at, name, "position", metadata, store_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_taxonomy_translations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_taxonomy_translations (id, created_at, locale, name, spree_taxonomy_id, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_trackers (id, active, analytics_id, created_at, engine, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_user_identities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_user_identities (id, access_token, created_at, expires_at, info, provider, refresh_token, uid, updated_at, user_id, user_type) FROM stdin;
\.


--
-- Data for Name: spree_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_users (id, authentication_token, bill_address_id, created_at, current_sign_in_at, current_sign_in_ip, email, encrypted_password, failed_attempts, last_request_at, last_sign_in_at, last_sign_in_ip, locked_at, login, password_salt, perishable_token, persistence_token, metadata, remember_created_at, remember_token, reset_password_sent_at, reset_password_token, ship_address_id, sign_in_count, unlock_token, updated_at) FROM stdin;
\.


--
-- Data for Name: spree_variant_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_variant_media (id, created_at, media_id, updated_at, variant_id) FROM stdin;
\.


--
-- Data for Name: spree_variants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_variants (id, backorder_limit, barcode, cost_currency, cost_price, created_at, deleted_at, depth, dimensions_unit, discontinue_on, height, is_master, media_count, "position", preorder_ships_at, preorderable, primary_media_id, metadata, product_id, sku, tax_category_id, track_inventory, updated_at, weight, weight_unit, width, hs_code, country_of_origin, customs_description, seller_id, delivery_profile_id, minimum_order_quantity, order_multiple, purchase_unit, units_per_carton, carton_package_type_id, carton_weight, cartons_per_pallet) FROM stdin;
\.


--
-- Data for Name: spree_webhook_deliveries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_webhook_deliveries (id, created_at, delivered_at, error_type, event_id, event_name, execution_time, payload, request_errors, response_body, response_code, success, updated_at, webhook_endpoint_id) FROM stdin;
\.


--
-- Data for Name: spree_webhook_endpoints; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_webhook_endpoints (id, active, created_at, deleted_at, disabled_at, disabled_reason, name, secret_key, store_id, subscriptions, updated_at, url) FROM stdin;
\.


--
-- Data for Name: spree_wishlist_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_wishlist_items (id, created_at, quantity, updated_at, variant_id, wishlist_id) FROM stdin;
\.


--
-- Data for Name: spree_wishlists; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_wishlists (id, created_at, is_default, is_private, name, store_id, token, updated_at, customer_id) FROM stdin;
\.


--
-- Data for Name: spree_zone_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_zone_members (id, created_at, updated_at, zone_id, zoneable_id, zoneable_type) FROM stdin;
\.


--
-- Data for Name: spree_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spree_zones (id, created_at, default_tax, description, kind, name, updated_at, zone_members_count) FROM stdin;
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 4, true);


--
-- Name: solid_cable_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_cable_messages_id_seq', 1, false);


--
-- Name: solid_cache_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_cache_entries_id_seq', 5, true);


--
-- Name: solid_queue_blocked_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_blocked_executions_id_seq', 1, false);


--
-- Name: solid_queue_claimed_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_claimed_executions_id_seq', 2, true);


--
-- Name: solid_queue_failed_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_failed_executions_id_seq', 1, false);


--
-- Name: solid_queue_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_jobs_id_seq', 2, true);


--
-- Name: solid_queue_pauses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_pauses_id_seq', 1, false);


--
-- Name: solid_queue_processes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_processes_id_seq', 4, true);


--
-- Name: solid_queue_ready_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_ready_executions_id_seq', 2, true);


--
-- Name: solid_queue_recurring_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_recurring_executions_id_seq', 1, true);


--
-- Name: solid_queue_recurring_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_recurring_tasks_id_seq', 9, true);


--
-- Name: solid_queue_scheduled_executions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_scheduled_executions_id_seq', 1, false);


--
-- Name: solid_queue_semaphores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solid_queue_semaphores_id_seq', 1, false);


--
-- Name: spree_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_addresses_id_seq', 1, false);


--
-- Name: spree_adjustments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_adjustments_id_seq', 1, false);


--
-- Name: spree_admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_admin_users_id_seq', 1, true);


--
-- Name: spree_allowed_origins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_allowed_origins_id_seq', 1, true);


--
-- Name: spree_api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_api_keys_id_seq', 2, true);


--
-- Name: spree_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_brands_id_seq', 1, false);


--
-- Name: spree_calculators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_calculators_id_seq', 4, true);


--
-- Name: spree_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_carts_id_seq', 1, false);


--
-- Name: spree_catalog_assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_catalog_assignments_id_seq', 1, false);


--
-- Name: spree_catalog_order_minimums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_catalog_order_minimums_id_seq', 1, false);


--
-- Name: spree_catalog_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_catalog_products_id_seq', 1, false);


--
-- Name: spree_catalog_quantity_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_catalog_quantity_rules_id_seq', 1, false);


--
-- Name: spree_catalogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_catalogs_id_seq', 1, false);


--
-- Name: spree_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_categories_id_seq', 1, false);


--
-- Name: spree_category_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_category_translations_id_seq', 1, false);


--
-- Name: spree_channel_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_channel_stock_locations_id_seq', 1, false);


--
-- Name: spree_channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_channels_id_seq', 2, true);


--
-- Name: spree_claim_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_claim_line_items_id_seq', 1, false);


--
-- Name: spree_claim_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_claim_reasons_id_seq', 5, true);


--
-- Name: spree_claims_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_claims_id_seq', 1, false);


--
-- Name: spree_collection_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_collection_rules_id_seq', 1, false);


--
-- Name: spree_collection_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_collection_translations_id_seq', 1, false);


--
-- Name: spree_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_collections_id_seq', 1, false);


--
-- Name: spree_commission_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_commission_lines_id_seq', 1, false);


--
-- Name: spree_commission_rate_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_commission_rate_values_id_seq', 1, false);


--
-- Name: spree_commission_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_commission_rates_id_seq', 1, true);


--
-- Name: spree_commission_rule_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_commission_rule_products_id_seq', 1, false);


--
-- Name: spree_commission_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_commission_rules_id_seq', 1, false);


--
-- Name: spree_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_companies_id_seq', 1, false);


--
-- Name: spree_company_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_company_invitations_id_seq', 1, false);


--
-- Name: spree_company_memberships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_company_memberships_id_seq', 1, false);


--
-- Name: spree_consent_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_consent_records_id_seq', 1, false);


--
-- Name: spree_consolidated_metadata_tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_consolidated_metadata_tables_id_seq', 1, false);


--
-- Name: spree_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_countries_id_seq', 1, false);


--
-- Name: spree_coupon_codes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_coupon_codes_id_seq', 1, false);


--
-- Name: spree_credit_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_credit_cards_id_seq', 1, false);


--
-- Name: spree_custom_domains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_custom_domains_id_seq', 1, false);


--
-- Name: spree_custom_field_definitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_custom_field_definitions_id_seq', 1, false);


--
-- Name: spree_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_custom_fields_id_seq', 1, false);


--
-- Name: spree_customer_group_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_customer_group_users_id_seq', 1, false);


--
-- Name: spree_customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_customer_groups_id_seq', 1, true);


--
-- Name: spree_customer_returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_customer_returns_id_seq', 1, false);


--
-- Name: spree_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_customers_id_seq', 1, false);


--
-- Name: spree_data_feeds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_data_feeds_id_seq', 1, false);


--
-- Name: spree_data_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_data_requests_id_seq', 1, false);


--
-- Name: spree_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_deliveries_id_seq', 1, false);


--
-- Name: spree_delivery_method_rule_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_method_rule_products_id_seq', 1, false);


--
-- Name: spree_delivery_method_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_method_rules_id_seq', 1, false);


--
-- Name: spree_delivery_method_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_method_services_id_seq', 1, false);


--
-- Name: spree_delivery_method_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_method_stock_locations_id_seq', 1, false);


--
-- Name: spree_delivery_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_methods_id_seq', 4, true);


--
-- Name: spree_delivery_origin_group_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_origin_group_locations_id_seq', 1, false);


--
-- Name: spree_delivery_origin_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_origin_groups_id_seq', 2, true);


--
-- Name: spree_delivery_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_profiles_id_seq', 2, true);


--
-- Name: spree_delivery_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_rates_id_seq', 1, false);


--
-- Name: spree_delivery_zone_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_zone_members_id_seq', 240, true);


--
-- Name: spree_delivery_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_delivery_zones_id_seq', 2, true);


--
-- Name: spree_digital_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_digital_assets_id_seq', 1, false);


--
-- Name: spree_digital_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_digital_links_id_seq', 1, false);


--
-- Name: spree_discounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_discounts_id_seq', 1, false);


--
-- Name: spree_exchange_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_exchange_line_items_id_seq', 1, false);


--
-- Name: spree_exchanges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_exchanges_id_seq', 1, false);


--
-- Name: spree_exports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_exports_id_seq', 1, false);


--
-- Name: spree_external_references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_external_references_id_seq', 1, false);


--
-- Name: spree_fees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_fees_id_seq', 1, false);


--
-- Name: spree_fulfillment_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_fulfillment_items_id_seq', 1, false);


--
-- Name: spree_fulfillments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_fulfillments_id_seq', 1, false);


--
-- Name: spree_gateway_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_gateway_customers_id_seq', 1, false);


--
-- Name: spree_gateways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_gateways_id_seq', 1, false);


--
-- Name: spree_gift_card_batches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_gift_card_batches_id_seq', 1, false);


--
-- Name: spree_gift_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_gift_cards_id_seq', 1, false);


--
-- Name: spree_import_mappings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_import_mappings_id_seq', 1, false);


--
-- Name: spree_import_rows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_import_rows_id_seq', 1, false);


--
-- Name: spree_imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_imports_id_seq', 1, false);


--
-- Name: spree_integrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_integrations_id_seq', 1, false);


--
-- Name: spree_invitations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_invitations_id_seq', 1, false);


--
-- Name: spree_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_line_items_id_seq', 1, false);


--
-- Name: spree_log_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_log_entries_id_seq', 1, false);


--
-- Name: spree_market_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_market_countries_id_seq', 1, true);


--
-- Name: spree_markets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_markets_id_seq', 1, true);


--
-- Name: spree_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_media_id_seq', 1, false);


--
-- Name: spree_newsletter_subscribers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_newsletter_subscribers_id_seq', 1, false);


--
-- Name: spree_number_sequences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_number_sequences_id_seq', 1, false);


--
-- Name: spree_option_type_product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_option_type_product_types_id_seq', 1, false);


--
-- Name: spree_option_type_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_option_type_translations_id_seq', 1, false);


--
-- Name: spree_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_option_types_id_seq', 1, false);


--
-- Name: spree_option_value_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_option_value_translations_id_seq', 1, false);


--
-- Name: spree_option_value_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_option_value_variants_id_seq', 1, false);


--
-- Name: spree_option_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_option_values_id_seq', 1, false);


--
-- Name: spree_order_cancellation_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_order_cancellation_reasons_id_seq', 7, true);


--
-- Name: spree_order_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_order_groups_id_seq', 1, false);


--
-- Name: spree_order_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_order_promotions_id_seq', 1, false);


--
-- Name: spree_order_routing_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_order_routing_rules_id_seq', 6, true);


--
-- Name: spree_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_orders_id_seq', 1, false);


--
-- Name: spree_package_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_package_types_id_seq', 1, true);


--
-- Name: spree_payment_capture_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_payment_capture_events_id_seq', 1, false);


--
-- Name: spree_payment_methods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_payment_methods_id_seq', 1, true);


--
-- Name: spree_payment_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_payment_sessions_id_seq', 1, false);


--
-- Name: spree_payment_setup_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_payment_setup_sessions_id_seq', 1, false);


--
-- Name: spree_payment_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_payment_sources_id_seq', 1, false);


--
-- Name: spree_payment_splits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_payment_splits_id_seq', 1, false);


--
-- Name: spree_payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_payments_id_seq', 1, false);


--
-- Name: spree_paypal_checkout_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_paypal_checkout_orders_id_seq', 1, false);


--
-- Name: spree_policies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_policies_id_seq', 4, true);


--
-- Name: spree_policy_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_policy_translations_id_seq', 1, false);


--
-- Name: spree_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_preferences_id_seq', 1, false);


--
-- Name: spree_price_adjustment_tiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_price_adjustment_tiers_id_seq', 1, false);


--
-- Name: spree_price_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_price_histories_id_seq', 1, false);


--
-- Name: spree_price_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_price_lists_id_seq', 1, false);


--
-- Name: spree_price_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_price_rules_id_seq', 1, false);


--
-- Name: spree_prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_prices_id_seq', 1, false);


--
-- Name: spree_product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_categories_id_seq', 1, false);


--
-- Name: spree_product_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_collections_id_seq', 1, false);


--
-- Name: spree_product_option_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_option_types_id_seq', 1, false);


--
-- Name: spree_product_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_promotion_rules_id_seq', 1, false);


--
-- Name: spree_product_publications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_publications_id_seq', 1, false);


--
-- Name: spree_product_submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_submissions_id_seq', 1, false);


--
-- Name: spree_product_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_translations_id_seq', 1, false);


--
-- Name: spree_product_type_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_type_categories_id_seq', 1, false);


--
-- Name: spree_product_type_custom_field_definitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_type_custom_field_definitions_id_seq', 1, false);


--
-- Name: spree_product_type_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_type_translations_id_seq', 1, false);


--
-- Name: spree_product_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_product_types_id_seq', 2, true);


--
-- Name: spree_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_products_id_seq', 1, false);


--
-- Name: spree_products_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_products_stores_id_seq', 1, false);


--
-- Name: spree_promotion_action_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_promotion_action_line_items_id_seq', 1, false);


--
-- Name: spree_promotion_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_promotion_actions_id_seq', 1, false);


--
-- Name: spree_promotion_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_promotion_categories_id_seq', 1, false);


--
-- Name: spree_promotion_rule_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_promotion_rule_categories_id_seq', 1, false);


--
-- Name: spree_promotion_rule_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_promotion_rule_users_id_seq', 1, false);


--
-- Name: spree_promotion_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_promotion_rules_id_seq', 1, false);


--
-- Name: spree_promotions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_promotions_id_seq', 1, false);


--
-- Name: spree_promotions_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_promotions_stores_id_seq', 1, false);


--
-- Name: spree_purchase_order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_purchase_order_items_id_seq', 1, false);


--
-- Name: spree_purchase_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_purchase_orders_id_seq', 1, false);


--
-- Name: spree_refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_refresh_tokens_id_seq', 2, true);


--
-- Name: spree_refund_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_refund_reasons_id_seq', 1, true);


--
-- Name: spree_refunds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_refunds_id_seq', 1, false);


--
-- Name: spree_reimbursement_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_reimbursement_credits_id_seq', 1, false);


--
-- Name: spree_reimbursement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_reimbursement_types_id_seq', 1, false);


--
-- Name: spree_reimbursements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_reimbursements_id_seq', 1, false);


--
-- Name: spree_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_reports_id_seq', 1, false);


--
-- Name: spree_return_authorizations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_return_authorizations_id_seq', 1, false);


--
-- Name: spree_return_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_return_items_id_seq', 1, false);


--
-- Name: spree_return_line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_return_line_items_id_seq', 1, false);


--
-- Name: spree_return_reasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_return_reasons_id_seq', 9, true);


--
-- Name: spree_returns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_returns_id_seq', 1, false);


--
-- Name: spree_role_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_role_users_id_seq', 1, true);


--
-- Name: spree_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_roles_id_seq', 1, true);


--
-- Name: spree_saved_reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_saved_reports_id_seq', 20, true);


--
-- Name: spree_seller_payouts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_seller_payouts_id_seq', 1, false);


--
-- Name: spree_seller_requirement_custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_seller_requirement_custom_fields_id_seq', 1, false);


--
-- Name: spree_seller_requirement_submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_seller_requirement_submissions_id_seq', 1, false);


--
-- Name: spree_seller_requirements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_seller_requirements_id_seq', 7, true);


--
-- Name: spree_seller_transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_seller_transfers_id_seq', 1, false);


--
-- Name: spree_seller_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_seller_translations_id_seq', 1, false);


--
-- Name: spree_sellers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_sellers_id_seq', 1, false);


--
-- Name: spree_shipping_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_shipping_labels_id_seq', 1, false);


--
-- Name: spree_shipping_method_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_shipping_method_categories_id_seq', 1, false);


--
-- Name: spree_state_changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_state_changes_id_seq', 1, false);


--
-- Name: spree_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_states_id_seq', 1, false);


--
-- Name: spree_stock_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stock_levels_id_seq', 1, false);


--
-- Name: spree_stock_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stock_locations_id_seq', 1, true);


--
-- Name: spree_stock_movements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stock_movements_id_seq', 1, false);


--
-- Name: spree_stock_receipt_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stock_receipt_items_id_seq', 1, false);


--
-- Name: spree_stock_receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stock_receipts_id_seq', 1, false);


--
-- Name: spree_stock_reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stock_reservations_id_seq', 1, false);


--
-- Name: spree_stock_transfer_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stock_transfer_items_id_seq', 1, false);


--
-- Name: spree_stock_transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stock_transfers_id_seq', 1, false);


--
-- Name: spree_store_credit_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_store_credit_categories_id_seq', 1, false);


--
-- Name: spree_store_credit_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_store_credit_events_id_seq', 1, false);


--
-- Name: spree_store_credit_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_store_credit_types_id_seq', 1, false);


--
-- Name: spree_store_credits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_store_credits_id_seq', 1, false);


--
-- Name: spree_store_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_store_translations_id_seq', 1, false);


--
-- Name: spree_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stores_id_seq', 1, true);


--
-- Name: spree_stripe_payment_intents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stripe_payment_intents_id_seq', 1, false);


--
-- Name: spree_stripe_payment_methods_webhook_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stripe_payment_methods_webhook_keys_id_seq', 1, false);


--
-- Name: spree_stripe_webhook_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_stripe_webhook_keys_id_seq', 1, false);


--
-- Name: spree_suppliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_suppliers_id_seq', 1, false);


--
-- Name: spree_taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_taggings_id_seq', 1, false);


--
-- Name: spree_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_tags_id_seq', 1, false);


--
-- Name: spree_tax_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_tax_categories_id_seq', 2, true);


--
-- Name: spree_tax_exemption_certificates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_tax_exemption_certificates_id_seq', 1, false);


--
-- Name: spree_tax_identifiers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_tax_identifiers_id_seq', 1, false);


--
-- Name: spree_tax_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_tax_lines_id_seq', 1, false);


--
-- Name: spree_tax_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_tax_rates_id_seq', 1, false);


--
-- Name: spree_taxon_rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_taxon_rules_id_seq', 1, false);


--
-- Name: spree_taxonomies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_taxonomies_id_seq', 1, false);


--
-- Name: spree_taxonomy_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_taxonomy_translations_id_seq', 1, false);


--
-- Name: spree_trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_trackers_id_seq', 1, false);


--
-- Name: spree_user_identities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_user_identities_id_seq', 1, false);


--
-- Name: spree_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_users_id_seq', 1, false);


--
-- Name: spree_variant_media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_variant_media_id_seq', 1, false);


--
-- Name: spree_variants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_variants_id_seq', 1, false);


--
-- Name: spree_webhook_deliveries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_webhook_deliveries_id_seq', 1, false);


--
-- Name: spree_webhook_endpoints_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_webhook_endpoints_id_seq', 1, false);


--
-- Name: spree_wishlist_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_wishlist_items_id_seq', 1, false);


--
-- Name: spree_wishlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_wishlists_id_seq', 1, false);


--
-- Name: spree_zone_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_zone_members_id_seq', 1, false);


--
-- Name: spree_zones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spree_zones_id_seq', 1, false);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: solid_cable_messages solid_cable_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_cable_messages
    ADD CONSTRAINT solid_cable_messages_pkey PRIMARY KEY (id);


--
-- Name: solid_cache_entries solid_cache_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_cache_entries
    ADD CONSTRAINT solid_cache_entries_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_blocked_executions solid_queue_blocked_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_blocked_executions
    ADD CONSTRAINT solid_queue_blocked_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_claimed_executions solid_queue_claimed_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_claimed_executions
    ADD CONSTRAINT solid_queue_claimed_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_failed_executions solid_queue_failed_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_failed_executions
    ADD CONSTRAINT solid_queue_failed_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_jobs solid_queue_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_jobs
    ADD CONSTRAINT solid_queue_jobs_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_pauses solid_queue_pauses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_pauses
    ADD CONSTRAINT solid_queue_pauses_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_processes solid_queue_processes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_processes
    ADD CONSTRAINT solid_queue_processes_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_ready_executions solid_queue_ready_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_ready_executions
    ADD CONSTRAINT solid_queue_ready_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_recurring_executions solid_queue_recurring_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_recurring_executions
    ADD CONSTRAINT solid_queue_recurring_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_recurring_tasks solid_queue_recurring_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_recurring_tasks
    ADD CONSTRAINT solid_queue_recurring_tasks_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_scheduled_executions solid_queue_scheduled_executions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions
    ADD CONSTRAINT solid_queue_scheduled_executions_pkey PRIMARY KEY (id);


--
-- Name: solid_queue_semaphores solid_queue_semaphores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_semaphores
    ADD CONSTRAINT solid_queue_semaphores_pkey PRIMARY KEY (id);


--
-- Name: spree_addresses spree_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_addresses
    ADD CONSTRAINT spree_addresses_pkey PRIMARY KEY (id);


--
-- Name: spree_adjustments spree_adjustments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_adjustments
    ADD CONSTRAINT spree_adjustments_pkey PRIMARY KEY (id);


--
-- Name: spree_admin_users spree_admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_admin_users
    ADD CONSTRAINT spree_admin_users_pkey PRIMARY KEY (id);


--
-- Name: spree_allowed_origins spree_allowed_origins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_allowed_origins
    ADD CONSTRAINT spree_allowed_origins_pkey PRIMARY KEY (id);


--
-- Name: spree_api_keys spree_api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_api_keys
    ADD CONSTRAINT spree_api_keys_pkey PRIMARY KEY (id);


--
-- Name: spree_brands spree_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_brands
    ADD CONSTRAINT spree_brands_pkey PRIMARY KEY (id);


--
-- Name: spree_calculators spree_calculators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_calculators
    ADD CONSTRAINT spree_calculators_pkey PRIMARY KEY (id);


--
-- Name: spree_carts spree_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_carts
    ADD CONSTRAINT spree_carts_pkey PRIMARY KEY (id);


--
-- Name: spree_catalog_assignments spree_catalog_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalog_assignments
    ADD CONSTRAINT spree_catalog_assignments_pkey PRIMARY KEY (id);


--
-- Name: spree_catalog_order_minimums spree_catalog_order_minimums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalog_order_minimums
    ADD CONSTRAINT spree_catalog_order_minimums_pkey PRIMARY KEY (id);


--
-- Name: spree_catalog_products spree_catalog_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalog_products
    ADD CONSTRAINT spree_catalog_products_pkey PRIMARY KEY (id);


--
-- Name: spree_catalog_quantity_rules spree_catalog_quantity_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalog_quantity_rules
    ADD CONSTRAINT spree_catalog_quantity_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_catalogs spree_catalogs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_catalogs
    ADD CONSTRAINT spree_catalogs_pkey PRIMARY KEY (id);


--
-- Name: spree_categories spree_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_categories
    ADD CONSTRAINT spree_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_category_translations spree_category_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_category_translations
    ADD CONSTRAINT spree_category_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_channel_stock_locations spree_channel_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_channel_stock_locations
    ADD CONSTRAINT spree_channel_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_channels spree_channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_channels
    ADD CONSTRAINT spree_channels_pkey PRIMARY KEY (id);


--
-- Name: spree_claim_line_items spree_claim_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_claim_line_items
    ADD CONSTRAINT spree_claim_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_claim_reasons spree_claim_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_claim_reasons
    ADD CONSTRAINT spree_claim_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_claims spree_claims_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_claims
    ADD CONSTRAINT spree_claims_pkey PRIMARY KEY (id);


--
-- Name: spree_collection_rules spree_collection_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_collection_rules
    ADD CONSTRAINT spree_collection_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_collection_translations spree_collection_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_collection_translations
    ADD CONSTRAINT spree_collection_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_collections spree_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_collections
    ADD CONSTRAINT spree_collections_pkey PRIMARY KEY (id);


--
-- Name: spree_commission_lines spree_commission_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_lines
    ADD CONSTRAINT spree_commission_lines_pkey PRIMARY KEY (id);


--
-- Name: spree_commission_rate_values spree_commission_rate_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_rate_values
    ADD CONSTRAINT spree_commission_rate_values_pkey PRIMARY KEY (id);


--
-- Name: spree_commission_rates spree_commission_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_rates
    ADD CONSTRAINT spree_commission_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_commission_rule_products spree_commission_rule_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_rule_products
    ADD CONSTRAINT spree_commission_rule_products_pkey PRIMARY KEY (id);


--
-- Name: spree_commission_rules spree_commission_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_commission_rules
    ADD CONSTRAINT spree_commission_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_companies spree_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_companies
    ADD CONSTRAINT spree_companies_pkey PRIMARY KEY (id);


--
-- Name: spree_company_invitations spree_company_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_company_invitations
    ADD CONSTRAINT spree_company_invitations_pkey PRIMARY KEY (id);


--
-- Name: spree_company_memberships spree_company_memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_company_memberships
    ADD CONSTRAINT spree_company_memberships_pkey PRIMARY KEY (id);


--
-- Name: spree_consent_records spree_consent_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_consent_records
    ADD CONSTRAINT spree_consent_records_pkey PRIMARY KEY (id);


--
-- Name: spree_consolidated_metadata_tables spree_consolidated_metadata_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_consolidated_metadata_tables
    ADD CONSTRAINT spree_consolidated_metadata_tables_pkey PRIMARY KEY (id);


--
-- Name: spree_countries spree_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_countries
    ADD CONSTRAINT spree_countries_pkey PRIMARY KEY (id);


--
-- Name: spree_coupon_codes spree_coupon_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_coupon_codes
    ADD CONSTRAINT spree_coupon_codes_pkey PRIMARY KEY (id);


--
-- Name: spree_credit_cards spree_credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_credit_cards
    ADD CONSTRAINT spree_credit_cards_pkey PRIMARY KEY (id);


--
-- Name: spree_custom_domains spree_custom_domains_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_custom_domains
    ADD CONSTRAINT spree_custom_domains_pkey PRIMARY KEY (id);


--
-- Name: spree_custom_field_definitions spree_custom_field_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_custom_field_definitions
    ADD CONSTRAINT spree_custom_field_definitions_pkey PRIMARY KEY (id);


--
-- Name: spree_custom_fields spree_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_custom_fields
    ADD CONSTRAINT spree_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_group_users spree_customer_group_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_customer_group_users
    ADD CONSTRAINT spree_customer_group_users_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_groups spree_customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_customer_groups
    ADD CONSTRAINT spree_customer_groups_pkey PRIMARY KEY (id);


--
-- Name: spree_customer_returns spree_customer_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_customer_returns
    ADD CONSTRAINT spree_customer_returns_pkey PRIMARY KEY (id);


--
-- Name: spree_customers spree_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_customers
    ADD CONSTRAINT spree_customers_pkey PRIMARY KEY (id);


--
-- Name: spree_data_feeds spree_data_feeds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_data_feeds
    ADD CONSTRAINT spree_data_feeds_pkey PRIMARY KEY (id);


--
-- Name: spree_data_requests spree_data_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_data_requests
    ADD CONSTRAINT spree_data_requests_pkey PRIMARY KEY (id);


--
-- Name: spree_deliveries spree_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_deliveries
    ADD CONSTRAINT spree_deliveries_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_method_rule_products spree_delivery_method_rule_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_method_rule_products
    ADD CONSTRAINT spree_delivery_method_rule_products_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_method_rules spree_delivery_method_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_method_rules
    ADD CONSTRAINT spree_delivery_method_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_method_services spree_delivery_method_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_method_services
    ADD CONSTRAINT spree_delivery_method_services_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_method_stock_locations spree_delivery_method_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_method_stock_locations
    ADD CONSTRAINT spree_delivery_method_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_methods spree_delivery_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_methods
    ADD CONSTRAINT spree_delivery_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_origin_group_locations spree_delivery_origin_group_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_origin_group_locations
    ADD CONSTRAINT spree_delivery_origin_group_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_origin_groups spree_delivery_origin_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_origin_groups
    ADD CONSTRAINT spree_delivery_origin_groups_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_profiles spree_delivery_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_profiles
    ADD CONSTRAINT spree_delivery_profiles_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_rates spree_delivery_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_rates
    ADD CONSTRAINT spree_delivery_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_zone_members spree_delivery_zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_zone_members
    ADD CONSTRAINT spree_delivery_zone_members_pkey PRIMARY KEY (id);


--
-- Name: spree_delivery_zones spree_delivery_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_delivery_zones
    ADD CONSTRAINT spree_delivery_zones_pkey PRIMARY KEY (id);


--
-- Name: spree_digital_assets spree_digital_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_digital_assets
    ADD CONSTRAINT spree_digital_assets_pkey PRIMARY KEY (id);


--
-- Name: spree_digital_links spree_digital_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_digital_links
    ADD CONSTRAINT spree_digital_links_pkey PRIMARY KEY (id);


--
-- Name: spree_discounts spree_discounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_discounts
    ADD CONSTRAINT spree_discounts_pkey PRIMARY KEY (id);


--
-- Name: spree_exchange_line_items spree_exchange_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_exchange_line_items
    ADD CONSTRAINT spree_exchange_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_exchanges spree_exchanges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_exchanges
    ADD CONSTRAINT spree_exchanges_pkey PRIMARY KEY (id);


--
-- Name: spree_exports spree_exports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_exports
    ADD CONSTRAINT spree_exports_pkey PRIMARY KEY (id);


--
-- Name: spree_external_references spree_external_references_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_external_references
    ADD CONSTRAINT spree_external_references_pkey PRIMARY KEY (id);


--
-- Name: spree_fees spree_fees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_fees
    ADD CONSTRAINT spree_fees_pkey PRIMARY KEY (id);


--
-- Name: spree_fulfillment_items spree_fulfillment_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_fulfillment_items
    ADD CONSTRAINT spree_fulfillment_items_pkey PRIMARY KEY (id);


--
-- Name: spree_fulfillments spree_fulfillments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_fulfillments
    ADD CONSTRAINT spree_fulfillments_pkey PRIMARY KEY (id);


--
-- Name: spree_gateway_customers spree_gateway_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_gateway_customers
    ADD CONSTRAINT spree_gateway_customers_pkey PRIMARY KEY (id);


--
-- Name: spree_gateways spree_gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_gateways
    ADD CONSTRAINT spree_gateways_pkey PRIMARY KEY (id);


--
-- Name: spree_gift_card_batches spree_gift_card_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_gift_card_batches
    ADD CONSTRAINT spree_gift_card_batches_pkey PRIMARY KEY (id);


--
-- Name: spree_gift_cards spree_gift_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_gift_cards
    ADD CONSTRAINT spree_gift_cards_pkey PRIMARY KEY (id);


--
-- Name: spree_import_mappings spree_import_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_import_mappings
    ADD CONSTRAINT spree_import_mappings_pkey PRIMARY KEY (id);


--
-- Name: spree_import_rows spree_import_rows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_import_rows
    ADD CONSTRAINT spree_import_rows_pkey PRIMARY KEY (id);


--
-- Name: spree_imports spree_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_imports
    ADD CONSTRAINT spree_imports_pkey PRIMARY KEY (id);


--
-- Name: spree_integrations spree_integrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_integrations
    ADD CONSTRAINT spree_integrations_pkey PRIMARY KEY (id);


--
-- Name: spree_invitations spree_invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_invitations
    ADD CONSTRAINT spree_invitations_pkey PRIMARY KEY (id);


--
-- Name: spree_line_items spree_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_line_items
    ADD CONSTRAINT spree_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_log_entries spree_log_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_log_entries
    ADD CONSTRAINT spree_log_entries_pkey PRIMARY KEY (id);


--
-- Name: spree_market_countries spree_market_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_market_countries
    ADD CONSTRAINT spree_market_countries_pkey PRIMARY KEY (id);


--
-- Name: spree_markets spree_markets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_markets
    ADD CONSTRAINT spree_markets_pkey PRIMARY KEY (id);


--
-- Name: spree_media spree_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_media
    ADD CONSTRAINT spree_media_pkey PRIMARY KEY (id);


--
-- Name: spree_newsletter_subscribers spree_newsletter_subscribers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_newsletter_subscribers
    ADD CONSTRAINT spree_newsletter_subscribers_pkey PRIMARY KEY (id);


--
-- Name: spree_number_sequences spree_number_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_number_sequences
    ADD CONSTRAINT spree_number_sequences_pkey PRIMARY KEY (id);


--
-- Name: spree_option_type_product_types spree_option_type_product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_type_product_types
    ADD CONSTRAINT spree_option_type_product_types_pkey PRIMARY KEY (id);


--
-- Name: spree_option_type_translations spree_option_type_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_type_translations
    ADD CONSTRAINT spree_option_type_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_option_types spree_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_types
    ADD CONSTRAINT spree_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_option_value_translations spree_option_value_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_value_translations
    ADD CONSTRAINT spree_option_value_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_option_value_variants spree_option_value_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_value_variants
    ADD CONSTRAINT spree_option_value_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_option_values spree_option_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_values
    ADD CONSTRAINT spree_option_values_pkey PRIMARY KEY (id);


--
-- Name: spree_order_cancellation_reasons spree_order_cancellation_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_order_cancellation_reasons
    ADD CONSTRAINT spree_order_cancellation_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_order_groups spree_order_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_order_groups
    ADD CONSTRAINT spree_order_groups_pkey PRIMARY KEY (id);


--
-- Name: spree_order_promotions spree_order_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_order_promotions
    ADD CONSTRAINT spree_order_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_order_routing_rules spree_order_routing_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_order_routing_rules
    ADD CONSTRAINT spree_order_routing_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_orders spree_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_orders
    ADD CONSTRAINT spree_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_package_types spree_package_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_package_types
    ADD CONSTRAINT spree_package_types_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_capture_events spree_payment_capture_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_capture_events
    ADD CONSTRAINT spree_payment_capture_events_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_methods spree_payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_methods
    ADD CONSTRAINT spree_payment_methods_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_sessions spree_payment_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_sessions
    ADD CONSTRAINT spree_payment_sessions_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_setup_sessions spree_payment_setup_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_setup_sessions
    ADD CONSTRAINT spree_payment_setup_sessions_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_sources spree_payment_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_sources
    ADD CONSTRAINT spree_payment_sources_pkey PRIMARY KEY (id);


--
-- Name: spree_payment_splits spree_payment_splits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_splits
    ADD CONSTRAINT spree_payment_splits_pkey PRIMARY KEY (id);


--
-- Name: spree_payments spree_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payments
    ADD CONSTRAINT spree_payments_pkey PRIMARY KEY (id);


--
-- Name: spree_paypal_checkout_orders spree_paypal_checkout_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_paypal_checkout_orders
    ADD CONSTRAINT spree_paypal_checkout_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_policies spree_policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_policies
    ADD CONSTRAINT spree_policies_pkey PRIMARY KEY (id);


--
-- Name: spree_policy_translations spree_policy_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_policy_translations
    ADD CONSTRAINT spree_policy_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_preferences spree_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_preferences
    ADD CONSTRAINT spree_preferences_pkey PRIMARY KEY (id);


--
-- Name: spree_price_adjustment_tiers spree_price_adjustment_tiers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_price_adjustment_tiers
    ADD CONSTRAINT spree_price_adjustment_tiers_pkey PRIMARY KEY (id);


--
-- Name: spree_price_histories spree_price_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_price_histories
    ADD CONSTRAINT spree_price_histories_pkey PRIMARY KEY (id);


--
-- Name: spree_price_lists spree_price_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_price_lists
    ADD CONSTRAINT spree_price_lists_pkey PRIMARY KEY (id);


--
-- Name: spree_price_rules spree_price_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_price_rules
    ADD CONSTRAINT spree_price_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_prices spree_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_prices
    ADD CONSTRAINT spree_prices_pkey PRIMARY KEY (id);


--
-- Name: spree_product_categories spree_product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_categories
    ADD CONSTRAINT spree_product_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_product_collections spree_product_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_collections
    ADD CONSTRAINT spree_product_collections_pkey PRIMARY KEY (id);


--
-- Name: spree_product_option_types spree_product_option_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_option_types
    ADD CONSTRAINT spree_product_option_types_pkey PRIMARY KEY (id);


--
-- Name: spree_product_promotion_rules spree_product_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_promotion_rules
    ADD CONSTRAINT spree_product_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_product_publications spree_product_publications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_publications
    ADD CONSTRAINT spree_product_publications_pkey PRIMARY KEY (id);


--
-- Name: spree_product_submissions spree_product_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_submissions
    ADD CONSTRAINT spree_product_submissions_pkey PRIMARY KEY (id);


--
-- Name: spree_product_translations spree_product_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_translations
    ADD CONSTRAINT spree_product_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_product_type_categories spree_product_type_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_type_categories
    ADD CONSTRAINT spree_product_type_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_product_type_custom_field_definitions spree_product_type_custom_field_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_type_custom_field_definitions
    ADD CONSTRAINT spree_product_type_custom_field_definitions_pkey PRIMARY KEY (id);


--
-- Name: spree_product_type_translations spree_product_type_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_type_translations
    ADD CONSTRAINT spree_product_type_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_product_types spree_product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_types
    ADD CONSTRAINT spree_product_types_pkey PRIMARY KEY (id);


--
-- Name: spree_products spree_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_products
    ADD CONSTRAINT spree_products_pkey PRIMARY KEY (id);


--
-- Name: spree_products_stores spree_products_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_products_stores
    ADD CONSTRAINT spree_products_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_action_line_items spree_promotion_action_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_action_line_items
    ADD CONSTRAINT spree_promotion_action_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_actions spree_promotion_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_actions
    ADD CONSTRAINT spree_promotion_actions_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_categories spree_promotion_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_categories
    ADD CONSTRAINT spree_promotion_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rule_categories spree_promotion_rule_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_rule_categories
    ADD CONSTRAINT spree_promotion_rule_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rule_users spree_promotion_rule_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_rule_users
    ADD CONSTRAINT spree_promotion_rule_users_pkey PRIMARY KEY (id);


--
-- Name: spree_promotion_rules spree_promotion_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotion_rules
    ADD CONSTRAINT spree_promotion_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_promotions spree_promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotions
    ADD CONSTRAINT spree_promotions_pkey PRIMARY KEY (id);


--
-- Name: spree_promotions_stores spree_promotions_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_promotions_stores
    ADD CONSTRAINT spree_promotions_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_purchase_order_items spree_purchase_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_purchase_order_items
    ADD CONSTRAINT spree_purchase_order_items_pkey PRIMARY KEY (id);


--
-- Name: spree_purchase_orders spree_purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_purchase_orders
    ADD CONSTRAINT spree_purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: spree_refresh_tokens spree_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_refresh_tokens
    ADD CONSTRAINT spree_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: spree_refund_reasons spree_refund_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_refund_reasons
    ADD CONSTRAINT spree_refund_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_refunds spree_refunds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_refunds
    ADD CONSTRAINT spree_refunds_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_credits spree_reimbursement_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_reimbursement_credits
    ADD CONSTRAINT spree_reimbursement_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursement_types spree_reimbursement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_reimbursement_types
    ADD CONSTRAINT spree_reimbursement_types_pkey PRIMARY KEY (id);


--
-- Name: spree_reimbursements spree_reimbursements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_reimbursements
    ADD CONSTRAINT spree_reimbursements_pkey PRIMARY KEY (id);


--
-- Name: spree_reports spree_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_reports
    ADD CONSTRAINT spree_reports_pkey PRIMARY KEY (id);


--
-- Name: spree_return_authorizations spree_return_authorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_return_authorizations
    ADD CONSTRAINT spree_return_authorizations_pkey PRIMARY KEY (id);


--
-- Name: spree_return_items spree_return_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_return_items
    ADD CONSTRAINT spree_return_items_pkey PRIMARY KEY (id);


--
-- Name: spree_return_line_items spree_return_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_return_line_items
    ADD CONSTRAINT spree_return_line_items_pkey PRIMARY KEY (id);


--
-- Name: spree_return_reasons spree_return_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_return_reasons
    ADD CONSTRAINT spree_return_reasons_pkey PRIMARY KEY (id);


--
-- Name: spree_returns spree_returns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_returns
    ADD CONSTRAINT spree_returns_pkey PRIMARY KEY (id);


--
-- Name: spree_role_users spree_role_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_role_users
    ADD CONSTRAINT spree_role_users_pkey PRIMARY KEY (id);


--
-- Name: spree_roles spree_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_roles
    ADD CONSTRAINT spree_roles_pkey PRIMARY KEY (id);


--
-- Name: spree_saved_reports spree_saved_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_saved_reports
    ADD CONSTRAINT spree_saved_reports_pkey PRIMARY KEY (id);


--
-- Name: spree_seller_payouts spree_seller_payouts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_payouts
    ADD CONSTRAINT spree_seller_payouts_pkey PRIMARY KEY (id);


--
-- Name: spree_seller_requirement_custom_fields spree_seller_requirement_custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_requirement_custom_fields
    ADD CONSTRAINT spree_seller_requirement_custom_fields_pkey PRIMARY KEY (id);


--
-- Name: spree_seller_requirement_submissions spree_seller_requirement_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_requirement_submissions
    ADD CONSTRAINT spree_seller_requirement_submissions_pkey PRIMARY KEY (id);


--
-- Name: spree_seller_requirements spree_seller_requirements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_requirements
    ADD CONSTRAINT spree_seller_requirements_pkey PRIMARY KEY (id);


--
-- Name: spree_seller_transfers spree_seller_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_transfers
    ADD CONSTRAINT spree_seller_transfers_pkey PRIMARY KEY (id);


--
-- Name: spree_seller_translations spree_seller_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_seller_translations
    ADD CONSTRAINT spree_seller_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_sellers spree_sellers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_sellers
    ADD CONSTRAINT spree_sellers_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_labels spree_shipping_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_shipping_labels
    ADD CONSTRAINT spree_shipping_labels_pkey PRIMARY KEY (id);


--
-- Name: spree_shipping_method_categories spree_shipping_method_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_shipping_method_categories
    ADD CONSTRAINT spree_shipping_method_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_state_changes spree_state_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_state_changes
    ADD CONSTRAINT spree_state_changes_pkey PRIMARY KEY (id);


--
-- Name: spree_states spree_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_states
    ADD CONSTRAINT spree_states_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_levels spree_stock_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_levels
    ADD CONSTRAINT spree_stock_levels_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_locations spree_stock_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_locations
    ADD CONSTRAINT spree_stock_locations_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_movements spree_stock_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_movements
    ADD CONSTRAINT spree_stock_movements_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_receipt_items spree_stock_receipt_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_receipt_items
    ADD CONSTRAINT spree_stock_receipt_items_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_receipts spree_stock_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_receipts
    ADD CONSTRAINT spree_stock_receipts_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_reservations spree_stock_reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_reservations
    ADD CONSTRAINT spree_stock_reservations_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_transfer_items spree_stock_transfer_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_transfer_items
    ADD CONSTRAINT spree_stock_transfer_items_pkey PRIMARY KEY (id);


--
-- Name: spree_stock_transfers spree_stock_transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stock_transfers
    ADD CONSTRAINT spree_stock_transfers_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_categories spree_store_credit_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_credit_categories
    ADD CONSTRAINT spree_store_credit_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_events spree_store_credit_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_credit_events
    ADD CONSTRAINT spree_store_credit_events_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credit_types spree_store_credit_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_credit_types
    ADD CONSTRAINT spree_store_credit_types_pkey PRIMARY KEY (id);


--
-- Name: spree_store_credits spree_store_credits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_credits
    ADD CONSTRAINT spree_store_credits_pkey PRIMARY KEY (id);


--
-- Name: spree_store_translations spree_store_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_translations
    ADD CONSTRAINT spree_store_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_stores spree_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stores
    ADD CONSTRAINT spree_stores_pkey PRIMARY KEY (id);


--
-- Name: spree_stripe_payment_intents spree_stripe_payment_intents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stripe_payment_intents
    ADD CONSTRAINT spree_stripe_payment_intents_pkey PRIMARY KEY (id);


--
-- Name: spree_stripe_payment_methods_webhook_keys spree_stripe_payment_methods_webhook_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stripe_payment_methods_webhook_keys
    ADD CONSTRAINT spree_stripe_payment_methods_webhook_keys_pkey PRIMARY KEY (id);


--
-- Name: spree_stripe_webhook_keys spree_stripe_webhook_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_stripe_webhook_keys
    ADD CONSTRAINT spree_stripe_webhook_keys_pkey PRIMARY KEY (id);


--
-- Name: spree_suppliers spree_suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_suppliers
    ADD CONSTRAINT spree_suppliers_pkey PRIMARY KEY (id);


--
-- Name: spree_taggings spree_taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taggings
    ADD CONSTRAINT spree_taggings_pkey PRIMARY KEY (id);


--
-- Name: spree_tags spree_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tags
    ADD CONSTRAINT spree_tags_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_categories spree_tax_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_categories
    ADD CONSTRAINT spree_tax_categories_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_exemption_certificates spree_tax_exemption_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_exemption_certificates
    ADD CONSTRAINT spree_tax_exemption_certificates_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_identifiers spree_tax_identifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_identifiers
    ADD CONSTRAINT spree_tax_identifiers_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_lines spree_tax_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_lines
    ADD CONSTRAINT spree_tax_lines_pkey PRIMARY KEY (id);


--
-- Name: spree_tax_rates spree_tax_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_tax_rates
    ADD CONSTRAINT spree_tax_rates_pkey PRIMARY KEY (id);


--
-- Name: spree_taxon_rules spree_taxon_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taxon_rules
    ADD CONSTRAINT spree_taxon_rules_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomies spree_taxonomies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taxonomies
    ADD CONSTRAINT spree_taxonomies_pkey PRIMARY KEY (id);


--
-- Name: spree_taxonomy_translations spree_taxonomy_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taxonomy_translations
    ADD CONSTRAINT spree_taxonomy_translations_pkey PRIMARY KEY (id);


--
-- Name: spree_trackers spree_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_trackers
    ADD CONSTRAINT spree_trackers_pkey PRIMARY KEY (id);


--
-- Name: spree_user_identities spree_user_identities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_user_identities
    ADD CONSTRAINT spree_user_identities_pkey PRIMARY KEY (id);


--
-- Name: spree_users spree_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_users
    ADD CONSTRAINT spree_users_pkey PRIMARY KEY (id);


--
-- Name: spree_variant_media spree_variant_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_variant_media
    ADD CONSTRAINT spree_variant_media_pkey PRIMARY KEY (id);


--
-- Name: spree_variants spree_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_variants
    ADD CONSTRAINT spree_variants_pkey PRIMARY KEY (id);


--
-- Name: spree_webhook_deliveries spree_webhook_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_webhook_deliveries
    ADD CONSTRAINT spree_webhook_deliveries_pkey PRIMARY KEY (id);


--
-- Name: spree_webhook_endpoints spree_webhook_endpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_webhook_endpoints
    ADD CONSTRAINT spree_webhook_endpoints_pkey PRIMARY KEY (id);


--
-- Name: spree_wishlist_items spree_wishlist_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_wishlist_items
    ADD CONSTRAINT spree_wishlist_items_pkey PRIMARY KEY (id);


--
-- Name: spree_wishlists spree_wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_wishlists
    ADD CONSTRAINT spree_wishlists_pkey PRIMARY KEY (id);


--
-- Name: spree_zone_members spree_zone_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_zone_members
    ADD CONSTRAINT spree_zone_members_pkey PRIMARY KEY (id);


--
-- Name: spree_zones spree_zones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_zones
    ADD CONSTRAINT spree_zones_pkey PRIMARY KEY (id);


--
-- Name: idx_catalog_assignments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_catalog_assignments_uniqueness ON public.spree_catalog_assignments USING btree (catalog_id, assignable_type, assignable_id);


--
-- Name: idx_catalog_order_minimums_on_catalog_and_currency; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_catalog_order_minimums_on_catalog_and_currency ON public.spree_catalog_order_minimums USING btree (catalog_id, currency);


--
-- Name: idx_catalog_products_on_catalog_and_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_catalog_products_on_catalog_and_product ON public.spree_catalog_products USING btree (catalog_id, product_id);


--
-- Name: idx_catalog_quantity_rules_on_catalog_and_variant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_catalog_quantity_rules_on_catalog_and_variant ON public.spree_catalog_quantity_rules USING btree (catalog_id, variant_id);


--
-- Name: idx_channel_stock_locations_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_channel_stock_locations_uniqueness ON public.spree_channel_stock_locations USING btree (channel_id, stock_location_id);


--
-- Name: idx_company_memberships_on_company_and_customer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_company_memberships_on_company_and_customer ON public.spree_company_memberships USING btree (company_id, customer_id);


--
-- Name: idx_delivery_method_rule_products_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_delivery_method_rule_products_uniqueness ON public.spree_delivery_method_rule_products USING btree (delivery_method_rule_id, product_id);


--
-- Name: idx_delivery_method_rules_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_delivery_method_rules_uniqueness ON public.spree_delivery_method_rules USING btree (delivery_method_id, type);


--
-- Name: idx_delivery_method_services_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_delivery_method_services_uniqueness ON public.spree_delivery_method_services USING btree (delivery_method_id, carrier, service);


--
-- Name: idx_delivery_method_stock_locations_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_delivery_method_stock_locations_uniqueness ON public.spree_delivery_method_stock_locations USING btree (delivery_method_id, stock_location_id);


--
-- Name: idx_delivery_origin_group_locations_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_delivery_origin_group_locations_uniqueness ON public.spree_delivery_origin_group_locations USING btree (delivery_origin_group_id, stock_location_id);


--
-- Name: idx_external_references_on_external_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_external_references_on_external_id ON public.spree_external_references USING btree (store_id, system, resource_type, external_id);


--
-- Name: idx_external_references_on_resource; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_external_references_on_resource ON public.spree_external_references USING btree (store_id, system, resource_type, resource_id);


--
-- Name: idx_external_references_on_resource_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_external_references_on_resource_lookup ON public.spree_external_references USING btree (resource_type, resource_id);


--
-- Name: idx_on_category_id_promotion_rule_id_530c96f872; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_on_category_id_promotion_rule_id_530c96f872 ON public.spree_promotion_rule_categories USING btree (category_id, promotion_rule_id);


--
-- Name: idx_on_company_id_status_9f9c6d73b6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_company_id_status_9f9c6d73b6 ON public.spree_tax_exemption_certificates USING btree (company_id, status);


--
-- Name: idx_on_country_code_state_code_21132110e7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_country_code_state_code_21132110e7 ON public.spree_tax_exemption_certificates USING btree (country_code, state_code);


--
-- Name: idx_on_custom_field_definition_id_7687001add; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_custom_field_definition_id_7687001add ON public.spree_seller_requirement_custom_fields USING btree (custom_field_definition_id);


--
-- Name: idx_on_custom_field_definition_id_8b23a96514; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_custom_field_definition_id_8b23a96514 ON public.spree_product_type_custom_field_definitions USING btree (custom_field_definition_id);


--
-- Name: idx_on_customer_id_payment_method_id_75005644af; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_on_customer_id_payment_method_id_75005644af ON public.spree_gateway_customers USING btree (customer_id, payment_method_id);


--
-- Name: idx_on_customer_id_promotion_rule_id_90bd732c00; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_on_customer_id_promotion_rule_id_90bd732c00 ON public.spree_promotion_rule_users USING btree (customer_id, promotion_rule_id);


--
-- Name: idx_on_delivery_origin_group_id_01bd160cac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_delivery_origin_group_id_01bd160cac ON public.spree_delivery_origin_group_locations USING btree (delivery_origin_group_id);


--
-- Name: idx_on_product_id_promotion_rule_id_aaea0385c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_on_product_id_promotion_rule_id_aaea0385c9 ON public.spree_product_promotion_rules USING btree (product_id, promotion_rule_id);


--
-- Name: idx_on_promotion_action_id_variant_id_90d181a88a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_on_promotion_action_id_variant_id_90d181a88a ON public.spree_promotion_action_line_items USING btree (promotion_action_id, variant_id);


--
-- Name: idx_on_seller_id_currency_status_2cb0739591; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_seller_id_currency_status_2cb0739591 ON public.spree_seller_payouts USING btree (seller_id, currency, status);


--
-- Name: idx_on_seller_id_currency_status_fefa3626f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_seller_id_currency_status_fefa3626f6 ON public.spree_seller_transfers USING btree (seller_id, currency, status);


--
-- Name: idx_on_seller_requirement_id_9d30ae5c62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_seller_requirement_id_9d30ae5c62 ON public.spree_seller_requirement_submissions USING btree (seller_requirement_id);


--
-- Name: idx_on_spree_category_id_locale_5fb02d0070; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_on_spree_category_id_locale_5fb02d0070 ON public.spree_category_translations USING btree (spree_category_id, locale);


--
-- Name: idx_on_stock_level_id_expires_at_e64b0c98f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_stock_level_id_expires_at_e64b0c98f8 ON public.spree_stock_reservations USING btree (stock_level_id, expires_at);


--
-- Name: idx_on_stock_location_id_7029c947c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_stock_location_id_7029c947c2 ON public.spree_delivery_origin_group_locations USING btree (stock_location_id);


--
-- Name: idx_on_stock_location_id_74b70de887; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_stock_location_id_74b70de887 ON public.spree_delivery_method_stock_locations USING btree (stock_location_id);


--
-- Name: idx_on_store_id_enabled_position_2e416afa00; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_on_store_id_enabled_position_2e416afa00 ON public.spree_commission_rates USING btree (store_id, enabled, "position");


--
-- Name: idx_order_cancellation_reasons_on_store_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_order_cancellation_reasons_on_store_and_name ON public.spree_order_cancellation_reasons USING btree (store_id, name);


--
-- Name: idx_order_routing_rules_channel_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_order_routing_rules_channel_type ON public.spree_order_routing_rules USING btree (channel_id, type);


--
-- Name: idx_order_routing_rules_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_routing_rules_lookup ON public.spree_order_routing_rules USING btree (channel_id, active, "position");


--
-- Name: idx_payment_sessions_order_method_external; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_payment_sessions_order_method_external ON public.spree_payment_sessions USING btree (order_id, payment_method_id, external_id);


--
-- Name: idx_payments_order_method_response_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_payments_order_method_response_code ON public.spree_payments USING btree (order_id, payment_method_id, response_code) WHERE (response_code IS NOT NULL);


--
-- Name: idx_price_histories_price_recorded; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_price_histories_price_recorded ON public.spree_price_histories USING btree (price_id, recorded_at);


--
-- Name: idx_price_histories_recorded_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_price_histories_recorded_at ON public.spree_price_histories USING btree (recorded_at);


--
-- Name: idx_price_histories_variant_currency_recorded; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_price_histories_variant_currency_recorded ON public.spree_price_histories USING btree (variant_id, currency, recorded_at);


--
-- Name: idx_product_type_cf_defs_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_product_type_cf_defs_unique ON public.spree_product_type_custom_field_definitions USING btree (product_type_id, custom_field_definition_id);


--
-- Name: idx_purchase_order_items_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_purchase_order_items_unique ON public.spree_purchase_order_items USING btree (purchase_order_id, variant_id);


--
-- Name: idx_refresh_tokens_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_refresh_tokens_user ON public.spree_refresh_tokens USING btree (user_type, user_id);


--
-- Name: idx_seller_requirement_custom_fields_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_seller_requirement_custom_fields_uniqueness ON public.spree_seller_requirement_custom_fields USING btree (seller_requirement_id, custom_field_definition_id);


--
-- Name: idx_spree_pss_on_payment_source; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_spree_pss_on_payment_source ON public.spree_payment_setup_sessions USING btree (payment_source_type, payment_source_id);


--
-- Name: idx_spree_pss_unique_external_id_per_pm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_spree_pss_unique_external_id_per_pm ON public.spree_payment_setup_sessions USING btree (external_id, payment_method_id);


--
-- Name: idx_stock_reservations_level_line_item; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_stock_reservations_level_line_item ON public.spree_stock_reservations USING btree (stock_level_id, line_item_id);


--
-- Name: idx_stock_transfer_items_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_stock_transfer_items_unique ON public.spree_stock_transfer_items USING btree (stock_transfer_id, variant_id);


--
-- Name: idx_variant_media_media; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_variant_media_media ON public.spree_variant_media USING btree (media_id);


--
-- Name: idx_variant_media_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_variant_media_unique ON public.spree_variant_media USING btree (variant_id, media_id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name, locale);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_addresses_on_first_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_addresses_on_first_name ON public.spree_addresses USING btree (first_name);


--
-- Name: index_addresses_on_last_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_addresses_on_last_name ON public.spree_addresses USING btree (last_name);


--
-- Name: index_assets_on_viewable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_assets_on_viewable_id ON public.spree_media USING btree (viewable_id);


--
-- Name: index_assets_on_viewable_type_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_assets_on_viewable_type_and_type ON public.spree_media USING btree (viewable_type, type);


--
-- Name: index_collection_translations_on_collection_and_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_collection_translations_on_collection_and_locale ON public.spree_collection_translations USING btree (spree_collection_id, locale);


--
-- Name: index_commission_lines_on_fulfillment; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_commission_lines_on_fulfillment ON public.spree_commission_lines USING btree (fulfillment_id);


--
-- Name: index_commission_lines_on_line_item; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_commission_lines_on_line_item ON public.spree_commission_lines USING btree (line_item_id);


--
-- Name: index_commission_rate_values_on_rate_and_currency; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_commission_rate_values_on_rate_and_currency ON public.spree_commission_rate_values USING btree (commission_rate_id, currency) WHERE (deleted_at IS NULL);


--
-- Name: index_commission_rule_products_on_rule_and_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_commission_rule_products_on_rule_and_product ON public.spree_commission_rule_products USING btree (commission_rule_id, product_id) WHERE (deleted_at IS NULL);


--
-- Name: index_commission_rules_on_rate_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_commission_rules_on_rate_and_type ON public.spree_commission_rules USING btree (commission_rate_id, type) WHERE (deleted_at IS NULL);


--
-- Name: index_custom_field_definitions_on_store_and_filter_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_custom_field_definitions_on_store_and_filter_key ON public.spree_custom_field_definitions USING btree (store_id, resource_type, filter_key);


--
-- Name: index_custom_field_definitions_on_store_and_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_custom_field_definitions_on_store_and_key ON public.spree_custom_field_definitions USING btree (store_id, resource_type, namespace, key);


--
-- Name: index_custom_fields_on_resource_and_definition; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_custom_fields_on_resource_and_definition ON public.spree_custom_fields USING btree (resource_type, resource_id, custom_field_definition_id);


--
-- Name: index_friendly_id_slugs_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_deleted_at ON public.friendly_id_slugs USING btree (deleted_at);


--
-- Name: index_friendly_id_slugs_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_locale ON public.friendly_id_slugs USING btree (locale);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_locale ON public.friendly_id_slugs USING btree (slug, sluggable_type, locale);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_friendly_id_slugs_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_friendly_id_slugs_unique ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope, locale);


--
-- Name: index_option_type_product_types_on_option_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_option_type_product_types_on_option_type_id ON public.spree_option_type_product_types USING btree (option_type_id);


--
-- Name: index_option_type_product_types_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_option_type_product_types_uniqueness ON public.spree_option_type_product_types USING btree (product_type_id, option_type_id);


--
-- Name: index_option_values_variants_on_variant_id_and_option_value_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_option_values_variants_on_variant_id_and_option_value_id ON public.spree_option_value_variants USING btree (variant_id, option_value_id);


--
-- Name: index_payment_method_id_webhook_key_id_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_payment_method_id_webhook_key_id_uniqueness ON public.spree_stripe_payment_methods_webhook_keys USING btree (payment_method_id, webhook_key_id);


--
-- Name: index_payment_methods_webhook_keys_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payment_methods_webhook_keys_on_payment_method_id ON public.spree_stripe_payment_methods_webhook_keys USING btree (payment_method_id);


--
-- Name: index_payment_methods_webhook_keys_on_webhook_key_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_payment_methods_webhook_keys_on_webhook_key_id ON public.spree_stripe_payment_methods_webhook_keys USING btree (webhook_key_id);


--
-- Name: index_payment_sources_on_type_and_gateway_payment_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_payment_sources_on_type_and_gateway_payment_profile_id ON public.spree_payment_sources USING btree (type, gateway_payment_profile_id);


--
-- Name: index_product_collections_on_collection_and_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_product_collections_on_collection_and_product ON public.spree_product_collections USING btree (collection_id, product_id);


--
-- Name: index_product_type_categories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_product_type_categories_on_category_id ON public.spree_product_type_categories USING btree (category_id);


--
-- Name: index_product_type_categories_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_product_type_categories_uniqueness ON public.spree_product_type_categories USING btree (product_type_id, category_id);


--
-- Name: index_product_type_translations_on_product_type_and_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_product_type_translations_on_product_type_and_locale ON public.spree_product_type_translations USING btree (spree_product_type_id, locale);


--
-- Name: index_products_promotion_rules_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_promotion_rules_on_product_id ON public.spree_product_promotion_rules USING btree (product_id);


--
-- Name: index_products_promotion_rules_on_promotion_rule_and_product; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_promotion_rules_on_promotion_rule_and_product ON public.spree_product_promotion_rules USING btree (promotion_rule_id, product_id);


--
-- Name: index_products_stores_on_store_and_revenue; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_stores_on_store_and_revenue ON public.spree_products_stores USING btree (store_id, revenue);


--
-- Name: index_products_stores_on_store_and_units_sold; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_products_stores_on_store_and_units_sold ON public.spree_products_stores USING btree (store_id, units_sold_count);


--
-- Name: index_promotion_rules_on_product_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_promotion_rules_on_product_group_id ON public.spree_promotion_rules USING btree (product_group_id);


--
-- Name: index_promotion_rules_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_promotion_rules_on_user_id ON public.spree_promotion_rules USING btree (user_id);


--
-- Name: index_promotion_rules_users_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_promotion_rules_users_on_promotion_rule_id ON public.spree_promotion_rule_users USING btree (promotion_rule_id);


--
-- Name: index_promotion_rules_users_on_user_id_and_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_promotion_rules_users_on_user_id_and_promotion_rule_id ON public.spree_promotion_rule_users USING btree (customer_id, promotion_rule_id);


--
-- Name: index_refunds_on_refund_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_refunds_on_refund_reason_id ON public.spree_refunds USING btree (refund_reason_id);


--
-- Name: index_reimbursement_credits_on_creditable_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_reimbursement_credits_on_creditable_id_and_type ON public.spree_reimbursement_credits USING btree (creditable_id, creditable_type);


--
-- Name: index_return_authorizations_on_return_authorization_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_return_authorizations_on_return_authorization_reason_id ON public.spree_return_authorizations USING btree (return_authorization_reason_id);


--
-- Name: index_return_items_on_customer_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_return_items_on_customer_return_id ON public.spree_return_items USING btree (customer_return_id);


--
-- Name: index_seller_payouts_on_provider_reference; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_seller_payouts_on_provider_reference ON public.spree_seller_payouts USING btree (provider, reference) WHERE (reference IS NOT NULL);


--
-- Name: index_seller_requirement_submissions_on_pair_and_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_seller_requirement_submissions_on_pair_and_date ON public.spree_seller_requirement_submissions USING btree (seller_id, seller_requirement_id, created_at);


--
-- Name: index_seller_transfers_on_order_earning; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_seller_transfers_on_order_earning ON public.spree_seller_transfers USING btree (order_id) WHERE ((kind)::text = 'earning'::text);


--
-- Name: index_seller_transfers_on_provider_reference; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_seller_transfers_on_provider_reference ON public.spree_seller_transfers USING btree (provider, reference) WHERE (reference IS NOT NULL);


--
-- Name: index_seller_transfers_on_refund; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_seller_transfers_on_refund ON public.spree_seller_transfers USING btree (refund_id);


--
-- Name: index_seller_transfers_on_seller_and_settled_currency; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_seller_transfers_on_seller_and_settled_currency ON public.spree_seller_transfers USING btree (seller_id, settled_currency, status);


--
-- Name: index_seller_translations_on_seller_and_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_seller_translations_on_seller_and_locale ON public.spree_seller_translations USING btree (spree_seller_id, locale);


--
-- Name: index_solid_cable_messages_on_channel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_cable_messages_on_channel ON public.solid_cable_messages USING btree (channel);


--
-- Name: index_solid_cable_messages_on_channel_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_cable_messages_on_channel_hash ON public.solid_cable_messages USING btree (channel_hash);


--
-- Name: index_solid_cable_messages_on_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_cable_messages_on_created_at ON public.solid_cable_messages USING btree (created_at);


--
-- Name: index_solid_cache_entries_on_byte_size; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_cache_entries_on_byte_size ON public.solid_cache_entries USING btree (byte_size);


--
-- Name: index_solid_cache_entries_on_key_hash; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_cache_entries_on_key_hash ON public.solid_cache_entries USING btree (key_hash);


--
-- Name: index_solid_cache_entries_on_key_hash_and_byte_size; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_cache_entries_on_key_hash_and_byte_size ON public.solid_cache_entries USING btree (key_hash, byte_size);


--
-- Name: index_solid_queue_blocked_executions_for_maintenance; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_blocked_executions_for_maintenance ON public.solid_queue_blocked_executions USING btree (expires_at, concurrency_key);


--
-- Name: index_solid_queue_blocked_executions_for_release; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_blocked_executions_for_release ON public.solid_queue_blocked_executions USING btree (concurrency_key, priority, job_id);


--
-- Name: index_solid_queue_blocked_executions_on_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_blocked_executions_on_job_id ON public.solid_queue_blocked_executions USING btree (job_id);


--
-- Name: index_solid_queue_claimed_executions_on_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_claimed_executions_on_job_id ON public.solid_queue_claimed_executions USING btree (job_id);


--
-- Name: index_solid_queue_claimed_executions_on_process_id_and_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_claimed_executions_on_process_id_and_job_id ON public.solid_queue_claimed_executions USING btree (process_id, job_id);


--
-- Name: index_solid_queue_dispatch_all; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_dispatch_all ON public.solid_queue_scheduled_executions USING btree (scheduled_at, priority, job_id);


--
-- Name: index_solid_queue_failed_executions_on_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_failed_executions_on_job_id ON public.solid_queue_failed_executions USING btree (job_id);


--
-- Name: index_solid_queue_jobs_for_alerting; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_jobs_for_alerting ON public.solid_queue_jobs USING btree (scheduled_at, finished_at);


--
-- Name: index_solid_queue_jobs_for_filtering; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_jobs_for_filtering ON public.solid_queue_jobs USING btree (queue_name, finished_at);


--
-- Name: index_solid_queue_jobs_on_active_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_jobs_on_active_job_id ON public.solid_queue_jobs USING btree (active_job_id);


--
-- Name: index_solid_queue_jobs_on_class_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_jobs_on_class_name ON public.solid_queue_jobs USING btree (class_name);


--
-- Name: index_solid_queue_jobs_on_finished_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_jobs_on_finished_at ON public.solid_queue_jobs USING btree (finished_at);


--
-- Name: index_solid_queue_pauses_on_queue_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_pauses_on_queue_name ON public.solid_queue_pauses USING btree (queue_name);


--
-- Name: index_solid_queue_poll_all; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_poll_all ON public.solid_queue_ready_executions USING btree (priority, job_id);


--
-- Name: index_solid_queue_poll_by_queue; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_poll_by_queue ON public.solid_queue_ready_executions USING btree (queue_name, priority, job_id);


--
-- Name: index_solid_queue_processes_on_last_heartbeat_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_processes_on_last_heartbeat_at ON public.solid_queue_processes USING btree (last_heartbeat_at);


--
-- Name: index_solid_queue_processes_on_name_and_supervisor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_processes_on_name_and_supervisor_id ON public.solid_queue_processes USING btree (name, supervisor_id);


--
-- Name: index_solid_queue_processes_on_supervisor_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_processes_on_supervisor_id ON public.solid_queue_processes USING btree (supervisor_id);


--
-- Name: index_solid_queue_ready_executions_on_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_ready_executions_on_job_id ON public.solid_queue_ready_executions USING btree (job_id);


--
-- Name: index_solid_queue_recurring_executions_on_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_recurring_executions_on_job_id ON public.solid_queue_recurring_executions USING btree (job_id);


--
-- Name: index_solid_queue_recurring_executions_on_task_key_and_run_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_recurring_executions_on_task_key_and_run_at ON public.solid_queue_recurring_executions USING btree (task_key, run_at);


--
-- Name: index_solid_queue_recurring_tasks_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_recurring_tasks_on_key ON public.solid_queue_recurring_tasks USING btree (key);


--
-- Name: index_solid_queue_recurring_tasks_on_static; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_recurring_tasks_on_static ON public.solid_queue_recurring_tasks USING btree (static);


--
-- Name: index_solid_queue_scheduled_executions_on_job_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_scheduled_executions_on_job_id ON public.solid_queue_scheduled_executions USING btree (job_id);


--
-- Name: index_solid_queue_semaphores_on_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_semaphores_on_expires_at ON public.solid_queue_semaphores USING btree (expires_at);


--
-- Name: index_solid_queue_semaphores_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_solid_queue_semaphores_on_key ON public.solid_queue_semaphores USING btree (key);


--
-- Name: index_solid_queue_semaphores_on_key_and_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_solid_queue_semaphores_on_key_and_value ON public.solid_queue_semaphores USING btree (key, value);


--
-- Name: index_spree_addresses_on_country_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_addresses_on_country_code ON public.spree_addresses USING btree (country_code);


--
-- Name: index_spree_addresses_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_addresses_on_country_id ON public.spree_addresses USING btree (country_id);


--
-- Name: index_spree_addresses_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_addresses_on_deleted_at ON public.spree_addresses USING btree (deleted_at);


--
-- Name: index_spree_addresses_on_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_addresses_on_owner ON public.spree_addresses USING btree (owner_type, owner_id);


--
-- Name: index_spree_addresses_on_quick_checkout; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_addresses_on_quick_checkout ON public.spree_addresses USING btree (quick_checkout);


--
-- Name: index_spree_addresses_on_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_addresses_on_state_id ON public.spree_addresses USING btree (state_id);


--
-- Name: index_spree_adjustments_on_adjustable_and_source_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_adjustable_and_source_type ON public.spree_adjustments USING btree (adjustable_type, adjustable_id, source_type);


--
-- Name: index_spree_adjustments_on_adjustable_id_and_adjustable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_adjustable_id_and_adjustable_type ON public.spree_adjustments USING btree (adjustable_id, adjustable_type);


--
-- Name: index_spree_adjustments_on_amount; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_amount ON public.spree_adjustments USING btree (amount);


--
-- Name: index_spree_adjustments_on_eligible; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_eligible ON public.spree_adjustments USING btree (eligible);


--
-- Name: index_spree_adjustments_on_order_eligible_source_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_order_eligible_source_type ON public.spree_adjustments USING btree (order_id, eligible, source_type);


--
-- Name: index_spree_adjustments_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_order_id ON public.spree_adjustments USING btree (order_id);


--
-- Name: index_spree_adjustments_on_order_id_and_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_order_id_and_state ON public.spree_adjustments USING btree (order_id, state);


--
-- Name: index_spree_adjustments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_source_id_and_source_type ON public.spree_adjustments USING btree (source_id, source_type);


--
-- Name: index_spree_adjustments_on_source_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_adjustments_on_source_type ON public.spree_adjustments USING btree (source_type);


--
-- Name: index_spree_admin_users_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_admin_users_on_email ON public.spree_admin_users USING btree (email);


--
-- Name: index_spree_allowed_origins_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_allowed_origins_on_store_id ON public.spree_allowed_origins USING btree (store_id);


--
-- Name: index_spree_allowed_origins_on_store_id_and_origin; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_allowed_origins_on_store_id_and_origin ON public.spree_allowed_origins USING btree (store_id, origin);


--
-- Name: index_spree_api_keys_on_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_api_keys_on_channel_id ON public.spree_api_keys USING btree (channel_id);


--
-- Name: index_spree_api_keys_on_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_api_keys_on_created_by ON public.spree_api_keys USING btree (created_by_type, created_by_id);


--
-- Name: index_spree_api_keys_on_key_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_api_keys_on_key_type ON public.spree_api_keys USING btree (key_type);


--
-- Name: index_spree_api_keys_on_revoked_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_api_keys_on_revoked_by ON public.spree_api_keys USING btree (revoked_by_type, revoked_by_id);


--
-- Name: index_spree_api_keys_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_api_keys_on_store_id ON public.spree_api_keys USING btree (store_id);


--
-- Name: index_spree_api_keys_on_store_id_and_key_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_api_keys_on_store_id_and_key_type ON public.spree_api_keys USING btree (store_id, key_type);


--
-- Name: index_spree_api_keys_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_api_keys_on_token ON public.spree_api_keys USING btree (token) WHERE (token IS NOT NULL);


--
-- Name: index_spree_api_keys_on_token_digest; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_api_keys_on_token_digest ON public.spree_api_keys USING btree (token_digest);


--
-- Name: index_spree_brands_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_brands_on_name ON public.spree_brands USING btree (name);


--
-- Name: index_spree_brands_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_brands_on_store_id ON public.spree_brands USING btree (store_id);


--
-- Name: index_spree_brands_on_store_id_and_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_brands_on_store_id_and_slug ON public.spree_brands USING btree (store_id, slug);


--
-- Name: index_spree_calculators_on_calculable_id_and_calculable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_calculators_on_calculable_id_and_calculable_type ON public.spree_calculators USING btree (calculable_id, calculable_type);


--
-- Name: index_spree_calculators_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_calculators_on_deleted_at ON public.spree_calculators USING btree (deleted_at);


--
-- Name: index_spree_calculators_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_calculators_on_id_and_type ON public.spree_calculators USING btree (id, type);


--
-- Name: index_spree_carts_on_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_channel_id ON public.spree_carts USING btree (channel_id);


--
-- Name: index_spree_carts_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_company_id ON public.spree_carts USING btree (company_id);


--
-- Name: index_spree_carts_on_completed_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_completed_at ON public.spree_carts USING btree (completed_at);


--
-- Name: index_spree_carts_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_customer_id ON public.spree_carts USING btree (customer_id);


--
-- Name: index_spree_carts_on_gift_card_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_gift_card_id ON public.spree_carts USING btree (gift_card_id);


--
-- Name: index_spree_carts_on_market_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_market_id ON public.spree_carts USING btree (market_id);


--
-- Name: index_spree_carts_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_store_id ON public.spree_carts USING btree (store_id);


--
-- Name: index_spree_carts_on_store_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_store_id_and_created_at ON public.spree_carts USING btree (store_id, created_at);


--
-- Name: index_spree_carts_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_carts_on_token ON public.spree_carts USING btree (token);


--
-- Name: index_spree_carts_on_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_carts_on_updated_at ON public.spree_carts USING btree (updated_at);


--
-- Name: index_spree_catalog_assignments_on_assignable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_catalog_assignments_on_assignable ON public.spree_catalog_assignments USING btree (assignable_type, assignable_id);


--
-- Name: index_spree_catalog_assignments_on_catalog_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_catalog_assignments_on_catalog_id ON public.spree_catalog_assignments USING btree (catalog_id);


--
-- Name: index_spree_catalog_products_on_catalog_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_catalog_products_on_catalog_id ON public.spree_catalog_products USING btree (catalog_id);


--
-- Name: index_spree_catalog_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_catalog_products_on_product_id ON public.spree_catalog_products USING btree (product_id);


--
-- Name: index_spree_catalog_quantity_rules_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_catalog_quantity_rules_on_variant_id ON public.spree_catalog_quantity_rules USING btree (variant_id);


--
-- Name: index_spree_catalogs_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_catalogs_on_store_id ON public.spree_catalogs USING btree (store_id);


--
-- Name: index_spree_categories_on_children_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_categories_on_children_count ON public.spree_categories USING btree (children_count);


--
-- Name: index_spree_categories_on_lft; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_categories_on_lft ON public.spree_categories USING btree (lft);


--
-- Name: index_spree_categories_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_categories_on_name ON public.spree_categories USING btree (name);


--
-- Name: index_spree_categories_on_permalink_and_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_categories_on_permalink_and_store_id ON public.spree_categories USING btree (permalink, store_id);


--
-- Name: index_spree_categories_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_categories_on_position ON public.spree_categories USING btree ("position");


--
-- Name: index_spree_categories_on_pretty_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_categories_on_pretty_name ON public.spree_categories USING btree (pretty_name);


--
-- Name: index_spree_categories_on_products_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_categories_on_products_count ON public.spree_categories USING btree (products_count);


--
-- Name: index_spree_categories_on_rgt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_categories_on_rgt ON public.spree_categories USING btree (rgt);


--
-- Name: index_spree_categories_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_categories_on_store_id ON public.spree_categories USING btree (store_id);


--
-- Name: index_spree_category_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_category_translations_on_locale ON public.spree_category_translations USING btree (locale);


--
-- Name: index_spree_category_translations_on_pretty_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_category_translations_on_pretty_name ON public.spree_category_translations USING btree (pretty_name);


--
-- Name: index_spree_channel_stock_locations_on_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_channel_stock_locations_on_channel_id ON public.spree_channel_stock_locations USING btree (channel_id);


--
-- Name: index_spree_channel_stock_locations_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_channel_stock_locations_on_stock_location_id ON public.spree_channel_stock_locations USING btree (stock_location_id);


--
-- Name: index_spree_channels_default_per_store; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_channels_default_per_store ON public.spree_channels USING btree (store_id) WHERE ("default" = true);


--
-- Name: index_spree_channels_on_default_catalog_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_channels_on_default_catalog_id ON public.spree_channels USING btree (default_catalog_id);


--
-- Name: index_spree_channels_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_channels_on_store_id ON public.spree_channels USING btree (store_id);


--
-- Name: index_spree_channels_on_store_id_and_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_channels_on_store_id_and_code ON public.spree_channels USING btree (store_id, code);


--
-- Name: index_spree_claim_line_items_on_claim_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claim_line_items_on_claim_id ON public.spree_claim_line_items USING btree (claim_id);


--
-- Name: index_spree_claim_line_items_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claim_line_items_on_line_item_id ON public.spree_claim_line_items USING btree (line_item_id);


--
-- Name: index_spree_claim_line_items_on_replacement_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claim_line_items_on_replacement_variant_id ON public.spree_claim_line_items USING btree (replacement_variant_id);


--
-- Name: index_spree_claim_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claim_line_items_on_variant_id ON public.spree_claim_line_items USING btree (variant_id);


--
-- Name: index_spree_claim_reasons_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claim_reasons_on_store_id ON public.spree_claim_reasons USING btree (store_id);


--
-- Name: index_spree_claim_reasons_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_claim_reasons_on_store_id_and_name ON public.spree_claim_reasons USING btree (store_id, name);


--
-- Name: index_spree_claims_on_created_by_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claims_on_created_by_actor ON public.spree_claims USING btree (created_by_type, created_by_id);


--
-- Name: index_spree_claims_on_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claims_on_created_by_id ON public.spree_claims USING btree (created_by_id);


--
-- Name: index_spree_claims_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_claims_on_number ON public.spree_claims USING btree (number);


--
-- Name: index_spree_claims_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claims_on_order_id ON public.spree_claims USING btree (order_id);


--
-- Name: index_spree_claims_on_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claims_on_reason_id ON public.spree_claims USING btree (reason_id);


--
-- Name: index_spree_claims_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claims_on_status ON public.spree_claims USING btree (status);


--
-- Name: index_spree_claims_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_claims_on_store_id ON public.spree_claims USING btree (store_id);


--
-- Name: index_spree_collection_rules_on_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_collection_rules_on_collection_id ON public.spree_collection_rules USING btree (collection_id);


--
-- Name: index_spree_collection_rules_on_collection_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_collection_rules_on_collection_id_and_type ON public.spree_collection_rules USING btree (collection_id, type);


--
-- Name: index_spree_collection_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_collection_translations_on_locale ON public.spree_collection_translations USING btree (locale);


--
-- Name: index_spree_collections_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_collections_on_store_id ON public.spree_collections USING btree (store_id);


--
-- Name: index_spree_collections_on_store_id_and_permalink; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_collections_on_store_id_and_permalink ON public.spree_collections USING btree (store_id, permalink);


--
-- Name: index_spree_commission_lines_on_commission_rate_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_lines_on_commission_rate_id ON public.spree_commission_lines USING btree (commission_rate_id);


--
-- Name: index_spree_commission_lines_on_country_code_and_state_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_lines_on_country_code_and_state_code ON public.spree_commission_lines USING btree (country_code, state_code);


--
-- Name: index_spree_commission_lines_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_lines_on_order_id ON public.spree_commission_lines USING btree (order_id);


--
-- Name: index_spree_commission_lines_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_lines_on_seller_id ON public.spree_commission_lines USING btree (seller_id);


--
-- Name: index_spree_commission_lines_on_seller_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_lines_on_seller_id_and_created_at ON public.spree_commission_lines USING btree (seller_id, created_at);


--
-- Name: index_spree_commission_lines_on_taxability_reason; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_lines_on_taxability_reason ON public.spree_commission_lines USING btree (taxability_reason);


--
-- Name: index_spree_commission_rate_values_on_commission_rate_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rate_values_on_commission_rate_id ON public.spree_commission_rate_values USING btree (commission_rate_id);


--
-- Name: index_spree_commission_rate_values_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rate_values_on_deleted_at ON public.spree_commission_rate_values USING btree (deleted_at);


--
-- Name: index_spree_commission_rates_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rates_on_deleted_at ON public.spree_commission_rates USING btree (deleted_at);


--
-- Name: index_spree_commission_rates_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rates_on_store_id ON public.spree_commission_rates USING btree (store_id);


--
-- Name: index_spree_commission_rates_on_store_id_and_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_commission_rates_on_store_id_and_code ON public.spree_commission_rates USING btree (store_id, code) WHERE (deleted_at IS NULL);


--
-- Name: index_spree_commission_rule_products_on_commission_rule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rule_products_on_commission_rule_id ON public.spree_commission_rule_products USING btree (commission_rule_id);


--
-- Name: index_spree_commission_rule_products_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rule_products_on_deleted_at ON public.spree_commission_rule_products USING btree (deleted_at);


--
-- Name: index_spree_commission_rule_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rule_products_on_product_id ON public.spree_commission_rule_products USING btree (product_id);


--
-- Name: index_spree_commission_rules_on_commission_rate_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rules_on_commission_rate_id ON public.spree_commission_rules USING btree (commission_rate_id);


--
-- Name: index_spree_commission_rules_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_commission_rules_on_deleted_at ON public.spree_commission_rules USING btree (deleted_at);


--
-- Name: index_spree_companies_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_companies_on_parent_id ON public.spree_companies USING btree (parent_id);


--
-- Name: index_spree_companies_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_companies_on_store_id ON public.spree_companies USING btree (store_id);


--
-- Name: index_spree_company_invitations_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_company_invitations_on_company_id ON public.spree_company_invitations USING btree (company_id);


--
-- Name: index_spree_company_invitations_on_company_id_and_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_company_invitations_on_company_id_and_email ON public.spree_company_invitations USING btree (company_id, email);


--
-- Name: index_spree_company_invitations_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_company_invitations_on_customer_id ON public.spree_company_invitations USING btree (customer_id);


--
-- Name: index_spree_company_invitations_on_inviter_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_company_invitations_on_inviter_id ON public.spree_company_invitations USING btree (inviter_id);


--
-- Name: index_spree_company_invitations_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_company_invitations_on_token ON public.spree_company_invitations USING btree (token);


--
-- Name: index_spree_company_memberships_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_company_memberships_on_company_id ON public.spree_company_memberships USING btree (company_id);


--
-- Name: index_spree_company_memberships_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_company_memberships_on_customer_id ON public.spree_company_memberships USING btree (customer_id);


--
-- Name: index_spree_consent_records_on_lower_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_consent_records_on_lower_email ON public.spree_consent_records USING btree (lower((email)::text));


--
-- Name: index_spree_consent_records_on_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_consent_records_on_owner ON public.spree_consent_records USING btree (owner_type, owner_id);


--
-- Name: index_spree_consent_records_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_consent_records_on_store_id ON public.spree_consent_records USING btree (store_id);


--
-- Name: index_spree_consent_records_on_store_purpose_recorded; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_consent_records_on_store_purpose_recorded ON public.spree_consent_records USING btree (store_id, purpose, recorded_at);


--
-- Name: index_spree_countries_on_iso; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_countries_on_iso ON public.spree_countries USING btree (iso);


--
-- Name: index_spree_countries_on_iso3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_countries_on_iso3 ON public.spree_countries USING btree (iso3);


--
-- Name: index_spree_countries_on_iso_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_countries_on_iso_name ON public.spree_countries USING btree (iso_name);


--
-- Name: index_spree_countries_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_countries_on_name ON public.spree_countries USING btree (name);


--
-- Name: index_spree_coupon_codes_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_coupon_codes_on_cart_id ON public.spree_coupon_codes USING btree (cart_id);


--
-- Name: index_spree_coupon_codes_on_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_coupon_codes_on_code ON public.spree_coupon_codes USING btree (code);


--
-- Name: index_spree_coupon_codes_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_coupon_codes_on_deleted_at ON public.spree_coupon_codes USING btree (deleted_at);


--
-- Name: index_spree_coupon_codes_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_coupon_codes_on_order_id ON public.spree_coupon_codes USING btree (order_id);


--
-- Name: index_spree_coupon_codes_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_coupon_codes_on_promotion_id ON public.spree_coupon_codes USING btree (promotion_id);


--
-- Name: index_spree_coupon_codes_on_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_coupon_codes_on_state ON public.spree_coupon_codes USING btree (state);


--
-- Name: index_spree_credit_cards_on_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_credit_cards_on_address_id ON public.spree_credit_cards USING btree (address_id);


--
-- Name: index_spree_credit_cards_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_credit_cards_on_customer_id ON public.spree_credit_cards USING btree (customer_id);


--
-- Name: index_spree_credit_cards_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_credit_cards_on_deleted_at ON public.spree_credit_cards USING btree (deleted_at);


--
-- Name: index_spree_credit_cards_on_gateway_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_credit_cards_on_gateway_customer_id ON public.spree_credit_cards USING btree (gateway_customer_id);


--
-- Name: index_spree_credit_cards_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_credit_cards_on_payment_method_id ON public.spree_credit_cards USING btree (payment_method_id);


--
-- Name: index_spree_credit_cards_unique_fingerprint; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_credit_cards_unique_fingerprint ON public.spree_credit_cards USING btree (customer_id, payment_method_id, fingerprint, month, year) WHERE ((fingerprint IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: index_spree_custom_domains_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_custom_domains_on_store_id ON public.spree_custom_domains USING btree (store_id);


--
-- Name: index_spree_custom_domains_on_url; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_custom_domains_on_url ON public.spree_custom_domains USING btree (url);


--
-- Name: index_spree_custom_field_definitions_on_namespace_and_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_custom_field_definitions_on_namespace_and_key ON public.spree_custom_field_definitions USING btree (namespace, key);


--
-- Name: index_spree_custom_field_definitions_on_resource_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_custom_field_definitions_on_resource_type ON public.spree_custom_field_definitions USING btree (resource_type);


--
-- Name: index_spree_custom_field_definitions_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_custom_field_definitions_on_store_id ON public.spree_custom_field_definitions USING btree (store_id);


--
-- Name: index_spree_custom_fields_on_custom_field_definition_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_custom_fields_on_custom_field_definition_id ON public.spree_custom_fields USING btree (custom_field_definition_id);


--
-- Name: index_spree_custom_fields_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_custom_fields_on_type ON public.spree_custom_fields USING btree (type);


--
-- Name: index_spree_customer_group_users_on_customer_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customer_group_users_on_customer_group_id ON public.spree_customer_group_users USING btree (customer_group_id);


--
-- Name: index_spree_customer_group_users_on_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customer_group_users_on_user ON public.spree_customer_group_users USING btree (customer_type, customer_id);


--
-- Name: index_spree_customer_group_users_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_customer_group_users_unique ON public.spree_customer_group_users USING btree (customer_group_id, customer_id, customer_type);


--
-- Name: index_spree_customer_groups_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customer_groups_on_deleted_at ON public.spree_customer_groups USING btree (deleted_at);


--
-- Name: index_spree_customer_groups_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customer_groups_on_store_id ON public.spree_customer_groups USING btree (store_id);


--
-- Name: index_spree_customer_groups_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_customer_groups_on_store_id_and_name ON public.spree_customer_groups USING btree (store_id, name) WHERE (deleted_at IS NULL);


--
-- Name: index_spree_customer_returns_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_customer_returns_on_number ON public.spree_customer_returns USING btree (number);


--
-- Name: index_spree_customer_returns_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customer_returns_on_stock_location_id ON public.spree_customer_returns USING btree (stock_location_id);


--
-- Name: index_spree_customer_returns_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customer_returns_on_store_id ON public.spree_customer_returns USING btree (store_id);


--
-- Name: index_spree_customers_on_accepts_email_marketing; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customers_on_accepts_email_marketing ON public.spree_customers USING btree (accepts_email_marketing);


--
-- Name: index_spree_customers_on_anonymized_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customers_on_anonymized_at ON public.spree_customers USING btree (anonymized_at);


--
-- Name: index_spree_customers_on_bill_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customers_on_bill_address_id ON public.spree_customers USING btree (bill_address_id);


--
-- Name: index_spree_customers_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_customers_on_email ON public.spree_customers USING btree (email);


--
-- Name: index_spree_customers_on_ship_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_customers_on_ship_address_id ON public.spree_customers USING btree (ship_address_id);


--
-- Name: index_spree_data_feeds_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_data_feeds_on_store_id ON public.spree_data_feeds USING btree (store_id);


--
-- Name: index_spree_data_feeds_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_data_feeds_on_store_id_and_name ON public.spree_data_feeds USING btree (store_id, name);


--
-- Name: index_spree_data_feeds_on_store_id_and_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_data_feeds_on_store_id_and_slug ON public.spree_data_feeds USING btree (store_id, slug);


--
-- Name: index_spree_data_feeds_on_store_id_and_slug_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_data_feeds_on_store_id_and_slug_and_type ON public.spree_data_feeds USING btree (store_id, slug, type);


--
-- Name: index_spree_data_requests_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_data_requests_on_customer_id ON public.spree_data_requests USING btree (customer_id);


--
-- Name: index_spree_data_requests_on_customer_kind_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_data_requests_on_customer_kind_status ON public.spree_data_requests USING btree (customer_id, kind, status);


--
-- Name: index_spree_data_requests_on_download_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_data_requests_on_download_token ON public.spree_data_requests USING btree (download_token);


--
-- Name: index_spree_data_requests_on_requested_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_data_requests_on_requested_by_id ON public.spree_data_requests USING btree (requested_by_id);


--
-- Name: index_spree_data_requests_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_data_requests_on_store_id ON public.spree_data_requests USING btree (store_id);


--
-- Name: index_spree_data_requests_on_store_id_and_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_data_requests_on_store_id_and_number ON public.spree_data_requests USING btree (store_id, number);


--
-- Name: index_spree_deliveries_on_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_deliveries_on_owner ON public.spree_deliveries USING btree (owner_type, owner_id);


--
-- Name: index_spree_deliveries_on_owner_and_tracking_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_deliveries_on_owner_and_tracking_number ON public.spree_deliveries USING btree (owner_type, owner_id, tracking_number);


--
-- Name: index_spree_deliveries_on_shipping_label_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_deliveries_on_shipping_label_id ON public.spree_deliveries USING btree (shipping_label_id);


--
-- Name: index_spree_deliveries_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_deliveries_on_store_id ON public.spree_deliveries USING btree (store_id);


--
-- Name: index_spree_deliveries_on_store_id_and_tracking_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_deliveries_on_store_id_and_tracking_number ON public.spree_deliveries USING btree (store_id, tracking_number);


--
-- Name: index_spree_delivery_method_rule_products_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_method_rule_products_on_product_id ON public.spree_delivery_method_rule_products USING btree (product_id);


--
-- Name: index_spree_delivery_method_rules_on_delivery_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_method_rules_on_delivery_method_id ON public.spree_delivery_method_rules USING btree (delivery_method_id);


--
-- Name: index_spree_delivery_method_services_on_delivery_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_method_services_on_delivery_method_id ON public.spree_delivery_method_services USING btree (delivery_method_id);


--
-- Name: index_spree_delivery_methods_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_methods_on_deleted_at ON public.spree_delivery_methods USING btree (deleted_at);


--
-- Name: index_spree_delivery_methods_on_delivery_origin_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_methods_on_delivery_origin_group_id ON public.spree_delivery_methods USING btree (delivery_origin_group_id);


--
-- Name: index_spree_delivery_methods_on_delivery_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_methods_on_delivery_profile_id ON public.spree_delivery_methods USING btree (delivery_profile_id);


--
-- Name: index_spree_delivery_methods_on_delivery_zone_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_methods_on_delivery_zone_id ON public.spree_delivery_methods USING btree (delivery_zone_id);


--
-- Name: index_spree_delivery_methods_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_methods_on_seller_id ON public.spree_delivery_methods USING btree (seller_id);


--
-- Name: index_spree_delivery_methods_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_methods_on_store_id ON public.spree_delivery_methods USING btree (store_id);


--
-- Name: index_spree_delivery_methods_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_methods_on_tax_category_id ON public.spree_delivery_methods USING btree (tax_category_id);


--
-- Name: index_spree_delivery_origin_groups_on_delivery_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_origin_groups_on_delivery_profile_id ON public.spree_delivery_origin_groups USING btree (delivery_profile_id);


--
-- Name: index_spree_delivery_profiles_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_profiles_on_name ON public.spree_delivery_profiles USING btree (name);


--
-- Name: index_spree_delivery_profiles_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_profiles_on_store_id ON public.spree_delivery_profiles USING btree (store_id);


--
-- Name: index_spree_delivery_profiles_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_profiles_on_type ON public.spree_delivery_profiles USING btree (type);


--
-- Name: index_spree_delivery_rates_on_delivery_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_rates_on_delivery_method_id ON public.spree_delivery_rates USING btree (delivery_method_id);


--
-- Name: index_spree_delivery_rates_on_fulfillment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_rates_on_fulfillment_id ON public.spree_delivery_rates USING btree (fulfillment_id);


--
-- Name: index_spree_delivery_rates_on_selected; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_rates_on_selected ON public.spree_delivery_rates USING btree (selected);


--
-- Name: index_spree_delivery_rates_on_tax_rate_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_rates_on_tax_rate_id ON public.spree_delivery_rates USING btree (tax_rate_id);


--
-- Name: index_spree_delivery_zone_members_on_country_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_zone_members_on_country_code ON public.spree_delivery_zone_members USING btree (country_code);


--
-- Name: index_spree_delivery_zone_members_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_zone_members_on_country_id ON public.spree_delivery_zone_members USING btree (country_id);


--
-- Name: index_spree_delivery_zone_members_on_delivery_zone_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_zone_members_on_delivery_zone_id ON public.spree_delivery_zone_members USING btree (delivery_zone_id);


--
-- Name: index_spree_delivery_zone_members_on_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_zone_members_on_state_id ON public.spree_delivery_zone_members USING btree (state_id);


--
-- Name: index_spree_delivery_zones_on_delivery_origin_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_zones_on_delivery_origin_group_id ON public.spree_delivery_zones USING btree (delivery_origin_group_id);


--
-- Name: index_spree_delivery_zones_on_delivery_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_zones_on_delivery_profile_id ON public.spree_delivery_zones USING btree (delivery_profile_id);


--
-- Name: index_spree_delivery_zones_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_delivery_zones_on_store_id ON public.spree_delivery_zones USING btree (store_id);


--
-- Name: index_spree_delivery_zones_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_delivery_zones_on_store_id_and_name ON public.spree_delivery_zones USING btree (store_id, name);


--
-- Name: index_spree_digital_assets_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_digital_assets_on_variant_id ON public.spree_digital_assets USING btree (variant_id);


--
-- Name: index_spree_digital_links_on_digital_asset_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_digital_links_on_digital_asset_id ON public.spree_digital_links USING btree (digital_asset_id);


--
-- Name: index_spree_digital_links_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_digital_links_on_line_item_id ON public.spree_digital_links USING btree (line_item_id);


--
-- Name: index_spree_digital_links_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_digital_links_on_token ON public.spree_digital_links USING btree (token);


--
-- Name: index_spree_discounts_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_discounts_on_cart_id ON public.spree_discounts USING btree (cart_id);


--
-- Name: index_spree_discounts_on_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_discounts_on_code ON public.spree_discounts USING btree (code);


--
-- Name: index_spree_discounts_on_fulfillment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_discounts_on_fulfillment_id ON public.spree_discounts USING btree (fulfillment_id);


--
-- Name: index_spree_discounts_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_discounts_on_line_item_id ON public.spree_discounts USING btree (line_item_id);


--
-- Name: index_spree_discounts_on_line_item_id_and_kind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_discounts_on_line_item_id_and_kind ON public.spree_discounts USING btree (line_item_id, kind);


--
-- Name: index_spree_discounts_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_discounts_on_order_id ON public.spree_discounts USING btree (order_id);


--
-- Name: index_spree_discounts_on_promotion_action_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_discounts_on_promotion_action_id ON public.spree_discounts USING btree (promotion_action_id);


--
-- Name: index_spree_discounts_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_discounts_on_promotion_id ON public.spree_discounts USING btree (promotion_id);


--
-- Name: index_spree_exchange_line_items_on_exchange_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchange_line_items_on_exchange_id ON public.spree_exchange_line_items USING btree (exchange_id);


--
-- Name: index_spree_exchange_line_items_on_fulfillment_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchange_line_items_on_fulfillment_item_id ON public.spree_exchange_line_items USING btree (fulfillment_item_id);


--
-- Name: index_spree_exchange_line_items_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchange_line_items_on_line_item_id ON public.spree_exchange_line_items USING btree (line_item_id);


--
-- Name: index_spree_exchange_line_items_on_new_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchange_line_items_on_new_variant_id ON public.spree_exchange_line_items USING btree (new_variant_id);


--
-- Name: index_spree_exchange_line_items_on_original_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchange_line_items_on_original_variant_id ON public.spree_exchange_line_items USING btree (original_variant_id);


--
-- Name: index_spree_exchanges_on_created_by_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchanges_on_created_by_actor ON public.spree_exchanges USING btree (created_by_type, created_by_id);


--
-- Name: index_spree_exchanges_on_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchanges_on_created_by_id ON public.spree_exchanges USING btree (created_by_id);


--
-- Name: index_spree_exchanges_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_exchanges_on_number ON public.spree_exchanges USING btree (number);


--
-- Name: index_spree_exchanges_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchanges_on_order_id ON public.spree_exchanges USING btree (order_id);


--
-- Name: index_spree_exchanges_on_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchanges_on_reason_id ON public.spree_exchanges USING btree (reason_id);


--
-- Name: index_spree_exchanges_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchanges_on_status ON public.spree_exchanges USING btree (status);


--
-- Name: index_spree_exchanges_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchanges_on_stock_location_id ON public.spree_exchanges USING btree (stock_location_id);


--
-- Name: index_spree_exchanges_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exchanges_on_store_id ON public.spree_exchanges USING btree (store_id);


--
-- Name: index_spree_exports_on_format; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exports_on_format ON public.spree_exports USING btree (format);


--
-- Name: index_spree_exports_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_exports_on_number ON public.spree_exports USING btree (number);


--
-- Name: index_spree_exports_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exports_on_seller_id ON public.spree_exports USING btree (seller_id);


--
-- Name: index_spree_exports_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exports_on_store_id ON public.spree_exports USING btree (store_id);


--
-- Name: index_spree_exports_on_store_id_and_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exports_on_store_id_and_seller_id ON public.spree_exports USING btree (store_id, seller_id);


--
-- Name: index_spree_exports_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_exports_on_user_id ON public.spree_exports USING btree (user_id);


--
-- Name: index_spree_fees_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fees_on_cart_id ON public.spree_fees USING btree (cart_id);


--
-- Name: index_spree_fees_on_fulfillment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fees_on_fulfillment_id ON public.spree_fees USING btree (fulfillment_id);


--
-- Name: index_spree_fees_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fees_on_line_item_id ON public.spree_fees USING btree (line_item_id);


--
-- Name: index_spree_fees_on_order_id_and_kind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fees_on_order_id_and_kind ON public.spree_fees USING btree (order_id, kind);


--
-- Name: index_spree_fulfillment_items_on_fulfillment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillment_items_on_fulfillment_id ON public.spree_fulfillment_items USING btree (fulfillment_id);


--
-- Name: index_spree_fulfillment_items_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillment_items_on_line_item_id ON public.spree_fulfillment_items USING btree (line_item_id);


--
-- Name: index_spree_fulfillment_items_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillment_items_on_order_id ON public.spree_fulfillment_items USING btree (order_id);


--
-- Name: index_spree_fulfillment_items_on_original_return_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillment_items_on_original_return_item_id ON public.spree_fulfillment_items USING btree (original_return_item_id);


--
-- Name: index_spree_fulfillment_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillment_items_on_variant_id ON public.spree_fulfillment_items USING btree (variant_id);


--
-- Name: index_spree_fulfillments_on_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillments_on_address_id ON public.spree_fulfillments USING btree (address_id);


--
-- Name: index_spree_fulfillments_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillments_on_cart_id ON public.spree_fulfillments USING btree (cart_id);


--
-- Name: index_spree_fulfillments_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_fulfillments_on_number ON public.spree_fulfillments USING btree (number);


--
-- Name: index_spree_fulfillments_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillments_on_order_id ON public.spree_fulfillments USING btree (order_id);


--
-- Name: index_spree_fulfillments_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillments_on_status ON public.spree_fulfillments USING btree (status);


--
-- Name: index_spree_fulfillments_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillments_on_stock_location_id ON public.spree_fulfillments USING btree (stock_location_id);


--
-- Name: index_spree_fulfillments_on_tracking; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_fulfillments_on_tracking ON public.spree_fulfillments USING btree (tracking);


--
-- Name: index_spree_gateway_customers_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gateway_customers_on_customer_id ON public.spree_gateway_customers USING btree (customer_id);


--
-- Name: index_spree_gateway_customers_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gateway_customers_on_payment_method_id ON public.spree_gateway_customers USING btree (payment_method_id);


--
-- Name: index_spree_gateways_on_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gateways_on_active ON public.spree_gateways USING btree (active);


--
-- Name: index_spree_gateways_on_test_mode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gateways_on_test_mode ON public.spree_gateways USING btree (test_mode);


--
-- Name: index_spree_gift_card_batches_on_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_card_batches_on_created_by_id ON public.spree_gift_card_batches USING btree (created_by_id);


--
-- Name: index_spree_gift_card_batches_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_card_batches_on_store_id ON public.spree_gift_card_batches USING btree (store_id);


--
-- Name: index_spree_gift_cards_on_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_gift_cards_on_code ON public.spree_gift_cards USING btree (code);


--
-- Name: index_spree_gift_cards_on_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_cards_on_created_by_id ON public.spree_gift_cards USING btree (created_by_id);


--
-- Name: index_spree_gift_cards_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_cards_on_customer_id ON public.spree_gift_cards USING btree (customer_id);


--
-- Name: index_spree_gift_cards_on_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_cards_on_expires_at ON public.spree_gift_cards USING btree (expires_at);


--
-- Name: index_spree_gift_cards_on_gift_card_batch_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_cards_on_gift_card_batch_id ON public.spree_gift_cards USING btree (gift_card_batch_id);


--
-- Name: index_spree_gift_cards_on_redeemed_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_cards_on_redeemed_at ON public.spree_gift_cards USING btree (redeemed_at);


--
-- Name: index_spree_gift_cards_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_cards_on_status ON public.spree_gift_cards USING btree (status);


--
-- Name: index_spree_gift_cards_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_gift_cards_on_store_id ON public.spree_gift_cards USING btree (store_id);


--
-- Name: index_spree_import_mappings_on_file_column; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_import_mappings_on_file_column ON public.spree_import_mappings USING btree (file_column);


--
-- Name: index_spree_import_mappings_on_import_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_import_mappings_on_import_id ON public.spree_import_mappings USING btree (import_id);


--
-- Name: index_spree_import_mappings_on_import_id_and_schema_field; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_import_mappings_on_import_id_and_schema_field ON public.spree_import_mappings USING btree (import_id, schema_field);


--
-- Name: index_spree_import_rows_on_import_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_import_rows_on_import_id ON public.spree_import_rows USING btree (import_id);


--
-- Name: index_spree_import_rows_on_import_id_and_row_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_import_rows_on_import_id_and_row_number ON public.spree_import_rows USING btree (import_id, row_number);


--
-- Name: index_spree_import_rows_on_import_id_and_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_import_rows_on_import_id_and_status ON public.spree_import_rows USING btree (import_id, status);


--
-- Name: index_spree_import_rows_on_item; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_import_rows_on_item ON public.spree_import_rows USING btree (item_type, item_id);


--
-- Name: index_spree_import_rows_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_import_rows_on_status ON public.spree_import_rows USING btree (status);


--
-- Name: index_spree_imports_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_imports_on_number ON public.spree_imports USING btree (number);


--
-- Name: index_spree_imports_on_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_imports_on_owner ON public.spree_imports USING btree (owner_type, owner_id);


--
-- Name: index_spree_imports_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_imports_on_seller_id ON public.spree_imports USING btree (seller_id);


--
-- Name: index_spree_imports_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_imports_on_status ON public.spree_imports USING btree (status);


--
-- Name: index_spree_imports_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_imports_on_store_id ON public.spree_imports USING btree (store_id);


--
-- Name: index_spree_imports_on_store_id_and_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_imports_on_store_id_and_seller_id ON public.spree_imports USING btree (store_id, seller_id);


--
-- Name: index_spree_imports_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_imports_on_type ON public.spree_imports USING btree (type);


--
-- Name: index_spree_imports_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_imports_on_user_id ON public.spree_imports USING btree (user_id);


--
-- Name: index_spree_integrations_on_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_integrations_on_active ON public.spree_integrations USING btree (active);


--
-- Name: index_spree_integrations_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_integrations_on_store_id ON public.spree_integrations USING btree (store_id);


--
-- Name: index_spree_integrations_on_store_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_integrations_on_store_id_and_type ON public.spree_integrations USING btree (store_id, type);


--
-- Name: index_spree_integrations_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_integrations_on_type ON public.spree_integrations USING btree (type);


--
-- Name: index_spree_invitations_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_invitations_on_deleted_at ON public.spree_invitations USING btree (deleted_at);


--
-- Name: index_spree_invitations_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_invitations_on_email ON public.spree_invitations USING btree (email);


--
-- Name: index_spree_invitations_on_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_invitations_on_expires_at ON public.spree_invitations USING btree (expires_at);


--
-- Name: index_spree_invitations_on_invitee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_invitations_on_invitee ON public.spree_invitations USING btree (invitee_type, invitee_id);


--
-- Name: index_spree_invitations_on_inviter; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_invitations_on_inviter ON public.spree_invitations USING btree (inviter_type, inviter_id);


--
-- Name: index_spree_invitations_on_resource; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_invitations_on_resource ON public.spree_invitations USING btree (resource_type, resource_id);


--
-- Name: index_spree_invitations_on_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_invitations_on_role_id ON public.spree_invitations USING btree (role_id);


--
-- Name: index_spree_invitations_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_invitations_on_status ON public.spree_invitations USING btree (status);


--
-- Name: index_spree_invitations_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_invitations_on_token ON public.spree_invitations USING btree (token);


--
-- Name: index_spree_line_items_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_line_items_on_cart_id ON public.spree_line_items USING btree (cart_id);


--
-- Name: index_spree_line_items_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_line_items_on_order_id ON public.spree_line_items USING btree (order_id);


--
-- Name: index_spree_line_items_on_price_list_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_line_items_on_price_list_id ON public.spree_line_items USING btree (price_list_id);


--
-- Name: index_spree_line_items_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_line_items_on_seller_id ON public.spree_line_items USING btree (seller_id);


--
-- Name: index_spree_line_items_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_line_items_on_tax_category_id ON public.spree_line_items USING btree (tax_category_id);


--
-- Name: index_spree_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_line_items_on_variant_id ON public.spree_line_items USING btree (variant_id);


--
-- Name: index_spree_log_entries_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_log_entries_on_source_id_and_source_type ON public.spree_log_entries USING btree (source_id, source_type);


--
-- Name: index_spree_market_countries_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_market_countries_on_country_id ON public.spree_market_countries USING btree (country_id);


--
-- Name: index_spree_market_countries_on_market_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_market_countries_on_market_id ON public.spree_market_countries USING btree (market_id);


--
-- Name: index_spree_market_countries_on_market_id_and_country_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_market_countries_on_market_id_and_country_code ON public.spree_market_countries USING btree (market_id, country_code);


--
-- Name: index_spree_market_countries_on_market_id_and_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_market_countries_on_market_id_and_country_id ON public.spree_market_countries USING btree (market_id, country_id);


--
-- Name: index_spree_markets_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_markets_on_deleted_at ON public.spree_markets USING btree (deleted_at);


--
-- Name: index_spree_markets_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_markets_on_store_id ON public.spree_markets USING btree (store_id);


--
-- Name: index_spree_markets_on_store_id_and_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_markets_on_store_id_and_default ON public.spree_markets USING btree (store_id, "default") WHERE (deleted_at IS NULL);


--
-- Name: index_spree_markets_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_markets_on_store_id_and_name ON public.spree_markets USING btree (store_id, name) WHERE (deleted_at IS NULL);


--
-- Name: index_spree_markets_on_store_id_and_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_markets_on_store_id_and_position ON public.spree_markets USING btree (store_id, "position");


--
-- Name: index_spree_media_on_media_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_media_on_media_type ON public.spree_media USING btree (media_type);


--
-- Name: index_spree_media_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_media_on_position ON public.spree_media USING btree ("position");


--
-- Name: index_spree_media_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_media_on_store_id ON public.spree_media USING btree (store_id);


--
-- Name: index_spree_metafields_on_resource; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_metafields_on_resource ON public.spree_custom_fields USING btree (resource_type, resource_id);


--
-- Name: index_spree_newsletter_subscribers_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_newsletter_subscribers_on_customer_id ON public.spree_newsletter_subscribers USING btree (customer_id);


--
-- Name: index_spree_newsletter_subscribers_on_email_and_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_newsletter_subscribers_on_email_and_store_id ON public.spree_newsletter_subscribers USING btree (email, store_id);


--
-- Name: index_spree_newsletter_subscribers_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_newsletter_subscribers_on_store_id ON public.spree_newsletter_subscribers USING btree (store_id);


--
-- Name: index_spree_newsletter_subscribers_on_verification_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_newsletter_subscribers_on_verification_token ON public.spree_newsletter_subscribers USING btree (verification_token);


--
-- Name: index_spree_newsletter_subscribers_on_verified_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_newsletter_subscribers_on_verified_at ON public.spree_newsletter_subscribers USING btree (verified_at);


--
-- Name: index_spree_number_sequences_on_store_and_resource; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_number_sequences_on_store_and_resource ON public.spree_number_sequences USING btree (store_id, resource_type);


--
-- Name: index_spree_number_sequences_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_number_sequences_on_store_id ON public.spree_number_sequences USING btree (store_id);


--
-- Name: index_spree_option_type_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_type_translations_on_locale ON public.spree_option_type_translations USING btree (locale);


--
-- Name: index_spree_option_types_on_filterable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_types_on_filterable ON public.spree_option_types USING btree (filterable);


--
-- Name: index_spree_option_types_on_kind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_types_on_kind ON public.spree_option_types USING btree (kind);


--
-- Name: index_spree_option_types_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_types_on_position ON public.spree_option_types USING btree ("position");


--
-- Name: index_spree_option_types_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_types_on_store_id ON public.spree_option_types USING btree (store_id);


--
-- Name: index_spree_option_types_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_option_types_on_store_id_and_name ON public.spree_option_types USING btree (store_id, name);


--
-- Name: index_spree_option_value_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_value_translations_on_locale ON public.spree_option_value_translations USING btree (locale);


--
-- Name: index_spree_option_value_variants_on_option_value_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_value_variants_on_option_value_id ON public.spree_option_value_variants USING btree (option_value_id);


--
-- Name: index_spree_option_value_variants_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_value_variants_on_variant_id ON public.spree_option_value_variants USING btree (variant_id);


--
-- Name: index_spree_option_values_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_values_on_name ON public.spree_option_values USING btree (name);


--
-- Name: index_spree_option_values_on_option_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_values_on_option_type_id ON public.spree_option_values USING btree (option_type_id);


--
-- Name: index_spree_option_values_on_option_type_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_option_values_on_option_type_id_and_name ON public.spree_option_values USING btree (option_type_id, name);


--
-- Name: index_spree_option_values_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_option_values_on_position ON public.spree_option_values USING btree ("position");


--
-- Name: index_spree_order_cancellation_reasons_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_cancellation_reasons_on_store_id ON public.spree_order_cancellation_reasons USING btree (store_id);


--
-- Name: index_spree_order_groups_on_bill_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_groups_on_bill_address_id ON public.spree_order_groups USING btree (bill_address_id);


--
-- Name: index_spree_order_groups_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_order_groups_on_cart_id ON public.spree_order_groups USING btree (cart_id);


--
-- Name: index_spree_order_groups_on_confirmation_delivered; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_groups_on_confirmation_delivered ON public.spree_order_groups USING btree (confirmation_delivered);


--
-- Name: index_spree_order_groups_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_groups_on_customer_id ON public.spree_order_groups USING btree (customer_id);


--
-- Name: index_spree_order_groups_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_order_groups_on_number ON public.spree_order_groups USING btree (number);


--
-- Name: index_spree_order_groups_on_ship_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_groups_on_ship_address_id ON public.spree_order_groups USING btree (ship_address_id);


--
-- Name: index_spree_order_groups_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_groups_on_store_id ON public.spree_order_groups USING btree (store_id);


--
-- Name: index_spree_order_groups_on_store_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_groups_on_store_id_and_created_at ON public.spree_order_groups USING btree (store_id, created_at);


--
-- Name: index_spree_order_groups_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_groups_on_token ON public.spree_order_groups USING btree (token);


--
-- Name: index_spree_order_promotions_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_promotions_on_cart_id ON public.spree_order_promotions USING btree (cart_id);


--
-- Name: index_spree_order_promotions_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_promotions_on_order_id ON public.spree_order_promotions USING btree (order_id);


--
-- Name: index_spree_order_promotions_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_promotions_on_promotion_id ON public.spree_order_promotions USING btree (promotion_id);


--
-- Name: index_spree_order_promotions_on_promotion_id_and_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_order_promotions_on_promotion_id_and_order_id ON public.spree_order_promotions USING btree (promotion_id, order_id);


--
-- Name: index_spree_order_routing_rules_on_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_routing_rules_on_channel_id ON public.spree_order_routing_rules USING btree (channel_id);


--
-- Name: index_spree_order_routing_rules_on_channel_id_and_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_routing_rules_on_channel_id_and_position ON public.spree_order_routing_rules USING btree (channel_id, "position");


--
-- Name: index_spree_order_routing_rules_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_routing_rules_on_store_id ON public.spree_order_routing_rules USING btree (store_id);


--
-- Name: index_spree_order_routing_rules_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_order_routing_rules_on_type ON public.spree_order_routing_rules USING btree (type);


--
-- Name: index_spree_orders_on_approver_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_approver_actor ON public.spree_orders USING btree (approver_type, approver_id);


--
-- Name: index_spree_orders_on_approver_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_approver_id ON public.spree_orders USING btree (approver_id);


--
-- Name: index_spree_orders_on_bill_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_bill_address_id ON public.spree_orders USING btree (bill_address_id);


--
-- Name: index_spree_orders_on_cancel_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_cancel_reason_id ON public.spree_orders USING btree (cancel_reason_id);


--
-- Name: index_spree_orders_on_canceler_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_canceler_actor ON public.spree_orders USING btree (canceler_type, canceler_id);


--
-- Name: index_spree_orders_on_canceler_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_canceler_id ON public.spree_orders USING btree (canceler_id);


--
-- Name: index_spree_orders_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_orders_on_cart_id ON public.spree_orders USING btree (cart_id);


--
-- Name: index_spree_orders_on_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_channel_id ON public.spree_orders USING btree (channel_id);


--
-- Name: index_spree_orders_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_company_id ON public.spree_orders USING btree (company_id);


--
-- Name: index_spree_orders_on_completed_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_completed_at ON public.spree_orders USING btree (completed_at);


--
-- Name: index_spree_orders_on_confirmation_delivered; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_confirmation_delivered ON public.spree_orders USING btree (confirmation_delivered);


--
-- Name: index_spree_orders_on_considered_risky; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_considered_risky ON public.spree_orders USING btree (considered_risky);


--
-- Name: index_spree_orders_on_coupon_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_coupon_code ON public.spree_orders USING btree (coupon_code);


--
-- Name: index_spree_orders_on_created_by_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_created_by_actor ON public.spree_orders USING btree (created_by_type, created_by_id);


--
-- Name: index_spree_orders_on_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_created_by_id ON public.spree_orders USING btree (created_by_id);


--
-- Name: index_spree_orders_on_customer_id_and_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_customer_id_and_created_by_id ON public.spree_orders USING btree (customer_id, created_by_id);


--
-- Name: index_spree_orders_on_fulfillment_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_fulfillment_status ON public.spree_orders USING btree (fulfillment_status);


--
-- Name: index_spree_orders_on_gift_card_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_gift_card_id ON public.spree_orders USING btree (gift_card_id);


--
-- Name: index_spree_orders_on_market_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_market_id ON public.spree_orders USING btree (market_id);


--
-- Name: index_spree_orders_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_orders_on_number ON public.spree_orders USING btree (number);


--
-- Name: index_spree_orders_on_order_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_order_group_id ON public.spree_orders USING btree (order_group_id);


--
-- Name: index_spree_orders_on_payment_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_payment_status ON public.spree_orders USING btree (payment_status);


--
-- Name: index_spree_orders_on_po_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_po_number ON public.spree_orders USING btree (po_number);


--
-- Name: index_spree_orders_on_preferred_stock_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_preferred_stock_location_id ON public.spree_orders USING btree (preferred_stock_location_id);


--
-- Name: index_spree_orders_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_seller_id ON public.spree_orders USING btree (seller_id);


--
-- Name: index_spree_orders_on_ship_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_ship_address_id ON public.spree_orders USING btree (ship_address_id);


--
-- Name: index_spree_orders_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_status ON public.spree_orders USING btree (status);


--
-- Name: index_spree_orders_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_store_id ON public.spree_orders USING btree (store_id);


--
-- Name: index_spree_orders_on_store_id_and_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_store_id_and_email ON public.spree_orders USING btree (store_id, email);


--
-- Name: index_spree_orders_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_orders_on_token ON public.spree_orders USING btree (token);


--
-- Name: index_spree_package_types_marketplace_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_package_types_marketplace_default ON public.spree_package_types USING btree (store_id) WHERE (("default" = true) AND (seller_id IS NULL));


--
-- Name: index_spree_package_types_marketplace_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_package_types_marketplace_name ON public.spree_package_types USING btree (store_id, name) WHERE (seller_id IS NULL);


--
-- Name: index_spree_package_types_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_package_types_on_seller_id ON public.spree_package_types USING btree (seller_id);


--
-- Name: index_spree_package_types_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_package_types_on_store_id ON public.spree_package_types USING btree (store_id);


--
-- Name: index_spree_package_types_seller_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_package_types_seller_default ON public.spree_package_types USING btree (store_id, seller_id) WHERE (("default" = true) AND (seller_id IS NOT NULL));


--
-- Name: index_spree_package_types_seller_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_package_types_seller_name ON public.spree_package_types USING btree (store_id, seller_id, name) WHERE (seller_id IS NOT NULL);


--
-- Name: index_spree_payment_capture_events_on_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_capture_events_on_payment_id ON public.spree_payment_capture_events USING btree (payment_id);


--
-- Name: index_spree_payment_methods_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_methods_on_id_and_type ON public.spree_payment_methods USING btree (id, type);


--
-- Name: index_spree_payment_methods_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_methods_on_store_id ON public.spree_payment_methods USING btree (store_id);


--
-- Name: index_spree_payment_methods_stores_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_methods_stores_on_payment_method_id ON public.spree_payment_methods_stores USING btree (payment_method_id);


--
-- Name: index_spree_payment_methods_stores_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_methods_stores_on_store_id ON public.spree_payment_methods_stores USING btree (store_id);


--
-- Name: index_spree_payment_sessions_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_cart_id ON public.spree_payment_sessions USING btree (cart_id);


--
-- Name: index_spree_payment_sessions_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_customer_id ON public.spree_payment_sessions USING btree (customer_id);


--
-- Name: index_spree_payment_sessions_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_deleted_at ON public.spree_payment_sessions USING btree (deleted_at);


--
-- Name: index_spree_payment_sessions_on_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_expires_at ON public.spree_payment_sessions USING btree (expires_at);


--
-- Name: index_spree_payment_sessions_on_external_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_external_id ON public.spree_payment_sessions USING btree (external_id);


--
-- Name: index_spree_payment_sessions_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_order_id ON public.spree_payment_sessions USING btree (order_id);


--
-- Name: index_spree_payment_sessions_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_payment_method_id ON public.spree_payment_sessions USING btree (payment_method_id);


--
-- Name: index_spree_payment_sessions_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_status ON public.spree_payment_sessions USING btree (status);


--
-- Name: index_spree_payment_sessions_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sessions_on_type ON public.spree_payment_sessions USING btree (type);


--
-- Name: index_spree_payment_setup_sessions_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_setup_sessions_on_customer_id ON public.spree_payment_setup_sessions USING btree (customer_id);


--
-- Name: index_spree_payment_setup_sessions_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_setup_sessions_on_deleted_at ON public.spree_payment_setup_sessions USING btree (deleted_at);


--
-- Name: index_spree_payment_setup_sessions_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_setup_sessions_on_payment_method_id ON public.spree_payment_setup_sessions USING btree (payment_method_id);


--
-- Name: index_spree_payment_setup_sessions_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_setup_sessions_on_status ON public.spree_payment_setup_sessions USING btree (status);


--
-- Name: index_spree_payment_setup_sessions_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_setup_sessions_on_type ON public.spree_payment_setup_sessions USING btree (type);


--
-- Name: index_spree_payment_sources_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sources_on_customer_id ON public.spree_payment_sources USING btree (customer_id);


--
-- Name: index_spree_payment_sources_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sources_on_payment_method_id ON public.spree_payment_sources USING btree (payment_method_id);


--
-- Name: index_spree_payment_sources_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_sources_on_type ON public.spree_payment_sources USING btree (type);


--
-- Name: index_spree_payment_splits_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payment_splits_on_order_id ON public.spree_payment_splits USING btree (order_id);


--
-- Name: index_spree_payment_splits_on_payment_id_and_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_payment_splits_on_payment_id_and_order_id ON public.spree_payment_splits USING btree (payment_id, order_id);


--
-- Name: index_spree_payments_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payments_on_cart_id ON public.spree_payments USING btree (cart_id);


--
-- Name: index_spree_payments_on_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payments_on_created_at ON public.spree_payments USING btree (created_at);


--
-- Name: index_spree_payments_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_payments_on_number ON public.spree_payments USING btree (number);


--
-- Name: index_spree_payments_on_order_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payments_on_order_group_id ON public.spree_payments USING btree (order_group_id);


--
-- Name: index_spree_payments_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payments_on_order_id ON public.spree_payments USING btree (order_id);


--
-- Name: index_spree_payments_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payments_on_payment_method_id ON public.spree_payments USING btree (payment_method_id);


--
-- Name: index_spree_payments_on_source_id_and_source_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_payments_on_source_id_and_source_type ON public.spree_payments USING btree (source_id, source_type);


--
-- Name: index_spree_paypal_checkout_orders_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_paypal_checkout_orders_on_order_id ON public.spree_paypal_checkout_orders USING btree (order_id);


--
-- Name: index_spree_paypal_checkout_orders_on_order_id_and_paypal_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_paypal_checkout_orders_on_order_id_and_paypal_id ON public.spree_paypal_checkout_orders USING btree (order_id, paypal_id);


--
-- Name: index_spree_paypal_checkout_orders_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_paypal_checkout_orders_on_payment_method_id ON public.spree_paypal_checkout_orders USING btree (payment_method_id);


--
-- Name: index_spree_policies_on_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_policies_on_owner ON public.spree_policies USING btree (owner_type, owner_id);


--
-- Name: index_spree_policies_on_owner_id_and_owner_type_and_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_policies_on_owner_id_and_owner_type_and_slug ON public.spree_policies USING btree (owner_id, owner_type, slug);


--
-- Name: index_spree_policy_translations_on_spree_policy_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_policy_translations_on_spree_policy_id ON public.spree_policy_translations USING btree (spree_policy_id);


--
-- Name: index_spree_policy_translations_on_spree_policy_id_and_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_policy_translations_on_spree_policy_id_and_locale ON public.spree_policy_translations USING btree (spree_policy_id, locale);


--
-- Name: index_spree_preferences_on_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_preferences_on_key ON public.spree_preferences USING btree (key);


--
-- Name: index_spree_price_adjustment_tiers_on_list_and_quantity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_price_adjustment_tiers_on_list_and_quantity ON public.spree_price_adjustment_tiers USING btree (price_list_id, min_quantity);


--
-- Name: index_spree_price_lists_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_price_lists_on_deleted_at ON public.spree_price_lists USING btree (deleted_at);


--
-- Name: index_spree_price_lists_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_price_lists_on_position ON public.spree_price_lists USING btree ("position");


--
-- Name: index_spree_price_lists_on_starts_at_and_ends_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_price_lists_on_starts_at_and_ends_at ON public.spree_price_lists USING btree (starts_at, ends_at);


--
-- Name: index_spree_price_lists_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_price_lists_on_status ON public.spree_price_lists USING btree (status);


--
-- Name: index_spree_price_lists_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_price_lists_on_store_id ON public.spree_price_lists USING btree (store_id);


--
-- Name: index_spree_price_lists_on_store_id_and_status_and_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_price_lists_on_store_id_and_status_and_position ON public.spree_price_lists USING btree (store_id, status, "position");


--
-- Name: index_spree_price_lists_one_per_catalog; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_price_lists_one_per_catalog ON public.spree_price_lists USING btree (catalog_id) WHERE ((catalog_id IS NOT NULL) AND (deleted_at IS NULL));


--
-- Name: index_spree_price_rules_on_price_list_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_price_rules_on_price_list_id ON public.spree_price_rules USING btree (price_list_id);


--
-- Name: index_spree_price_rules_on_price_list_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_price_rules_on_price_list_id_and_type ON public.spree_price_rules USING btree (price_list_id, type);


--
-- Name: index_spree_price_rules_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_price_rules_on_type ON public.spree_price_rules USING btree (type);


--
-- Name: index_spree_prices_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_prices_on_deleted_at ON public.spree_prices USING btree (deleted_at);


--
-- Name: index_spree_prices_on_price_list_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_prices_on_price_list_id ON public.spree_prices USING btree (price_list_id);


--
-- Name: index_spree_prices_on_variant_currency_list_quantity; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_prices_on_variant_currency_list_quantity ON public.spree_prices USING btree (variant_id, currency, price_list_id, min_quantity) WHERE ((price_list_id IS NOT NULL) AND (deleted_at IS NULL) AND (amount IS NOT NULL));


--
-- Name: index_spree_prices_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_prices_on_variant_id ON public.spree_prices USING btree (variant_id);


--
-- Name: index_spree_prices_on_variant_id_and_currency; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_prices_on_variant_id_and_currency ON public.spree_prices USING btree (variant_id, currency) WHERE ((price_list_id IS NULL) AND (deleted_at IS NULL) AND (amount IS NOT NULL));


--
-- Name: index_spree_product_categories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_categories_on_category_id ON public.spree_product_categories USING btree (category_id);


--
-- Name: index_spree_product_categories_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_categories_on_position ON public.spree_product_categories USING btree ("position");


--
-- Name: index_spree_product_categories_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_categories_on_product_id ON public.spree_product_categories USING btree (product_id);


--
-- Name: index_spree_product_categories_on_product_id_and_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_product_categories_on_product_id_and_category_id ON public.spree_product_categories USING btree (product_id, category_id);


--
-- Name: index_spree_product_collections_on_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_collections_on_collection_id ON public.spree_product_collections USING btree (collection_id);


--
-- Name: index_spree_product_collections_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_collections_on_product_id ON public.spree_product_collections USING btree (product_id);


--
-- Name: index_spree_product_option_types_on_option_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_option_types_on_option_type_id ON public.spree_product_option_types USING btree (option_type_id);


--
-- Name: index_spree_product_option_types_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_option_types_on_position ON public.spree_product_option_types USING btree ("position");


--
-- Name: index_spree_product_option_types_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_option_types_on_product_id ON public.spree_product_option_types USING btree (product_id);


--
-- Name: index_spree_product_publications_on_channel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_publications_on_channel_id ON public.spree_product_publications USING btree (channel_id);


--
-- Name: index_spree_product_publications_on_product_and_channel; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_product_publications_on_product_and_channel ON public.spree_product_publications USING btree (product_id, channel_id);


--
-- Name: index_spree_product_publications_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_publications_on_product_id ON public.spree_product_publications USING btree (product_id);


--
-- Name: index_spree_product_submissions_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_submissions_on_product_id ON public.spree_product_submissions USING btree (product_id);


--
-- Name: index_spree_product_submissions_on_product_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_submissions_on_product_id_and_created_at ON public.spree_product_submissions USING btree (product_id, created_at);


--
-- Name: index_spree_product_submissions_on_reviewed_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_submissions_on_reviewed_by_id ON public.spree_product_submissions USING btree (reviewed_by_id);


--
-- Name: index_spree_product_submissions_on_submitted_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_submissions_on_submitted_by_id ON public.spree_product_submissions USING btree (submitted_by_id);


--
-- Name: index_spree_product_translations_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_translations_on_deleted_at ON public.spree_product_translations USING btree (deleted_at);


--
-- Name: index_spree_product_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_translations_on_locale ON public.spree_product_translations USING btree (locale);


--
-- Name: index_spree_product_type_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_type_translations_on_locale ON public.spree_product_type_translations USING btree (locale);


--
-- Name: index_spree_product_types_on_delivery_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_types_on_delivery_profile_id ON public.spree_product_types USING btree (delivery_profile_id);


--
-- Name: index_spree_product_types_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_product_types_on_store_id ON public.spree_product_types USING btree (store_id);


--
-- Name: index_spree_products_on_available_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_available_on ON public.spree_products USING btree (available_on);


--
-- Name: index_spree_products_on_categories_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_categories_count ON public.spree_products USING btree (categories_count);


--
-- Name: index_spree_products_on_default_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_default_variant_id ON public.spree_products USING btree (default_variant_id);


--
-- Name: index_spree_products_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_deleted_at ON public.spree_products USING btree (deleted_at);


--
-- Name: index_spree_products_on_delivery_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_delivery_profile_id ON public.spree_products USING btree (delivery_profile_id);


--
-- Name: index_spree_products_on_discontinue_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_discontinue_on ON public.spree_products USING btree (discontinue_on);


--
-- Name: index_spree_products_on_make_active_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_make_active_at ON public.spree_products USING btree (make_active_at);


--
-- Name: index_spree_products_on_media_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_media_count ON public.spree_products USING btree (media_count);


--
-- Name: index_spree_products_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_name ON public.spree_products USING btree (name);


--
-- Name: index_spree_products_on_primary_media_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_primary_media_id ON public.spree_products USING btree (primary_media_id);


--
-- Name: index_spree_products_on_product_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_product_type_id ON public.spree_products USING btree (product_type_id);


--
-- Name: index_spree_products_on_promotionable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_promotionable ON public.spree_products USING btree (promotionable);


--
-- Name: index_spree_products_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_seller_id ON public.spree_products USING btree (seller_id);


--
-- Name: index_spree_products_on_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_products_on_slug ON public.spree_products USING btree (slug);


--
-- Name: index_spree_products_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_status ON public.spree_products USING btree (status);


--
-- Name: index_spree_products_on_status_and_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_status_and_deleted_at ON public.spree_products USING btree (status, deleted_at);


--
-- Name: index_spree_products_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_store_id ON public.spree_products USING btree (store_id);


--
-- Name: index_spree_products_on_store_id_and_units_sold_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_store_id_and_units_sold_count ON public.spree_products USING btree (store_id, units_sold_count);


--
-- Name: index_spree_products_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_tax_category_id ON public.spree_products USING btree (tax_category_id);


--
-- Name: index_spree_products_on_variant_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_on_variant_count ON public.spree_products USING btree (variant_count);


--
-- Name: index_spree_products_stores_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_stores_on_product_id ON public.spree_products_stores USING btree (product_id);


--
-- Name: index_spree_products_stores_on_product_id_and_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_products_stores_on_product_id_and_store_id ON public.spree_products_stores USING btree (product_id, store_id);


--
-- Name: index_spree_products_stores_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_products_stores_on_store_id ON public.spree_products_stores USING btree (store_id);


--
-- Name: index_spree_promotion_action_line_items_on_promotion_action_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotion_action_line_items_on_promotion_action_id ON public.spree_promotion_action_line_items USING btree (promotion_action_id);


--
-- Name: index_spree_promotion_action_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotion_action_line_items_on_variant_id ON public.spree_promotion_action_line_items USING btree (variant_id);


--
-- Name: index_spree_promotion_actions_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotion_actions_on_deleted_at ON public.spree_promotion_actions USING btree (deleted_at);


--
-- Name: index_spree_promotion_actions_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotion_actions_on_id_and_type ON public.spree_promotion_actions USING btree (id, type);


--
-- Name: index_spree_promotion_actions_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotion_actions_on_promotion_id ON public.spree_promotion_actions USING btree (promotion_id);


--
-- Name: index_spree_promotion_rule_categories_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotion_rule_categories_on_category_id ON public.spree_promotion_rule_categories USING btree (category_id);


--
-- Name: index_spree_promotion_rule_categories_on_promotion_rule_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotion_rule_categories_on_promotion_rule_id ON public.spree_promotion_rule_categories USING btree (promotion_rule_id);


--
-- Name: index_spree_promotion_rules_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotion_rules_on_promotion_id ON public.spree_promotion_rules USING btree (promotion_id);


--
-- Name: index_spree_promotion_rules_on_promotion_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_promotion_rules_on_promotion_id_and_type ON public.spree_promotion_rules USING btree (promotion_id, type);


--
-- Name: index_spree_promotions_on_advertise; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_advertise ON public.spree_promotions USING btree (advertise);


--
-- Name: index_spree_promotions_on_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_code ON public.spree_promotions USING btree (code);


--
-- Name: index_spree_promotions_on_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_expires_at ON public.spree_promotions USING btree (expires_at);


--
-- Name: index_spree_promotions_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_id_and_type ON public.spree_promotions USING btree (id, type);


--
-- Name: index_spree_promotions_on_kind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_kind ON public.spree_promotions USING btree (kind);


--
-- Name: index_spree_promotions_on_path; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_path ON public.spree_promotions USING btree (path);


--
-- Name: index_spree_promotions_on_promotion_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_promotion_category_id ON public.spree_promotions USING btree (promotion_category_id);


--
-- Name: index_spree_promotions_on_starts_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_starts_at ON public.spree_promotions USING btree (starts_at);


--
-- Name: index_spree_promotions_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_on_store_id ON public.spree_promotions USING btree (store_id);


--
-- Name: index_spree_promotions_stores_on_promotion_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_stores_on_promotion_id ON public.spree_promotions_stores USING btree (promotion_id);


--
-- Name: index_spree_promotions_stores_on_promotion_id_and_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_promotions_stores_on_promotion_id_and_store_id ON public.spree_promotions_stores USING btree (promotion_id, store_id);


--
-- Name: index_spree_promotions_stores_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_promotions_stores_on_store_id ON public.spree_promotions_stores USING btree (store_id);


--
-- Name: index_spree_purchase_order_items_on_purchase_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_purchase_order_items_on_purchase_order_id ON public.spree_purchase_order_items USING btree (purchase_order_id);


--
-- Name: index_spree_purchase_order_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_purchase_order_items_on_variant_id ON public.spree_purchase_order_items USING btree (variant_id);


--
-- Name: index_spree_purchase_orders_on_destination_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_purchase_orders_on_destination_location_id ON public.spree_purchase_orders USING btree (destination_location_id);


--
-- Name: index_spree_purchase_orders_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_purchase_orders_on_number ON public.spree_purchase_orders USING btree (number);


--
-- Name: index_spree_purchase_orders_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_purchase_orders_on_status ON public.spree_purchase_orders USING btree (status);


--
-- Name: index_spree_purchase_orders_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_purchase_orders_on_store_id ON public.spree_purchase_orders USING btree (store_id);


--
-- Name: index_spree_purchase_orders_on_supplier_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_purchase_orders_on_supplier_id ON public.spree_purchase_orders USING btree (supplier_id);


--
-- Name: index_spree_refresh_tokens_on_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refresh_tokens_on_expires_at ON public.spree_refresh_tokens USING btree (expires_at);


--
-- Name: index_spree_refresh_tokens_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_refresh_tokens_on_token ON public.spree_refresh_tokens USING btree (token);


--
-- Name: index_spree_refresh_tokens_on_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refresh_tokens_on_user ON public.spree_refresh_tokens USING btree (user_type, user_id);


--
-- Name: index_spree_refund_reasons_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refund_reasons_on_store_id ON public.spree_refund_reasons USING btree (store_id);


--
-- Name: index_spree_refund_reasons_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_refund_reasons_on_store_id_and_name ON public.spree_refund_reasons USING btree (store_id, name);


--
-- Name: index_spree_refunds_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refunds_on_order_id ON public.spree_refunds USING btree (order_id);


--
-- Name: index_spree_refunds_on_originator; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refunds_on_originator ON public.spree_refunds USING btree (originator_type, originator_id);


--
-- Name: index_spree_refunds_on_payment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refunds_on_payment_id ON public.spree_refunds USING btree (payment_id);


--
-- Name: index_spree_refunds_on_refunder_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refunds_on_refunder_actor ON public.spree_refunds USING btree (refunder_type, refunder_id);


--
-- Name: index_spree_refunds_on_refunder_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refunds_on_refunder_id ON public.spree_refunds USING btree (refunder_id);


--
-- Name: index_spree_refunds_on_reimbursement_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_refunds_on_reimbursement_id ON public.spree_refunds USING btree (reimbursement_id);


--
-- Name: index_spree_reimbursement_credits_on_reimbursement_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_reimbursement_credits_on_reimbursement_id ON public.spree_reimbursement_credits USING btree (reimbursement_id);


--
-- Name: index_spree_reimbursement_types_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_reimbursement_types_on_name ON public.spree_reimbursement_types USING btree (name);


--
-- Name: index_spree_reimbursement_types_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_reimbursement_types_on_type ON public.spree_reimbursement_types USING btree (type);


--
-- Name: index_spree_reimbursements_on_customer_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_reimbursements_on_customer_return_id ON public.spree_reimbursements USING btree (customer_return_id);


--
-- Name: index_spree_reimbursements_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_reimbursements_on_number ON public.spree_reimbursements USING btree (number);


--
-- Name: index_spree_reimbursements_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_reimbursements_on_order_id ON public.spree_reimbursements USING btree (order_id);


--
-- Name: index_spree_reimbursements_on_performed_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_reimbursements_on_performed_by_id ON public.spree_reimbursements USING btree (performed_by_id);


--
-- Name: index_spree_reports_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_reports_on_store_id ON public.spree_reports USING btree (store_id);


--
-- Name: index_spree_reports_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_reports_on_user_id ON public.spree_reports USING btree (user_id);


--
-- Name: index_spree_return_authorizations_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_return_authorizations_on_number ON public.spree_return_authorizations USING btree (number);


--
-- Name: index_spree_return_authorizations_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_authorizations_on_order_id ON public.spree_return_authorizations USING btree (order_id);


--
-- Name: index_spree_return_authorizations_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_authorizations_on_stock_location_id ON public.spree_return_authorizations USING btree (stock_location_id);


--
-- Name: index_spree_return_items_on_exchange_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_items_on_exchange_variant_id ON public.spree_return_items USING btree (exchange_variant_id);


--
-- Name: index_spree_return_items_on_fulfillment_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_items_on_fulfillment_item_id ON public.spree_return_items USING btree (fulfillment_item_id);


--
-- Name: index_spree_return_items_on_override_reimbursement_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_items_on_override_reimbursement_type_id ON public.spree_return_items USING btree (override_reimbursement_type_id);


--
-- Name: index_spree_return_items_on_preferred_reimbursement_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_items_on_preferred_reimbursement_type_id ON public.spree_return_items USING btree (preferred_reimbursement_type_id);


--
-- Name: index_spree_return_items_on_reimbursement_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_items_on_reimbursement_id ON public.spree_return_items USING btree (reimbursement_id);


--
-- Name: index_spree_return_items_on_return_authorization_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_items_on_return_authorization_id ON public.spree_return_items USING btree (return_authorization_id);


--
-- Name: index_spree_return_line_items_on_fulfillment_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_line_items_on_fulfillment_item_id ON public.spree_return_line_items USING btree (fulfillment_item_id);


--
-- Name: index_spree_return_line_items_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_line_items_on_line_item_id ON public.spree_return_line_items USING btree (line_item_id);


--
-- Name: index_spree_return_line_items_on_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_line_items_on_return_id ON public.spree_return_line_items USING btree (return_id);


--
-- Name: index_spree_return_line_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_line_items_on_variant_id ON public.spree_return_line_items USING btree (variant_id);


--
-- Name: index_spree_return_reasons_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_return_reasons_on_store_id ON public.spree_return_reasons USING btree (store_id);


--
-- Name: index_spree_return_reasons_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_return_reasons_on_store_id_and_name ON public.spree_return_reasons USING btree (store_id, name);


--
-- Name: index_spree_returns_on_created_by_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_returns_on_created_by_actor ON public.spree_returns USING btree (created_by_type, created_by_id);


--
-- Name: index_spree_returns_on_created_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_returns_on_created_by_id ON public.spree_returns USING btree (created_by_id);


--
-- Name: index_spree_returns_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_returns_on_number ON public.spree_returns USING btree (number);


--
-- Name: index_spree_returns_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_returns_on_order_id ON public.spree_returns USING btree (order_id);


--
-- Name: index_spree_returns_on_reason_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_returns_on_reason_id ON public.spree_returns USING btree (reason_id);


--
-- Name: index_spree_returns_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_returns_on_status ON public.spree_returns USING btree (status);


--
-- Name: index_spree_returns_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_returns_on_stock_location_id ON public.spree_returns USING btree (stock_location_id);


--
-- Name: index_spree_returns_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_returns_on_store_id ON public.spree_returns USING btree (store_id);


--
-- Name: index_spree_role_users_on_invitation_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_role_users_on_invitation_id ON public.spree_role_users USING btree (invitation_id);


--
-- Name: index_spree_role_users_on_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_role_users_on_role_id ON public.spree_role_users USING btree (role_id);


--
-- Name: index_spree_role_users_on_user_and_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_role_users_on_user_and_role ON public.spree_role_users USING btree (user_type, user_id, role_id);


--
-- Name: index_spree_role_users_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_role_users_on_user_id ON public.spree_role_users USING btree (user_id);


--
-- Name: index_spree_role_users_on_user_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_role_users_on_user_type ON public.spree_role_users USING btree (user_type);


--
-- Name: index_spree_roles_on_resource_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_roles_on_resource_and_name ON public.spree_roles USING btree (resource_type, resource_id, name);


--
-- Name: index_spree_saved_reports_on_store_and_lower_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_saved_reports_on_store_and_lower_name ON public.spree_saved_reports USING btree (store_id, lower((name)::text));


--
-- Name: index_spree_saved_reports_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_saved_reports_on_user_id ON public.spree_saved_reports USING btree (user_id);


--
-- Name: index_spree_seller_payouts_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_payouts_on_seller_id ON public.spree_seller_payouts USING btree (seller_id);


--
-- Name: index_spree_seller_payouts_on_seller_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_payouts_on_seller_id_and_created_at ON public.spree_seller_payouts USING btree (seller_id, created_at);


--
-- Name: index_spree_seller_payouts_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_payouts_on_store_id ON public.spree_seller_payouts USING btree (store_id);


--
-- Name: index_spree_seller_requirement_submissions_on_reviewed_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_requirement_submissions_on_reviewed_by_id ON public.spree_seller_requirement_submissions USING btree (reviewed_by_id);


--
-- Name: index_spree_seller_requirement_submissions_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_requirement_submissions_on_seller_id ON public.spree_seller_requirement_submissions USING btree (seller_id);


--
-- Name: index_spree_seller_requirement_submissions_on_submitted_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_requirement_submissions_on_submitted_by_id ON public.spree_seller_requirement_submissions USING btree (submitted_by_id);


--
-- Name: index_spree_seller_requirements_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_requirements_on_store_id ON public.spree_seller_requirements USING btree (store_id);


--
-- Name: index_spree_seller_requirements_on_store_id_and_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_requirements_on_store_id_and_position ON public.spree_seller_requirements USING btree (store_id, "position");


--
-- Name: index_spree_seller_requirements_on_store_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_requirements_on_store_id_and_type ON public.spree_seller_requirements USING btree (store_id, type);


--
-- Name: index_spree_seller_transfers_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_transfers_on_order_id ON public.spree_seller_transfers USING btree (order_id);


--
-- Name: index_spree_seller_transfers_on_payout_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_transfers_on_payout_id ON public.spree_seller_transfers USING btree (payout_id);


--
-- Name: index_spree_seller_transfers_on_reversed_from_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_transfers_on_reversed_from_id ON public.spree_seller_transfers USING btree (reversed_from_id);


--
-- Name: index_spree_seller_transfers_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_transfers_on_seller_id ON public.spree_seller_transfers USING btree (seller_id);


--
-- Name: index_spree_seller_transfers_on_seller_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_transfers_on_seller_id_and_created_at ON public.spree_seller_transfers USING btree (seller_id, created_at);


--
-- Name: index_spree_seller_transfers_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_transfers_on_store_id ON public.spree_seller_transfers USING btree (store_id);


--
-- Name: index_spree_seller_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_seller_translations_on_locale ON public.spree_seller_translations USING btree (locale);


--
-- Name: index_spree_sellers_on_billing_address_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_sellers_on_billing_address_id ON public.spree_sellers USING btree (billing_address_id);


--
-- Name: index_spree_sellers_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_sellers_on_deleted_at ON public.spree_sellers USING btree (deleted_at);


--
-- Name: index_spree_sellers_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_sellers_on_store_id ON public.spree_sellers USING btree (store_id);


--
-- Name: index_spree_sellers_on_store_id_and_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_sellers_on_store_id_and_slug ON public.spree_sellers USING btree (store_id, slug);


--
-- Name: index_spree_sellers_on_store_id_and_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_sellers_on_store_id_and_status ON public.spree_sellers USING btree (store_id, status);


--
-- Name: index_spree_shipping_labels_on_active_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_shipping_labels_on_active_owner ON public.spree_shipping_labels USING btree (owner_type, owner_id) WHERE ((status)::text <> 'refunded'::text);


--
-- Name: index_spree_shipping_labels_on_integration_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_shipping_labels_on_integration_id ON public.spree_shipping_labels USING btree (integration_id);


--
-- Name: index_spree_shipping_labels_on_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_shipping_labels_on_owner ON public.spree_shipping_labels USING btree (owner_type, owner_id);


--
-- Name: index_spree_shipping_labels_on_owner_type_and_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_shipping_labels_on_owner_type_and_owner_id ON public.spree_shipping_labels USING btree (owner_type, owner_id);


--
-- Name: index_spree_shipping_labels_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_shipping_labels_on_store_id ON public.spree_shipping_labels USING btree (store_id);


--
-- Name: index_spree_shipping_method_categories_on_shipping_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_shipping_method_categories_on_shipping_category_id ON public.spree_shipping_method_categories USING btree (shipping_category_id);


--
-- Name: index_spree_shipping_method_categories_on_shipping_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_shipping_method_categories_on_shipping_method_id ON public.spree_shipping_method_categories USING btree (shipping_method_id);


--
-- Name: index_spree_state_changes_on_stateful_id_and_stateful_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_state_changes_on_stateful_id_and_stateful_type ON public.spree_state_changes USING btree (stateful_id, stateful_type);


--
-- Name: index_spree_states_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_states_on_country_id ON public.spree_states USING btree (country_id);


--
-- Name: index_spree_states_on_country_id_and_abbr; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_states_on_country_id_and_abbr ON public.spree_states USING btree (country_id, abbr);


--
-- Name: index_spree_stock_levels_on_backorderable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_levels_on_backorderable ON public.spree_stock_levels USING btree (backorderable);


--
-- Name: index_spree_stock_levels_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_levels_on_deleted_at ON public.spree_stock_levels USING btree (deleted_at);


--
-- Name: index_spree_stock_levels_on_stock_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_levels_on_stock_location_id ON public.spree_stock_levels USING btree (stock_location_id);


--
-- Name: index_spree_stock_levels_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_levels_on_variant_id ON public.spree_stock_levels USING btree (variant_id);


--
-- Name: index_spree_stock_levels_unique_without_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_stock_levels_unique_without_deleted_at ON public.spree_stock_levels USING btree (variant_id, stock_location_id) WHERE (deleted_at IS NULL);


--
-- Name: index_spree_stock_locations_on_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_active ON public.spree_stock_locations USING btree (active);


--
-- Name: index_spree_stock_locations_on_backorderable_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_backorderable_default ON public.spree_stock_locations USING btree (backorderable_default);


--
-- Name: index_spree_stock_locations_on_country_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_country_id ON public.spree_stock_locations USING btree (country_id);


--
-- Name: index_spree_stock_locations_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_deleted_at ON public.spree_stock_locations USING btree (deleted_at);


--
-- Name: index_spree_stock_locations_on_kind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_kind ON public.spree_stock_locations USING btree (kind);


--
-- Name: index_spree_stock_locations_on_pickup_enabled; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_pickup_enabled ON public.spree_stock_locations USING btree (pickup_enabled);


--
-- Name: index_spree_stock_locations_on_propagate_all_variants; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_propagate_all_variants ON public.spree_stock_locations USING btree (propagate_all_variants);


--
-- Name: index_spree_stock_locations_on_returns_enabled; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_returns_enabled ON public.spree_stock_locations USING btree (returns_enabled);


--
-- Name: index_spree_stock_locations_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_seller_id ON public.spree_stock_locations USING btree (seller_id);


--
-- Name: index_spree_stock_locations_on_state_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_state_id ON public.spree_stock_locations USING btree (state_id);


--
-- Name: index_spree_stock_locations_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_locations_on_store_id ON public.spree_stock_locations USING btree (store_id);


--
-- Name: index_spree_stock_movements_on_exchange_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_exchange_id ON public.spree_stock_movements USING btree (exchange_id);


--
-- Name: index_spree_stock_movements_on_fulfillment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_fulfillment_id ON public.spree_stock_movements USING btree (fulfillment_id);


--
-- Name: index_spree_stock_movements_on_kind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_kind ON public.spree_stock_movements USING btree (kind);


--
-- Name: index_spree_stock_movements_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_order_id ON public.spree_stock_movements USING btree (order_id);


--
-- Name: index_spree_stock_movements_on_purchase_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_purchase_order_id ON public.spree_stock_movements USING btree (purchase_order_id);


--
-- Name: index_spree_stock_movements_on_return_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_return_id ON public.spree_stock_movements USING btree (return_id);


--
-- Name: index_spree_stock_movements_on_stock_level_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_stock_level_id ON public.spree_stock_movements USING btree (stock_level_id);


--
-- Name: index_spree_stock_movements_on_stock_level_id_and_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_stock_level_id_and_created_at ON public.spree_stock_movements USING btree (stock_level_id, created_at);


--
-- Name: index_spree_stock_movements_on_stock_receipt_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_stock_receipt_id ON public.spree_stock_movements USING btree (stock_receipt_id);


--
-- Name: index_spree_stock_movements_on_stock_transfer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_movements_on_stock_transfer_id ON public.spree_stock_movements USING btree (stock_transfer_id);


--
-- Name: index_spree_stock_receipt_items_on_line; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_receipt_items_on_line ON public.spree_stock_receipt_items USING btree (line_type, line_id);


--
-- Name: index_spree_stock_receipt_items_on_stock_receipt_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_receipt_items_on_stock_receipt_id ON public.spree_stock_receipt_items USING btree (stock_receipt_id);


--
-- Name: index_spree_stock_receipts_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_stock_receipts_on_number ON public.spree_stock_receipts USING btree (number);


--
-- Name: index_spree_stock_receipts_on_receivable; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_receipts_on_receivable ON public.spree_stock_receipts USING btree (receivable_type, receivable_id);


--
-- Name: index_spree_stock_receipts_on_received_by_actor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_receipts_on_received_by_actor ON public.spree_stock_receipts USING btree (received_by_type, received_by_id);


--
-- Name: index_spree_stock_receipts_on_received_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_receipts_on_received_by_id ON public.spree_stock_receipts USING btree (received_by_id);


--
-- Name: index_spree_stock_receipts_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_receipts_on_store_id ON public.spree_stock_receipts USING btree (store_id);


--
-- Name: index_spree_stock_reservations_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_reservations_on_cart_id ON public.spree_stock_reservations USING btree (cart_id);


--
-- Name: index_spree_stock_reservations_on_expires_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_reservations_on_expires_at ON public.spree_stock_reservations USING btree (expires_at);


--
-- Name: index_spree_stock_reservations_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_reservations_on_line_item_id ON public.spree_stock_reservations USING btree (line_item_id);


--
-- Name: index_spree_stock_reservations_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_reservations_on_order_id ON public.spree_stock_reservations USING btree (order_id);


--
-- Name: index_spree_stock_transfer_items_on_stock_transfer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_transfer_items_on_stock_transfer_id ON public.spree_stock_transfer_items USING btree (stock_transfer_id);


--
-- Name: index_spree_stock_transfer_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_transfer_items_on_variant_id ON public.spree_stock_transfer_items USING btree (variant_id);


--
-- Name: index_spree_stock_transfers_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_transfers_on_deleted_at ON public.spree_stock_transfers USING btree (deleted_at);


--
-- Name: index_spree_stock_transfers_on_destination_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_transfers_on_destination_location_id ON public.spree_stock_transfers USING btree (destination_location_id);


--
-- Name: index_spree_stock_transfers_on_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_stock_transfers_on_number ON public.spree_stock_transfers USING btree (number);


--
-- Name: index_spree_stock_transfers_on_source_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_transfers_on_source_location_id ON public.spree_stock_transfers USING btree (source_location_id);


--
-- Name: index_spree_stock_transfers_on_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_transfers_on_status ON public.spree_stock_transfers USING btree (status);


--
-- Name: index_spree_stock_transfers_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stock_transfers_on_store_id ON public.spree_stock_transfers USING btree (store_id);


--
-- Name: index_spree_store_credit_events_on_store_credit_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_credit_events_on_store_credit_id ON public.spree_store_credit_events USING btree (store_credit_id);


--
-- Name: index_spree_store_credit_types_on_priority; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_credit_types_on_priority ON public.spree_store_credit_types USING btree (priority);


--
-- Name: index_spree_store_credits_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_credits_on_customer_id ON public.spree_store_credits USING btree (customer_id);


--
-- Name: index_spree_store_credits_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_credits_on_deleted_at ON public.spree_store_credits USING btree (deleted_at);


--
-- Name: index_spree_store_credits_on_refunded_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_credits_on_refunded_order_id ON public.spree_store_credits USING btree (refunded_order_id);


--
-- Name: index_spree_store_credits_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_credits_on_store_id ON public.spree_store_credits USING btree (store_id);


--
-- Name: index_spree_store_credits_on_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_credits_on_type_id ON public.spree_store_credits USING btree (type_id);


--
-- Name: index_spree_store_translations_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_translations_on_deleted_at ON public.spree_store_translations USING btree (deleted_at);


--
-- Name: index_spree_store_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_store_translations_on_locale ON public.spree_store_translations USING btree (locale);


--
-- Name: index_spree_store_translations_on_spree_store_id_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_store_translations_on_spree_store_id_locale ON public.spree_store_translations USING btree (spree_store_id, locale);


--
-- Name: index_spree_stores_on_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_stores_on_code ON public.spree_stores USING btree (code);


--
-- Name: index_spree_stores_on_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stores_on_default ON public.spree_stores USING btree ("default");


--
-- Name: index_spree_stores_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stores_on_deleted_at ON public.spree_stores USING btree (deleted_at);


--
-- Name: index_spree_stores_on_setup_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_stores_on_setup_token ON public.spree_stores USING btree (setup_token);


--
-- Name: index_spree_stores_on_url; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stores_on_url ON public.spree_stores USING btree (url);


--
-- Name: index_spree_stripe_payment_intents_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stripe_payment_intents_on_order_id ON public.spree_stripe_payment_intents USING btree (order_id);


--
-- Name: index_spree_stripe_payment_intents_on_order_id_and_stripe_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_stripe_payment_intents_on_order_id_and_stripe_id ON public.spree_stripe_payment_intents USING btree (order_id, stripe_id);


--
-- Name: index_spree_stripe_payment_intents_on_payment_method_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_stripe_payment_intents_on_payment_method_id ON public.spree_stripe_payment_intents USING btree (payment_method_id);


--
-- Name: index_spree_stripe_webhook_keys_on_signing_secret; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_stripe_webhook_keys_on_signing_secret ON public.spree_stripe_webhook_keys USING btree (signing_secret);


--
-- Name: index_spree_stripe_webhook_keys_on_stripe_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_stripe_webhook_keys_on_stripe_id ON public.spree_stripe_webhook_keys USING btree (stripe_id);


--
-- Name: index_spree_suppliers_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_suppliers_on_deleted_at ON public.spree_suppliers USING btree (deleted_at);


--
-- Name: index_spree_suppliers_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_suppliers_on_store_id ON public.spree_suppliers USING btree (store_id);


--
-- Name: index_spree_suppliers_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_suppliers_on_store_id_and_name ON public.spree_suppliers USING btree (store_id, name);


--
-- Name: index_spree_taggings_on_context; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_context ON public.spree_taggings USING btree (context);


--
-- Name: index_spree_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_tag_id ON public.spree_taggings USING btree (tag_id);


--
-- Name: index_spree_taggings_on_taggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_taggable_id ON public.spree_taggings USING btree (taggable_id);


--
-- Name: index_spree_taggings_on_taggable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_taggable_type ON public.spree_taggings USING btree (taggable_type);


--
-- Name: index_spree_taggings_on_taggable_type_and_taggable_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_taggable_type_and_taggable_id ON public.spree_taggings USING btree (taggable_type, taggable_id);


--
-- Name: index_spree_taggings_on_tagger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_tagger_id ON public.spree_taggings USING btree (tagger_id);


--
-- Name: index_spree_taggings_on_tagger_id_and_tagger_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_tagger_id_and_tagger_type ON public.spree_taggings USING btree (tagger_id, tagger_type);


--
-- Name: index_spree_taggings_on_tagger_type_and_tagger_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_tagger_type_and_tagger_id ON public.spree_taggings USING btree (tagger_type, tagger_id);


--
-- Name: index_spree_taggings_on_tenant; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taggings_on_tenant ON public.spree_taggings USING btree (tenant);


--
-- Name: index_spree_tags_on_lower_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tags_on_lower_name ON public.spree_tags USING btree (lower((name)::text) varchar_pattern_ops);


--
-- Name: index_spree_tags_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_tags_on_name ON public.spree_tags USING btree (name);


--
-- Name: index_spree_tax_categories_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_categories_on_deleted_at ON public.spree_tax_categories USING btree (deleted_at);


--
-- Name: index_spree_tax_categories_on_is_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_categories_on_is_default ON public.spree_tax_categories USING btree (is_default);


--
-- Name: index_spree_tax_categories_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_categories_on_store_id ON public.spree_tax_categories USING btree (store_id);


--
-- Name: index_spree_tax_categories_on_store_id_and_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_tax_categories_on_store_id_and_name ON public.spree_tax_categories USING btree (store_id, name) WHERE (deleted_at IS NULL);


--
-- Name: index_spree_tax_exemption_certificates_on_company_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_exemption_certificates_on_company_id ON public.spree_tax_exemption_certificates USING btree (company_id);


--
-- Name: index_spree_tax_exemption_certificates_on_verified_by_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_exemption_certificates_on_verified_by_id ON public.spree_tax_exemption_certificates USING btree (verified_by_id);


--
-- Name: index_spree_tax_identifiers_on_owner; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_identifiers_on_owner ON public.spree_tax_identifiers USING btree (owner_type, owner_id);


--
-- Name: index_spree_tax_identifiers_on_owner_and_kind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_tax_identifiers_on_owner_and_kind ON public.spree_tax_identifiers USING btree (owner_type, owner_id, kind);


--
-- Name: index_spree_tax_lines_on_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_lines_on_cart_id ON public.spree_tax_lines USING btree (cart_id);


--
-- Name: index_spree_tax_lines_on_country_code_and_state_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_lines_on_country_code_and_state_code ON public.spree_tax_lines USING btree (country_code, state_code);


--
-- Name: index_spree_tax_lines_on_fee_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_lines_on_fee_id ON public.spree_tax_lines USING btree (fee_id);


--
-- Name: index_spree_tax_lines_on_fulfillment_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_lines_on_fulfillment_id ON public.spree_tax_lines USING btree (fulfillment_id);


--
-- Name: index_spree_tax_lines_on_line_item_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_lines_on_line_item_id ON public.spree_tax_lines USING btree (line_item_id);


--
-- Name: index_spree_tax_lines_on_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_lines_on_order_id ON public.spree_tax_lines USING btree (order_id);


--
-- Name: index_spree_tax_lines_on_tax_rate_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_lines_on_tax_rate_id ON public.spree_tax_lines USING btree (tax_rate_id);


--
-- Name: index_spree_tax_lines_on_taxability_reason; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_lines_on_taxability_reason ON public.spree_tax_lines USING btree (taxability_reason);


--
-- Name: index_spree_tax_rates_on_country_code_and_state_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_rates_on_country_code_and_state_code ON public.spree_tax_rates USING btree (country_code, state_code);


--
-- Name: index_spree_tax_rates_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_rates_on_deleted_at ON public.spree_tax_rates USING btree (deleted_at);


--
-- Name: index_spree_tax_rates_on_included_in_price; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_rates_on_included_in_price ON public.spree_tax_rates USING btree (included_in_price);


--
-- Name: index_spree_tax_rates_on_show_rate_in_label; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_rates_on_show_rate_in_label ON public.spree_tax_rates USING btree (show_rate_in_label);


--
-- Name: index_spree_tax_rates_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_rates_on_store_id ON public.spree_tax_rates USING btree (store_id);


--
-- Name: index_spree_tax_rates_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_rates_on_tax_category_id ON public.spree_tax_rates USING btree (tax_category_id);


--
-- Name: index_spree_tax_rates_on_zone_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_tax_rates_on_zone_id ON public.spree_tax_rates USING btree (zone_id);


--
-- Name: index_spree_taxon_rules_on_taxon_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taxon_rules_on_taxon_id ON public.spree_taxon_rules USING btree (taxon_id);


--
-- Name: index_spree_taxonomies_on_name_and_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_taxonomies_on_name_and_store_id ON public.spree_taxonomies USING btree (name, store_id);


--
-- Name: index_spree_taxonomies_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taxonomies_on_position ON public.spree_taxonomies USING btree ("position");


--
-- Name: index_spree_taxonomies_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taxonomies_on_store_id ON public.spree_taxonomies USING btree (store_id);


--
-- Name: index_spree_taxonomy_translations_on_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_taxonomy_translations_on_locale ON public.spree_taxonomy_translations USING btree (locale);


--
-- Name: index_spree_taxonomy_translations_on_spree_taxonomy_id_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_taxonomy_translations_on_spree_taxonomy_id_locale ON public.spree_taxonomy_translations USING btree (spree_taxonomy_id, locale);


--
-- Name: index_spree_trackers_on_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_trackers_on_active ON public.spree_trackers USING btree (active);


--
-- Name: index_spree_user_identities_on_provider_uid_user_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_user_identities_on_provider_uid_user_type ON public.spree_user_identities USING btree (provider, uid, user_type);


--
-- Name: index_spree_user_identities_on_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_user_identities_on_user ON public.spree_user_identities USING btree (user_type, user_id);


--
-- Name: index_spree_variants_on_barcode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_barcode ON public.spree_variants USING btree (barcode);


--
-- Name: index_spree_variants_on_carton_package_type_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_carton_package_type_id ON public.spree_variants USING btree (carton_package_type_id);


--
-- Name: index_spree_variants_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_deleted_at ON public.spree_variants USING btree (deleted_at);


--
-- Name: index_spree_variants_on_delivery_profile_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_delivery_profile_id ON public.spree_variants USING btree (delivery_profile_id);


--
-- Name: index_spree_variants_on_discontinue_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_discontinue_on ON public.spree_variants USING btree (discontinue_on);


--
-- Name: index_spree_variants_on_is_master; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_is_master ON public.spree_variants USING btree (is_master);


--
-- Name: index_spree_variants_on_media_count; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_media_count ON public.spree_variants USING btree (media_count);


--
-- Name: index_spree_variants_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_position ON public.spree_variants USING btree ("position");


--
-- Name: index_spree_variants_on_primary_media_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_primary_media_id ON public.spree_variants USING btree (primary_media_id);


--
-- Name: index_spree_variants_on_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_product_id ON public.spree_variants USING btree (product_id);


--
-- Name: index_spree_variants_on_seller_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_seller_id ON public.spree_variants USING btree (seller_id);


--
-- Name: index_spree_variants_on_sku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_sku ON public.spree_variants USING btree (sku);


--
-- Name: index_spree_variants_on_tax_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_tax_category_id ON public.spree_variants USING btree (tax_category_id);


--
-- Name: index_spree_variants_on_track_inventory; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_variants_on_track_inventory ON public.spree_variants USING btree (track_inventory);


--
-- Name: index_spree_webhook_deliveries_on_delivered_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_webhook_deliveries_on_delivered_at ON public.spree_webhook_deliveries USING btree (delivered_at);


--
-- Name: index_spree_webhook_deliveries_on_endpoint_and_event; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_webhook_deliveries_on_endpoint_and_event ON public.spree_webhook_deliveries USING btree (webhook_endpoint_id, event_id) WHERE (event_id IS NOT NULL);


--
-- Name: index_spree_webhook_deliveries_on_event_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_webhook_deliveries_on_event_name ON public.spree_webhook_deliveries USING btree (event_name);


--
-- Name: index_spree_webhook_deliveries_on_response_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_webhook_deliveries_on_response_code ON public.spree_webhook_deliveries USING btree (response_code);


--
-- Name: index_spree_webhook_deliveries_on_success; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_webhook_deliveries_on_success ON public.spree_webhook_deliveries USING btree (success);


--
-- Name: index_spree_webhook_deliveries_on_webhook_endpoint_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_webhook_deliveries_on_webhook_endpoint_id ON public.spree_webhook_deliveries USING btree (webhook_endpoint_id);


--
-- Name: index_spree_webhook_endpoints_on_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_webhook_endpoints_on_active ON public.spree_webhook_endpoints USING btree (active);


--
-- Name: index_spree_webhook_endpoints_on_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_webhook_endpoints_on_deleted_at ON public.spree_webhook_endpoints USING btree (deleted_at);


--
-- Name: index_spree_webhook_endpoints_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_webhook_endpoints_on_store_id ON public.spree_webhook_endpoints USING btree (store_id);


--
-- Name: index_spree_wishlist_items_on_variant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_wishlist_items_on_variant_id ON public.spree_wishlist_items USING btree (variant_id);


--
-- Name: index_spree_wishlist_items_on_variant_id_and_wishlist_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_wishlist_items_on_variant_id_and_wishlist_id ON public.spree_wishlist_items USING btree (variant_id, wishlist_id);


--
-- Name: index_spree_wishlist_items_on_wishlist_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_wishlist_items_on_wishlist_id ON public.spree_wishlist_items USING btree (wishlist_id);


--
-- Name: index_spree_wishlists_on_customer_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_wishlists_on_customer_id ON public.spree_wishlists USING btree (customer_id);


--
-- Name: index_spree_wishlists_on_customer_id_and_is_default; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_wishlists_on_customer_id_and_is_default ON public.spree_wishlists USING btree (customer_id, is_default);


--
-- Name: index_spree_wishlists_on_store_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_wishlists_on_store_id ON public.spree_wishlists USING btree (store_id);


--
-- Name: index_spree_wishlists_on_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_wishlists_on_token ON public.spree_wishlists USING btree (token);


--
-- Name: index_spree_zone_members_on_zone_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_zone_members_on_zone_id ON public.spree_zone_members USING btree (zone_id);


--
-- Name: index_spree_zone_members_uniqueness; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_spree_zone_members_uniqueness ON public.spree_zone_members USING btree (zone_id, zoneable_type, zoneable_id);


--
-- Name: index_spree_zones_on_default_tax; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_zones_on_default_tax ON public.spree_zones USING btree (default_tax);


--
-- Name: index_spree_zones_on_kind; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_spree_zones_on_kind ON public.spree_zones USING btree (kind);


--
-- Name: index_stock_movements_on_originator_id_and_originator_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_stock_movements_on_originator_id_and_originator_type ON public.spree_stock_movements USING btree (originator_id, originator_type);


--
-- Name: index_taxons_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taxons_on_parent_id ON public.spree_categories USING btree (parent_id);


--
-- Name: index_taxons_on_permalink; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taxons_on_permalink ON public.spree_categories USING btree (permalink);


--
-- Name: index_taxons_on_taxonomy_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_taxons_on_taxonomy_id ON public.spree_categories USING btree (taxonomy_id);


--
-- Name: payment_mentod_id_store_id_unique_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX payment_mentod_id_store_id_unique_index ON public.spree_payment_methods_stores USING btree (payment_method_id, store_id);


--
-- Name: spree_delivery_rates_join_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spree_delivery_rates_join_index ON public.spree_delivery_rates USING btree (fulfillment_id, delivery_method_id);


--
-- Name: spree_store_credit_events_originator; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spree_store_credit_events_originator ON public.spree_store_credit_events USING btree (originator_id, originator_type);


--
-- Name: spree_store_credits_originator; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spree_store_credits_originator ON public.spree_store_credits USING btree (originator_id, originator_type);


--
-- Name: spree_taggings_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX spree_taggings_idx ON public.spree_taggings USING btree (tag_id, taggable_id, taggable_type, context, tagger_id, tagger_type);


--
-- Name: spree_taggings_idy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spree_taggings_idy ON public.spree_taggings USING btree (taggable_id, taggable_type, tagger_id, context);


--
-- Name: spree_taggings_taggable_context_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX spree_taggings_taggable_context_idx ON public.spree_taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: stock_level_by_loc_and_var_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX stock_level_by_loc_and_var_id ON public.spree_stock_levels USING btree (stock_location_id, variant_id);


--
-- Name: stock_level_by_loc_var_id_deleted_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX stock_level_by_loc_var_id_deleted_at ON public.spree_stock_levels USING btree (stock_location_id, variant_id, deleted_at);


--
-- Name: unique_option_type_id_per_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_option_type_id_per_locale ON public.spree_option_type_translations USING btree (spree_option_type_id, locale);


--
-- Name: unique_option_value_id_per_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_option_value_id_per_locale ON public.spree_option_value_translations USING btree (spree_option_value_id, locale);


--
-- Name: unique_product_id_per_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_product_id_per_locale ON public.spree_product_translations USING btree (spree_product_id, locale);


--
-- Name: unique_slug_per_locale; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_slug_per_locale ON public.spree_product_translations USING btree (locale, slug);


--
-- Name: unique_spree_shipping_method_categories; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_spree_shipping_method_categories ON public.spree_shipping_method_categories USING btree (shipping_category_id, shipping_method_id);


--
-- Name: spree_store_translations fk_rails_197d0c4bbd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_store_translations
    ADD CONSTRAINT fk_rails_197d0c4bbd FOREIGN KEY (spree_store_id) REFERENCES public.spree_stores(id);


--
-- Name: solid_queue_recurring_executions fk_rails_318a5533ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_recurring_executions
    ADD CONSTRAINT fk_rails_318a5533ed FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: spree_category_translations fk_rails_32e85b445d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_category_translations
    ADD CONSTRAINT fk_rails_32e85b445d FOREIGN KEY (spree_category_id) REFERENCES public.spree_categories(id);


--
-- Name: solid_queue_failed_executions fk_rails_39bbc7a631; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_failed_executions
    ADD CONSTRAINT fk_rails_39bbc7a631 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: solid_queue_blocked_executions fk_rails_4cd34e2228; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_blocked_executions
    ADD CONSTRAINT fk_rails_4cd34e2228 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: spree_option_value_translations fk_rails_70138a1aef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_value_translations
    ADD CONSTRAINT fk_rails_70138a1aef FOREIGN KEY (spree_option_value_id) REFERENCES public.spree_option_values(id);


--
-- Name: spree_product_translations fk_rails_7eb5601038; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_product_translations
    ADD CONSTRAINT fk_rails_7eb5601038 FOREIGN KEY (spree_product_id) REFERENCES public.spree_products(id);


--
-- Name: solid_queue_ready_executions fk_rails_81fcbd66af; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_ready_executions
    ADD CONSTRAINT fk_rails_81fcbd66af FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: solid_queue_claimed_executions fk_rails_9cfe4d4944; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_claimed_executions
    ADD CONSTRAINT fk_rails_9cfe4d4944 FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: spree_payment_sources fk_rails_a344a41636; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_payment_sources
    ADD CONSTRAINT fk_rails_a344a41636 FOREIGN KEY (payment_method_id) REFERENCES public.spree_payment_methods(id);


--
-- Name: spree_taxonomy_translations fk_rails_b306143421; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_taxonomy_translations
    ADD CONSTRAINT fk_rails_b306143421 FOREIGN KEY (spree_taxonomy_id) REFERENCES public.spree_taxonomies(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: solid_queue_scheduled_executions fk_rails_c4316f352d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solid_queue_scheduled_executions
    ADD CONSTRAINT fk_rails_c4316f352d FOREIGN KEY (job_id) REFERENCES public.solid_queue_jobs(id) ON DELETE CASCADE;


--
-- Name: spree_option_type_translations fk_rails_ef425c2e25; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spree_option_type_translations
    ADD CONSTRAINT fk_rails_ef425c2e25 FOREIGN KEY (spree_option_type_id) REFERENCES public.spree_option_types(id);


--
-- PostgreSQL database dump complete
--

\unrestrict pSFV2KPyaJ9y1tK6jIruAjdEQTrnVHtcv3aZpSWHOlhmud3NdjmnVwOxSPZdy1Y

